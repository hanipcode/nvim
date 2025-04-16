return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		-- REQUIRED
		local h = require("hanipcode.local.harpooned")
		harpoon:setup({
			default = {
				display = function(list_item)
					local exploded = h.path_exploder(list_item.value)
					if exploded.is_truncated then
						return exploded.short_path .. " (" .. exploded.pre .. ")"
					end
					return exploded.short_path
				end,
			},
		})
		-- REQUIRED
		--

		vim.keymap.set("n", "<leader>kw", function()
			harpoon:list():add()
		end)

		vim.keymap.set("n", "<leader>kq", function()
			h.share_harpoon_file()
		end)

		vim.keymap.set("n", "<leader>kk", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)
		vim.keymap.set("n", "<leader>1", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<leader>2", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<leader>3", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<leader>4", function()
			harpoon:list():select(4)
		end)
		vim.keymap.set("n", "<leader>5", function()
			harpoon:list():select(5)
		end)
		--
		-- vim.keymap.set({ "n" }, "<leader>kla", function()
		-- 	harpoon:list():replace_at(1)
		-- end)
		--
		-- vim.keymap.set({ "n" }, "<leader>kls", function()
		-- 	harpoon:list():replace_at(2)
		-- end)
		--
		-- vim.keymap.set({ "n" }, "<leader>kld", function()
		-- 	harpoon:list():replace_at(3)
		-- end)
		--
		-- vim.keymap.set({ "n" }, "<leader>klf", function()
		-- 	harpoon:list():replace_at(4)
		-- end)
		--
		-- local opts = { noremap = true, silent = true }
		--
		-- vim.keymap.set({ "n", "i" }, "<C-z>", function()
		-- 	harpoon:list():select(1)
		-- end)
		--
		-- vim.keymap.set({ "n", "i" }, "<C-x>", function()
		-- 	harpoon:list():select(2)
		-- end)
		--
		-- vim.keymap.set({ "n", "i" }, "<C-c>", function()
		-- 	harpoon:list():select(3)
		-- end)
		--
		-- vim.keymap.set({ "n", "i" }, "<C-v>", function()
		-- 	harpoon:list():select(4)
		-- end)
		--
		-- vim.keymap.set({ "n" }, "<leader><C-z>", function()
		-- 	harpoon:list():replace_at(1)
		-- end)
		--
		-- vim.keymap.set({ "n" }, "<leader><C-x>", function()
		-- 	harpoon:list():replace_at(2)
		-- end)
		--
		-- vim.keymap.set({ "n" }, "<leader><C-c>", function()
		-- 	harpoon:list():replace_at(3)
		-- end)
		--
		-- vim.keymap.set({ "n" }, "<leader><C-v>", function()
		-- 	harpoon:list():replace_at(4)
		-- end)
		-- -- Toggle previous & next buffers stored within Harpoon list
		-- vim.keymap.set("n", "<leader>kp", function()
		-- 	harpoon:list():prev()
		-- end)
		-- vim.keymap.set("n", "<leader>kn", function()
		-- 	harpoon:list():next()
		-- end)
	end,
}
