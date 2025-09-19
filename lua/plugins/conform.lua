return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format({ async = false, lsp_format = "fallback" })
            end,
            mode = "n",
            desc = "[F]ormat buffer",
        },
    },
    config = function()
        local conform = require("conform")
        local opts = {
            notify_on_error = false,
            format_on_save = function(bufnr)
                -- Disable "format_on_save lsp_fallback" for languages that don't
                -- have a well standardized coding style. You can add additional
                -- languages here or re-enable it for the disabled ones.
                local disable_filetypes = { c = true, cpp = true }
                if disable_filetypes[vim.bo[bufnr].filetype] then
                    return nil
                else
                    return {
                        timeout_ms = 500,
                        lsp_format = "fallback",
                        async = false,
                    }
                end
            end,
            formatters_by_ft = {
                lua = { "stylua" },
                sh = { "beautysh", "shellharden" },
                c = { "clang-format" },
                markdown = { "markdownlint" },
                tex = { "latexindent" },
                xml = { "xmlformatter" },
                -- Conform can also run multiple formatters sequentially
                -- python = { "isort", "black" },
                --
                -- You can use 'stop_after_first' to run the first available formatter from the list
                -- javascript = { "prettierd", "prettier", stop_after_first = true },
            },
            formatters = {
                ["clang-format"] = {
                    command = "clang-format",
                    args = { "-assume-filename", "$FILENAME" },
                },
            },
        }
        conform.setup(opts)
    end,
}
