-- Global setting
vim.opt.formatoptions:remove({"o","r"})
require("miquel.core")
-- Optional: enforce it on every filetype just in case
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({"o","r"})
  end,
})
