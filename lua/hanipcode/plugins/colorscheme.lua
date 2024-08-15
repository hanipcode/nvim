return { 
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 10000,
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato",
    });
    vim.cmd.colorscheme "catppuccin"

  end
}


