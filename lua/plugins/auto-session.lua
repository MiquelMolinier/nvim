return {
    "rmagatti/auto-session",
    lazy = false,
    priority = 900,
    config = function()
        local auto_session = require("auto-session")
        local opts = {
            enabled = false, -- Enables/disables auto creating, saving and restoring
            auto_restore = true,
            suppressed_dirs = { -- Suppress session restore/create in certain directories
                "~/",
                "~/Dev/",
                "~/Downloads",
                "~/Documents",
                "~/Desktop/",
            },
        }
        auto_session.setup(opts)
        vim.keymap.set(
            "n",
            "<leader>wr",
            "<cmd>SessionRestore<CR>",
            { desc = "Restore session for cwd" }
        )
        vim.keymap.set(
            "n",
            "<leader>ws",
            "<cmd>SessionSave<CR>",
            { desc = "Save session for auto session root dir" }
        )
    end,
}
