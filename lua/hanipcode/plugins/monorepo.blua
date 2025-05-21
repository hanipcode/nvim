return {
	"imNel/monorepo.nvim",
	config = function()
		require("monorepo").setup({
			-- Your config here!
		})
		vim.keymap.set("n", "<leader>pm", function()
			require("telescope").extensions.monorepo.monorepo()
		end)
		vim.keymap.set("n", "<leader>ma", function()
			require("monorepo").toggle_project()
		end)
	end,
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
}
