local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })
-- Basic autocommands
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight yanked text",
    group = augroup,
    callback = function()
        vim.highlight.on_yank()
    end,
})
--  Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
    group = augroup,
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})
-- Markdown config
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    group = augroup,
    desc = "Move selection for markdown",
    callback = function()
        vim.keymap.set("v", "<M-j>", function()
            local cnt = vim.v.count1
            return string.format(":m'>+%d<CR>gv", cnt)
        end, { silent = true, expr = true, desc = "Move selection down by count" })
        vim.keymap.set("v", "<M-k>", function()
            local cnt = vim.v.count1
            cnt = cnt < 2 and 2 or cnt + 1
            return string.format(":m'<-%d<CR>gv", cnt)
        end, { silent = true, expr = true, desc = "Move selection up by count" })
    end,
})
-- vim.api.nvim_create_autocmd("VimLeave", {
--     desc = "Clean colorscheme",
--     group = augroup,
--     callback = function()
--         vim.cmd.colorscheme("default")
--     end,
-- })
