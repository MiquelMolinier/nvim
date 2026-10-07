return {
    "folke/todo-comments.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local todo_comments = require("todo-comments")
        vim.keymap.set("n", "]t", function()
            todo_comments.jump_next()
        end, { desc = "Next todo comment" })
        vim.keymap.set("n", "[t", function()
            todo_comments.jump_prev()
        end, { desc = "Previous todo comment" })
        local opts = { signs = false }
        todo_comments.setup(opts)
        local extend_todo_highlight = function(hl_name, val)
            local hl = vim.api.nvim_get_hl(0, { name = hl_name })
            vim.api.nvim_set_hl(0, hl_name, vim.tbl_extend("force", hl, val))
        end
        extend_todo_highlight("TodoBgTODO", { bold = true })
        extend_todo_highlight("TodoFgTODO", { bold = true })
    end,
}
