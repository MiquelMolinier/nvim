return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = {
    {"nvim-tree/nvim-web-devicons", lazy = true },
    {"echasnovski/mini.nvim", lazy = true},
  },
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  config = function()
    opts = {} 
    require("which-key").setup(opts)
    vim.api.nvim_set_hl(0, "WhichKeyNormal", {link="Normal"})
  end
}
