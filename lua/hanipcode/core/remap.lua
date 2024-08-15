-- Key mappings
local map = vim.api.nvim_set_keymap

-- Define getOpts function
local function getOpts()
	if vim.g.vscode then
		return {}
	else
		return { noremap = true, silent = true }
	end
end

-- Mappings using getOpts function
map("n", "<leader>q", ":bd<CR>", getOpts())
map("n", "<leader>w", "<cmd>close<CR>", getOpts())
map("n", "<C-d>", "<C-d>zz", getOpts())
map("n", "<C-u>", "<C-u>zz", getOpts())
map("n", "n", "nzzzv", getOpts())
map("n", "N", "Nzzzv", getOpts())
map("n", "<leader>cl", ":noh<CR><CR>", getOpts())
map("n", "<leader>y", '"+y', getOpts())
map("v", "<leader>y", '"+y', getOpts())
map("n", "<leader>pp", '"+gP', getOpts())
map("v", "<leader>pp", '"+gP', getOpts())
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
