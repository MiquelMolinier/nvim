return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = true,
    keys = {
        { "<leader>ee", "<cmd>NvimTreeToggle<CR>", "n", desc = "Toggle file explorer" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end,
    config = function()
        local nvimtree = require("nvim-tree")
        local opts = {
            view = {
                width = 35,
                relativenumber = true,
                -- float = {
                --     enable = true,
                -- },
            },
            -- change folder arrow icons
            renderer = {
                indent_markers = {
                    enable = true,
                },
                icons = {
                    glyphs = {
                        folder = {
                            arrow_closed = "", -- arrow when folder is closed
                            arrow_open = "", -- arrow when folder is open
                        },
                    },
                },
            },
            -- disable window_picker for explorer to work well with window splits
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
                file_popup = {
                    open_win_config = { border = "rounded" },
                },
            },
            filters = {
                custom = { ".DS_Store" },
            },
            git = {
                ignore = false,
            },
            on_attach = function(bufnr)
                local api = require("nvim-tree.api")
                local function opts(desc)
                    return {
                        desc = "nvim-tree: " .. desc,
                        buffer = bufnr,
                        noremap = true,
                        silent = true,
                        nowait = true,
                    }
                end
                -- default mappings
                api.map.on_attach.default(bufnr)
                -- custom mappings
                vim.keymap.set(
                    "n",
                    "R",
                    -- "<CMD>Lazy reload nvim-tree.lua<CR>",
                    function()
                        vim.cmd("Lazy reload nvim-tree.lua")
                        vim.cmd("NvimTreeToggle")
                    end,
                    opts("Reload plugin")
                )
            end,
        }
        nvimtree.setup(opts)
        vim.keymap.set(
            "n",
            "<leader>ef",
            "<cmd>NvimTreeFindFileToggle<CR>",
            { desc = "Toggle file explorer on current file" }
        )
        vim.keymap.set(
            "n",
            "<leader>ec",
            "<cmd>NvimTreeCollapse<CR>",
            { desc = "Collapse file explorer" }
        )
        vim.keymap.set(
            "n",
            "<leader>er",
            "<cmd>NvimTreeRefresh<CR>",
            { desc = "Refresh file explorer" }
        )
    end,
}
