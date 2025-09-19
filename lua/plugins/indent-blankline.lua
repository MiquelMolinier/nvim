return {
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    dependencies = { "nvim-treesitter/nvim-treesitter", "HiPhish/rainbow-delimiters.nvim" },
    config = function()
        local ibl = require("ibl")
        local utils = require("utils.icons")
        local rainbow = utils.rainbow
        local highlight = utils.rainbow_names
        local hooks = require("ibl.hooks")
        local opts = {
            -- whitespace = { highlight = { "Cleared" } },
            indent = {
                repeat_linebreak = true,
                priority = 1024,
                char = "┆",
                highlight = highlight,
                smart_indent_cap = true,
            },
            scope = {
                highlight = highlight,
                enabled = true,
                exclude = {
                    language = {},
                    node_type = {
                        ["*"] = {
                            "source_file",
                            "program",
                        },
                        lua = {
                            "chunk",
                        },
                        python = {
                            "module",
                        },
                    },
                },
                include = {
                    node_type = {
                        lua = { "return_statement", "table_constructor" },
                    },
                },
                show_exact_scope = false,
                show_start = true,
                show_end = true,
                char = "▎",
                injected_languages = true,
                priority = 1,
            },
        }
        -- create the highlight groups in the highlight setup hook, so they are reset
        -- every time the colorscheme changes
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            for name, color in pairs(rainbow) do
                vim.api.nvim_set_hl(0, name, { fg = color, bg = "none" })
            end
        end)
        ibl.setup(opts)
        vim.g.rainbow_delimiters = { highlight = highlight }
        hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
}
