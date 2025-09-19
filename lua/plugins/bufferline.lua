return {
    "akinsho/bufferline.nvim",
    keys = {
        { "<leader>to", "<cmd>tabnew<CR>", "n", desc = "Open new tab" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    config = function()
        local opts = {
            options = {
                mode = "tabs",
                numbers = "ordinal",
                separator_style = "thick",
            },
        }
        require("bufferline").setup(opts)
        vim.keymap.set(
            "n",
            "<leader>1",
            "<cmd>lua require('bufferline').go_to(1, true)<cr>",
            { desc = "Change to 1 tab", noremap = true, silent = true }
        )
        vim.keymap.set(
            "n",
            "<leader>2",
            "<cmd>lua require('bufferline').go_to(2, true)<cr>",
            { desc = "Change to 2 tab", noremap = true, silent = true }
        )
        vim.keymap.set(
            "n",
            "<leader>3",
            "<cmd>lua require('bufferline').go_to(3, true)<cr>",
            { desc = "Change to 3 tab", noremap = true, silent = true }
        )
        vim.keymap.set(
            "n",
            "<leader>4",
            "<cmd>lua require('bufferline').go_to(4, true)<cr>",
            { desc = "Change to 4 tab", noremap = true, silent = true }
        )
        vim.keymap.set(
            "n",
            "<leader>5",
            "<cmd>lua require('bufferline').go_to(5, true)<cr>",
            { desc = "Change to 5 tab", noremap = true, silent = true }
        )
        vim.keymap.set(
            "n",
            "<leader>6",
            "<cmd>lua require('bufferline').go_to(6, true)<cr>",
            { desc = "Change to 6 tab", noremap = true, silent = true }
        )
        vim.keymap.set(
            "n",
            "<leader>7",
            "<cmd>lua require('bufferline').go_to(7, true)<cr>",
            { desc = "Change to 7 tab", noremap = true, silent = true }
        )
        vim.keymap.set(
            "n",
            "<leader>8",
            "<cmd>lua require('bufferline').go_to(8, true)<cr>",
            { desc = "Change to 8 tab", noremap = true, silent = true }
        )
        vim.keymap.set(
            "n",
            "<leader>9",
            "<cmd>lua require('bufferline').go_to(9, true)<cr>",
            { desc = "Change to 9 tab", noremap = true, silent = true }
        )
        vim.keymap.set(
            "n",
            "<leader>$",
            "<cmd>lua require('bufferline').go_to(-1, true)<cr>",
            { desc = "Change to last tab", noremap = true, silent = true }
        )
    end,
}
