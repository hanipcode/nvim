vim.cmd("let g:netrw_liststyle = 3")
vim.g.netrw_banner = 0

-- Set leader key
vim.g.mapleader = " "

-- Set options
vim.o.ignorecase = true
vim.o.smartcase = true
-- line number
vim.o.number = true
vim.o.relativenumber = true
-- Indentation settings
vim.o.tabstop = 2 -- Number of spaces that a <Tab> counts for
vim.o.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.smartindent = true -- Enable smart indentation
vim.o.autoindent = true -- Copy indent from current line when starting a new line
vim.o.cursorline = true

vim.o.termguicolors = true
vim.o.background = "dark"
vim.o.signcolumn = "yes"

vim.o.backspace = "indent,eol,start"

vim.o.splitright = true
vim.o.splitbelow = true

vim.opt.updatetime = 50
vim.o.wrap = false
vim.opt.scrolloff = 16
vim.opt.incsearch = true
vim.opt.hlsearch = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
