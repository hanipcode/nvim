local adapter = require("hanipcode.local.adapter")

return {
	"olimorris/codecompanion.nvim",
	config = function()
		require("codecompanion").setup({
			strategies = {
				chat = {
					slash_commands = adapter.get_slash_commands(),
					adapter = "openrouter",
				},
				inline = {
					adapter = "openrouter",
				},
			},
			adapters = {
				openrouter = adapter.get_adapter(),
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>ck", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
		vim.keymap.set(
			{ "n", "v" },
			"<leader>a",
			"<cmd>CodeCompanionChat Toggle<cr>",
			{ noremap = true, silent = true }
		)
		vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

		vim.keymap.set("n", "<leader>cs", adapter.select_model, { desc = "Select Gemini Model" })
		-- Expand 'cc' into 'CodeCompanion' in the command line
		vim.cmd([[cab cc CodeCompanion]])
	end,

	dependencies = {
		"nvim-lua/plenary.nvim",
		"hakonharnes/img-clip.nvim",
		"nvim-treesitter/nvim-treesitter",
		"j-hui/fidget.nvim",
	},
	init = function()
		require("hanipcode.plugins.codecompanion.fidget_spinner"):init()
	end,
}
