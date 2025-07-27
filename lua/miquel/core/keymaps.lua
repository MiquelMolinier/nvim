vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set(
    "t",
    "<leader><Esc>",
    "<C-\\><C-n>",
    { desc = "End terminal mode", silent = true, noremap = true }
)
-- Resize window

vim.keymap.set(
    "n",
    "<M-=>",
    "<cmd>vertical resize +2<CR>",
    { desc = "Increase vertical size" }
)
vim.keymap.set(
    "n",
    "<M-->",
    "<cmd>vertical resize -2<CR>",
    { desc = "Decrease vertical size" }
)
vim.keymap.set(
    "n",
    "<M-+>",
    "<cmd>horizontal resize +2<CR>",
    { desc = "Increase horizontal size" }
)
vim.keymap.set(
    "n",
    "<M-_>",
    "<cmd>horizontal resize -2<CR>",
    { desc = "Decrease horizontal size" }
)

vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Move text

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv",{desc= "Move selection down"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc= "Move selection up"})
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
vim.keymap.set("i", "<S-Tab>", "<C-d>", {silent=true, noremap=true, desc="Reverse tab in insert mode"})

-- Movement in document

vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc="Half page down (centered)"})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {desc="Half page up (centered)"})
vim.keymap.set("n", "n", "nzzzv", {desc="Next search result (centered)"})
vim.keymap.set("n", "N", "Nzzzv", {desc="Previous search result (centered)"})

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

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move right window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom  window" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Tab management

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })

--  Move current buffer to new tab

vim.keymap.set(
    "n",
    "<leader>tf",
    "<cmd>tabnew %<CR>",
    { desc = "Open current buffer in new tab" }
)

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

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n","Y","y$",{desc="Yank to end of line"})

-- Delete

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Basic autocommands
local augroup = vim.api.nvim_create_augroup("UserConfig",{})


-- Highlight yanked text

vim.api.nvim_create_autocmd("TextYankPost",{
  group = augroup,
  callback = function()
    vim.highlight.on_yank()
  end,
})

--  Return to last edit position when opening files

vim.api.nvim_create_autocmd("BufReadPost",{
  group = augroup,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Auto-close terminal when process exits

vim.api.nvim_create_autocmd("TermClose",{
  group = augroup,
  callback = function()
    if vim.v.event.status == 0 then
      vim.api.nvim_buf_delete(0, {})
    end
  end,
})

-- Auto-resize splits when window is resized

vim.api.nvim_create_autocmd("VimResized",{
  group = augroup,
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- LSP keymaps 
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local opts = {buffer = event.buf}

    -- Navigation
    vim.keymap.set('n', 'gD', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gs', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

    -- Information
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

    -- Code actions
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

    -- Diagnostics
    vim.keymap.set('n', '<leader>nd', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<leader>pd', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
  end,
})
