return {
  'stevearc/oil.nvim',
  -- Optional dependencies
  config = function()
   local oil = require("oil")
   oil.setup({
     default_file_explorer = true,
   })
   vim.keymap.set('n', '<leader>o', '', {
     noremap = true,
     silent = true,
     callback = function()
       oil.toggle_float()
     end,
   })
  end,
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
