vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
vim.keymap.set(
    "t",
    "<leader><Esc>",
    "<C-\\><C-n>",
    { desc = "End terminal mode", silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>o", "o<ESC>", { desc = "New line below in normal mode" })
vim.keymap.set("n", "<leader>O", "O<ESC>", { desc = "New line above in normal mode" })

vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Move text
vim.keymap.set("v", "<leader>gg", ":m0<CR>gv=gv", { desc = "Move selection to start of file" })
vim.keymap.set("v", "<leader>gG", ":m$<CR>gv=gv", { desc = "Move selection to end of file" })
vim.keymap.set("v", "<M-j>", function()
    local cnt = vim.v.count1
    return string.format(":m '>+%d<CR>gv=gv", cnt)
end, { silent = true, expr = true, desc = "Move selection down by count" })
vim.keymap.set("v", "<M-k>", function()
    local cnt = vim.v.count1
    cnt = cnt < 2 and 2 or cnt + 1
    return string.format(":m '<-%d<CR>gv=gv", cnt)
end, { silent = true, expr = true, desc = "Move selection up by count" })
vim.keymap.set("v", "<Tab>", ">gv", {
    noremap = true,
    silent = true,
    desc = "Keymap to increase indentation by one tab",
})
vim.keymap.set("v", "<S-Tab>", "<gv", {
    noremap = true,
    silent = true,
    desc = "Keymap to decrease indentation by one tab",
})
vim.keymap.set(
    "i",
    "<S-Tab>",
    "<C-d>",
    { silent = true, noremap = true, desc = "Reverse tab in insert mode" }
)
-- Movement in document
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
-- Increment/decrement numbers
vim.keymap.set(
    "n",
    "<leader>+",
    "<C-a>",
    { desc = "Increment number", silent = true, noremap = true }
)
vim.keymap.set(
    "n",
    "<leader>-",
    "<C-x>",
    { desc = "Decrement number", silent = true, noremap = true }
)
-- Window management
vim.keymap.set("n", "<leader>sv", "<C-W>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-W>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-W>=", { desc = "Make splits equal size" })
-- vim.keymap.set("n", "<C-W>c", "<cmd>close<CR>", { desc = "Close the current window" })
vim.keymap.set("n", "<C-W>c", function()
    local cnt = vim.v.count
    local rhs = ":" .. (cnt == 0 and "" or "<C-U>" .. cnt) .. "close<CR>"
    return rhs
end, { expr = true, silent = true, noremap = true, desc = "Close (count)|current window" })

-- Tab management
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
--  Move current buffer to new tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
-- Custom keymaps
vim.keymap.set(
    "n",
    "<leader>sr",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Find string and replace" }
)
-- Paste
vim.keymap.set("x", "<leader>p", [["_dP]])
-- Copy
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to clipb" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank eol to clipb" })
vim.keymap.set("n", "Y", "y$", { desc = "Yank to end of line", noremap = false })
-- Delete
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("c", "<C-D>", "<Del>")
vim.keymap.set(
    "n",
    "<leader>sr",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Find string and replace" }
)
