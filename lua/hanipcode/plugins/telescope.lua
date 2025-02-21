return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
					n = {
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
				path_display = { "smart" },
				layout_config = {
					vertical = { height = 0.8 },
					horizontal = { height = 0.8 },
				},
			},
		})
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
		vim.keymap.set("n", "<leader>pg", builtin.git_files, {})
		vim.keymap.set("n", "<leader>pws", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set("n", "<leader>pWs", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)
		local defaultText = ""
		vim.keymap.set("n", "<leader>ps", function()
			vim.ui.input({
				prompt = ">Grep",
				default = defaultText,
				completion = nil,
			}, function(word)
				defaultText = word
				builtin.grep_string({ search = word })
			end)
		end, { silent = true, noremap = true })
		vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>p!", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
	end,
}
