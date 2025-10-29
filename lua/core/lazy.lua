-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- import your plugins
        require("plugins.init"),
        require("plugins.nvim-treesitter"),
        require("plugins.pywal16"),
        require("plugins.auto-session"),
        require("plugins.nvim-web-devicons"),
        require("plugins.nvim-tree"),
        require("plugins.which-key"),
        require("plugins.todo-comments"),
        require("plugins.telescope"),
        require("plugins.lazydev"),
        require("plugins.blink"),
        require("plugins.conform"),
        require("plugins.mason-lspconfig"),
        require("plugins.lspconfig"),
        require("plugins.surround"),
        require("plugins.autopairs"),
        require("plugins.lint"),
        require("plugins.indent-blankline"),
        require("plugins.rainbow-delimiters"),
        require("plugins.mini"),
        require("plugins.render-markdown"),
        require("plugins.bufferline"),
        require("plugins.vimtex"),
        require("plugins.vim-jukit"),
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "unokai" } },
    change_detection = {
        -- automatically check for config file changes and reload the ui
        enabled = false,
        notify = false, -- get a notification when changes are found
    },
    -- automatically check for plugin updates
    checker = {
        -- automatically check for plugin updates
        enabled = true,
        concurrency = nil, ---@type number? set to 1 to check for updates very slowly
        notify = false, -- get a notification when new updates are found
        frequency = 3600, -- check for updates every hour
        check_pinned = false, -- check for pinned packages that can't be updated
    },
    defaults = {
        -- Set this to `true` to have all your plugins lazy-loaded by default.
        -- Only do this if you know what you are doing, as it can lead to unexpected behavior.
        lazy = false, -- should plugins be lazy-loaded?
        -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
        -- have outdated releases, which may break your Neovim install.
        version = nil, -- always use the latest git commit
        -- version = "*", -- try installing the latest stable version for plugins that support semver
        -- default `cond` you can use to globally disable a lot of plugins
        -- when running inside vscode for example
        cond = nil, ---@type boolean|fun(self:LazyPlugin):boolean|nil
    },
})
