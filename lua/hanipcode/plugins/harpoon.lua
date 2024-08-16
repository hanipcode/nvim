return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		-- REQUIRED
		harpoon:setup()
		-- REQUIRED

		vim.keymap.set("n", "<leader>kj", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<leader>kk", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		vim.keymap.set("n", "<leader>ka", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<leader>ks", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<leader>kd", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<leader>kf", function()
			harpoon:list():select(4)
		end)

		vim.keymap.set("n", "<leader>kq", function()
			harpoon:list():replace_at(1)
		end)
		vim.keymap.set("n", "<leader>kw", function()
			harpoon:list():replace_at(2)
		end)
		vim.keymap.set("n", "<leader>ke", function()
			harpoon:list():replace_at(3)
		end)
		vim.keymap.set("n", "<leader>kr", function()
			harpoon:list():replace_at(4)
		end)

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<leader>kp", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<leader>kn", function()
			harpoon:list():next()
		end)
	end,
}
