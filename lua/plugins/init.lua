return {
    {
        "nvim-lua/plenary.nvim",
        lazy = true,
    },
    {
        "christoomey/vim-tmux-navigator",
        init = function()
            vim.g.tmux_navigator_no_mappings = 1
        end,
        event = "VimEnter",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
            "TmuxNavigatorProcessList",
        },
        config = function()
            vim.keymap.set("n", "<C-M-h>", "<CMD>TmuxNavigateLeft<CR>")
            vim.keymap.set("n", "<C-M-l>", "<CMD>TmuxNavigateRight<CR>")
            vim.keymap.set("n", "<C-M-j>", "<CMD>TmuxNavigateDown<CR>")
            vim.keymap.set("n", "<C-M-k>", "<CMD>TmuxNavigateUp<CR>")
            vim.keymap.set("n", "<C-\\>", "<CMD>TmuxNavigatePrevious<CR>")
        end,
    },
}
