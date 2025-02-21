return {
	"stevearc/oil.nvim",
	config = function()
		local oil = require("oil")
		oil.setup({
			default_file_explorer = true,
		})
		vim.keymap.set("n", "<leader>o", "", {
			noremap = true,
			silent = true,
			callback = function()
				oil.toggle_float()
			end,
		})
		local defaultDir = ""
		vim.keymap.set("n", "<leader>i", "", {
			noremap = true,
			silent = true,
			callback = function()
				vim.ui.input({
					prompt = ">Directories",
					default = defaultDir,
					completion = "dir",
				}, function(word)
					defaultDir = word
					oil.toggle_float(word)
				end)
			end,
		})
	end,
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" }, -- use if prefer nvim-web-devicons
}
