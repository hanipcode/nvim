return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 10000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = true,
			custom_highlights = function(colors)
				return {
					SnacksIndent = { fg = "#292c3c" },
				}
			end,
		})
		vim.cmd.colorscheme("catppuccin")
		-- vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "color", bg = "color", bold = true, italic = false })
	end,
}
