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
		vim.keymap.set("n", "<leader>kg", function()
			harpoon:list():select(5)
		end)

		vim.keymap.set({ "n" }, "<leader>kla", function()
			harpoon:list():replace_at(1)
		end)

		vim.keymap.set({ "n" }, "<leader>kls", function()
			harpoon:list():replace_at(2)
		end)

		vim.keymap.set({ "n" }, "<leader>kld", function()
			harpoon:list():replace_at(3)
		end)

		vim.keymap.set({ "n" }, "<leader>klf", function()
			harpoon:list():replace_at(4)
		end)

		local opts = { noremap = true, silent = true }

		vim.keymap.set({ "n", "i" }, "<C-z>", function()
			harpoon:list():select(1)
		end)

		vim.keymap.set({ "n", "i" }, "<C-x>", function()
			harpoon:list():select(2)
		end)

		vim.keymap.set({ "n", "i" }, "<C-c>", function()
			harpoon:list():select(3)
		end)

		vim.keymap.set({ "n", "i" }, "<C-v>", function()
			harpoon:list():select(4)
		end)

		vim.keymap.set({ "n" }, "<leader><C-z>", function()
			harpoon:list():replace_at(1)
		end)

		vim.keymap.set({ "n" }, "<leader><C-x>", function()
			harpoon:list():replace_at(2)
		end)

		vim.keymap.set({ "n" }, "<leader><C-c>", function()
			harpoon:list():replace_at(3)
		end)

		vim.keymap.set({ "n" }, "<leader><C-v>", function()
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
