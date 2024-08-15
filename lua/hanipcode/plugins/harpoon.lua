return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		-- REQUIRED
		harpoon:setup()
		-- REQUIRED

		vim.keymap.set("n", "<leader>ml", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<leader>mm", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		vim.keymap.set("n", "<leader>ma", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<leader>ms", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<leader>md", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<leader>mf", function()
			harpoon:list():select(4)
		end)

		vim.keymap.set("n", "<leader>mka", function()
			harpoon:list():replace_at(1)
		end)
		vim.keymap.set("n", "<leader>mks", function()
			harpoon:list():replace_at(2)
		end)
		vim.keymap.set("n", "<leader>mkd", function()
			harpoon:list():replace_at(3)
		end)
		vim.keymap.set("n", "<leader>mkf", function()
			harpoon:list():replace_at(4)
		end)

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<leader>mp", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<leader>mn", function()
			harpoon:list():next()
		end)
	end,
}
