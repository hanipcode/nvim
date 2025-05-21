local M = {}

local fmt = string.format
local default_model = "google/gemini-2.0-flash-001"
local available_models = {
	"google/gemini-2.0-flash-001",
	"google/gemini-2.5-pro-preview-03-25",
	"anthropic/claude-3.7-sonnet",
	"anthropic/claude-3.5-sonnet",
	"openai/gpt-4o-mini",
}
local current_model = default_model

function M.select_model()
	vim.ui.select(available_models, {
		prompt = "Select  Model:",
	}, function(choice)
		if choice then
			current_model = choice
			vim.notify("Selected model: " .. current_model)
		end
	end)
end

---@param chat CodeCompanion.Chat
---@param id string
---@param input string
function M.add_image(chat, id, input)
	local new_message = {
		{
			type = "text",
			text = "the user is sharing this image with you. be ready for a query or task regarding this image",
		},
		{
			type = "image_url",
			image_url = {
				url = input,
			},
		},
	}

	local constants = require("codecompanion.config").config.constants
	chat:add_message({
		role = constants.USER_ROLE,
		content = vim.fn.json_encode(new_message),
	}, { reference = id, visible = false })

	chat.references:add({
		id = id,
		source = "adapter.image_url",
	})
end

---@Param chat CodeCompanion.Chat
function M.slash_paste_image(chat)
	local clipboard = require("img-clip.clipboard")
	local paste = require("img-clip.paste")
	if not clipboard.content_is_image() then
		vim.notify("clipboard content is not an image", vim.log.levels.WARN)
		return
	end
	local prefix = paste.get_base64_prefix()
	local base64res = clipboard.get_base64_encoded_image()
	local url = prefix .. base64res
	local hash = vim.fn.sha256(url)
	local id = "<pasted_image>" .. hash:sub(1, 16) .. "</pasted_image>"
	M.add_image(chat, id, url)
end

---@param chat CodeCompanion.Chat
function M.slash_add_image_url(chat)
	local function callback(input)
		if input then
			local id = "<image_url>" .. input .. "</image_url>"
			M.add_image(chat, id, input)
		end
	end
	vim.ui.input({ prompt = "> Enter image url", default = "", completion = "dir" }, callback)
end

function M.slash_md_reference(chat)
	local constants = require("codecompanion.config").config.constants
	---@type TextareaCallback
	local callback = function(first_line, full_text)
		local id = "<markdown>" .. first_line .. "</markdown>"
		local prompt = [[

			The user is sharing a markdown text with you, it can be a PRD, a description of a task, or even an openapi contract. 
      if it is description of a task or a product you should follow the description there and remind the user if some implementation is not adheere to the shared document.
      if it is openapi contract you should remember it and when implementing a form of rest api call use that as reference
      Here is the content of the file
    ]]
		local content = fmt(
			[[%s:

```%s
%s
```]],
			"markdown",
			prompt,
			full_text
		)
		chat:add_message({
			role = constants.USER_ROLE,
			content = content,
		}, { reference = id, visible = false })

		chat.references:add({
			id = id,
			source = "codecompanion.strategies.chat.slash_commands.file",
		})
	end

	local fun = require("hanipcode.local.fun")
	fun.open_textarea(callback)
end

function M.get_slash_commands()
	return {
		["image_url"] = {
			callback = M.slash_add_image_url,
			description = "add image via url",
		},
		["image_paste"] = {
			callback = M.slash_paste_image,
			description = "add image from clipboard",
		},
		["reference"] = {
			callback = M.slash_md_reference,
			description = "Add markdown reference",
		},
	}
end

function M.get_adapter()
	local openai = require("codecompanion.adapters.openai")
	return require("codecompanion.adapters").extend("openai_compatible", {
		env = {
			url = "https://openrouter.ai/api",
			api_key = "OPENROUTER_API_KEY",
			chat_url = "/v1/chat/completions",
		},
		handlers = {
			form_parameters = function(self, params, messages)
				local result = openai.handlers.form_parameters(self, params, messages)
				return result
			end,
			form_messages = function(self, messages)
				local result = openai.handlers.form_messages(self, messages)

				local fun = require("hanipcode.local.fun")
				fun.map(result.messages, function(v)
					local ok, json_res = pcall(function()
						return vim.fn.json_decode(v.content)
					end, "not a json")
					if ok then
						v.content = json_res
						return v
					end
					return v
				end)

				return result
			end,
		},
		schema = {
			model = {
				default = current_model,
			},
		},
	})
end

return M
