local M = {}

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
function M.slash_add_image_url(chat)
	local function callback(input)
		if input then
			local id = "<image_url>" .. input .. "</image_url>"
			local new_message = {
				{
					type = "text",
					text = "the user is sharing this image with you. be ready for a query or task regarding this image",
				},
				{
					type = "image_url",
					image_url = {
						url = input, -- truncated
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
	end
	vim.ui.input({ prompt = "> Enter image url", default = "", completion = "dir" }, callback)
end

function M.get_slash_commands()
	return {
		["image_url"] = {
			callback = M.slash_add_image_url,
			description = "add image via url",
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
