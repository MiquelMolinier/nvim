-- Basic settings
vim.b.netrw_line = true
vim.g.netrw_bufsettings = "noma nomod nu rnu nowrap ro nobl"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.virtualedit = "block"
vim.opt.sidescrolloff = 10
vim.opt.jumpoptions = "view"
vim.g.have_nerd_font = true
-- vim.opt.spell = true
-- vim.opt.spelllang = "en_us"
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ "o", "r" })
    end,
})
-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
-- Ftplugins
vim.g.markdown_recommended_style = 1
vim.g.omni_sql_no_default_maps = 1
-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
-- Visual settings
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "100"
vim.opt.showmatch = false
-- vim.opt.cmdheight = 1
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.showmode = false
-- vim.opt.pumheight = 10
-- vim.opt.winborder = "solid"
-- vim.opt.pumblend = 10
-- vim.opt.winblend = 10
vim.opt.conceallevel = 0
vim.opt.concealcursor = ""
vim.opt.lazyredraw = false
vim.opt.synmaxcol = 300
-- File handling
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.updatetime = 300
vim.opt.timeoutlen = 250
vim.opt.ttimeoutlen = 0
vim.opt.autoread = true
vim.opt.autowrite = false
-- Behavior settings
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.backspace = "indent,eol,start"
vim.opt.autochdir = false
vim.opt.path:append("**")
vim.opt.selection = "exclusive"
vim.opt.mouse = "a"
vim.opt.modifiable = true
vim.opt.encoding = "UTF-8"
-- Cursor settings
-- BUG: nvim blink cursor overrides the blink cursor of st and changes the color
-- vim.opt.guicursor =
--     "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
-- Folding settings
vim.cmd("let g:netrw_liststyle = 3")
vim.opt.foldmethod = "expr"
vim.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
-- Split behavior
vim.opt.splitbelow = true
vim.opt.splitright = true
-- Performance improvements
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000
-- Command-line completion
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })
-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p")
end
