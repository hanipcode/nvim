return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump(); vim.cmd("normal! zz") end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter(); vim.cmd("normal! zz") end, desc = "Flash Treesitter" },
    { "R", mode = { "o", "x", "n" }, function() require("flash").treesitter_search(); vim.cmd("normal! zz") end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c", "i" }, function() require("flash").toggle(); vim.cmd("normal! zz") end, desc = "Toggle Flash Search" },
  },
}
