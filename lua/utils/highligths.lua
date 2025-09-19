-- Theme & transparency
-- TODO: Use the constant luminance to set the visual highlight Y = 0.2126 R + 0.7152 G + 0.0722 B
local color_tools = require("utils.lua_color_tools")
local fix_opts_hl = function(hl_name, umbral, swap, chfg)
    chfg = chfg == nil and true or chfg
    umbral = umbral and 50 or umbral
    swap = swap == nil and true or swap
    local hl = vim.api.nvim_get_hl(0, { name = hl_name })
    local bg = color_tools.dec2hex(hl.bg)
    local lightness = color_tools.lightness(bg)
    local fg = color_tools.dec2hex(hl.fg or bg)
    local chlight = 50
    local theme = lightness < umbral
    if swap then
        if chfg then
            fg = theme and color_tools.change_hex_lightness(fg, -chlight)
                or color_tools.change_hex_lightness(fg, chlight)
        else
            fg = theme and "#000000" or "#ffffff"
        end
        bg = theme and color_tools.change_hex_lightness(bg, 35)
            or color_tools.change_hex_lightness(bg, -35)
    else
        if chfg then
            fg = theme and color_tools.change_hex_lightness(fg, chlight)
                or color_tools.change_hex_lightness(fg, -chlight)
        else
            fg = theme and "#ffffff" or "#000000"
        end
        bg = theme and color_tools.change_hex_lightness(bg, -5)
            or color_tools.change_hex_lightness(bg, 5)
    end
    -- print(theme, lightness, fg, bg)
    return { fg = fg, bg = bg }
end
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", fg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "none" })
vim.api.nvim_set_hl(0, "FloatShadow", { bg = "none", fg = "none" })
vim.api.nvim_set_hl(0, "FloatShadowThrough", { bg = "none" })
vim.api.nvim_set_hl(0, "TabLineFill", {})
vim.api.nvim_set_hl(0, "TabLine", {})
vim.api.nvim_set_hl(0, "TabLineSel", {})
vim.api.nvim_set_hl(0, "Directory", { bg = "none", fg = "#fcba03", bold = true })
vim.api.nvim_set_hl(0, "NonText", { link = "Visual" })
vim.api.nvim_set_hl(0, "PmenuSel", { link = "Visual" })
vim.api.nvim_set_hl(0, "DiffText", fix_opts_hl("DiffText", 40, false))
vim.api.nvim_set_hl(0, "DiffAdd", fix_opts_hl("DiffAdd", 40, false))
vim.api.nvim_set_hl(0, "DiffDelete", fix_opts_hl("DiffDelete", 40, false))
vim.api.nvim_set_hl(0, "Substitute", fix_opts_hl("Substitute", 40, false))
vim.api.nvim_set_hl(0, "Visual", fix_opts_hl("Visual", 40, false))
vim.api.nvim_set_hl(0, "Cursor", fix_opts_hl("Cursor", 40, true))
vim.api.nvim_set_hl(0, "Search", fix_opts_hl("Search", 40, false))
vim.api.nvim_set_hl(0, "IncSearch", fix_opts_hl("IncSearch", 40, false))
-- vim.api.nvim_set_hl(0, "Special", { bg = "none" })
-- Plugin highlights
local core = require("pywal16.core")
local colors = core.get_colors()
vim.api.nvim_set_hl(0, "MiniStatuslineFilename", { bg = colors.color6, fg = colors.color0 })
vim.api.nvim_set_hl(0, "MiniStatuslineInactive", { bg = colors.color0 })
vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { bg = "none", fg = "#fcba03", bold = true })
vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { bg = "none", fg = "#fcba03", bold = true })
vim.api.nvim_set_hl(0, "TelescopeSelection", { link = "Visual" })
vim.api.nvim_set_hl(0, "TelescopeMatching", { link = "Cursor" })
vim.api.nvim_set_hl(0, "LspReferenceText", fix_opts_hl("Visual", 40, true, false))
vim.api.nvim_set_hl(0, "Whitespace", { link = "Normal" })
vim.api.nvim_set_hl(0, "RenderMarkdownCodeInline", { link = "Visual" })
