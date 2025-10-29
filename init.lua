-- Global hover handler override
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
    max_width = 80, -- maximum width
    max_height = 15, -- maximum height
})
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- python
local python = "" --[[ vim.cmd("pyenv which python") ]]
if python == "" then
    python = vim.fn.expand("/home/miquel/.local/opt/pyenv/versions/3.12.11/envs/neovim/bin/python")
end
vim.g.python3_host_prog = python
vim.g.jukit_mappings = 0
require("core")
require("utils.highligths")
-- BUG: strikethrough apparently does not work in any terminal
-- BUG: Scope only takes the first color in highlight
if false then
    vim.api.nvim_err_writeln("Error when finding references: " .. "Hola")
    hooks.register(nil, nil)
    if true then
        print("another scope")
    end
end
-- local all = vim.api.nvim_get_hl(0, {})
-- for name, _ in pairs(all) do
--     vim.api.nvim_set_hl(0, name, {})
--     -- if string.find(name, ".*Signature.*", 1, false) then
--     --     vim.print(name, _)
--     -- end
-- end
