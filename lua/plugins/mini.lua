return {
    "echasnovski/mini.nvim",
    lazy = true,
    config = function()
        local mini_ai = require("mini.ai")
        local mini_surround = require("mini.surround")
        local mini_statusline = require("mini.statusline")
        local mini_surround_opts = require("confs.mini-surround")
        local mini_statusline_opts = require("confs.mini-statusline")
        local mini_ai_opts = require("confs.mini-ai")
        -- Better Around/Inside textobjects
        --
        -- Examples:
        --  - va)  - [V]isually select [A]round [)]paren
        --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
        --  - ci'  - [C]hange [I]nside [']quote
        -- TODO: Change configuration of mini.ai
        mini_ai.setup(mini_ai_opts)

        -- Add/delete/replace surroundings (brackets, quotes, etc.)
        --
        -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
        -- - sd'   - [S]urround [D]elete [']quotes
        -- - sr)'  - [S]urround [R]eplace [)] [']
        -- TODO: Change configuration of mini.surround
        mini_surround.setup(mini_surround_opts)
        -- Simple and easy statusline.
        --  You could remove this setup call if you don't like it,
        --  and try some other statusline plugin
        -- set use_icons to true if you have a Nerd Font
        -- TODO: Change configuration of mini.statusline
        mini_statusline.setup(mini_statusline_opts)

        -- You can configure sections in the statusline by overriding their
        -- default behavior. For example, here we set the section for
        -- cursor location to LINE:COLUMN
        ---@diagnostic disable-next-line: duplicate-set-field
        mini_statusline.section_location = function()
            return "%2l:%-2v"
        end

        -- ... and there is more!
        --  Check out: https://github.com/echasnovski/mini.nvim
    end,
}
