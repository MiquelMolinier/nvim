local rainbow_list = {
    { name = "RainbowRed", color = "#E06C75" },
    { name = "RainbowYellow", color = "#E5C07B" },
    { name = "RainbowBlue", color = "#61AFEF" },
    { name = "RainbowOrange", color = "#D19A66" },
    { name = "RainbowGreen", color = "#98C379" },
    { name = "RainbowViolet", color = "#C678DD" },
    { name = "RainbowCyan", color = "#56B6C2" },
    { name = "RainbowWhite", color = "#FFFFFF" },
}
local rainbow_names = {}
local rainbow_dict = {}
for _, color_dict in ipairs(rainbow_list) do
    local name = color_dict["name"]
    local color = color_dict["color"]
    table.insert(rainbow_names, name)
    rainbow_dict[name] = color
end

return {
    rainbow_names = rainbow_names,
    rainbow = rainbow_dict,
    icons_filename = {
        makefile = {
            icon = "",
            color = "#FFFFFF",
            cterm_color = "15",
            name = "Makefile",
        },
        gnumakefile = {
            icon = "",
            color = "#FFFFFF",
            cterm_color = "15",
            name = "Makefile",
        },
    },
    icons_extension = {
        luau = {
            icon = "",
            color = "#1fcc4d",
            cterm_color = "75",
            name = "Luau",
        },
        lua = {
            icon = "",
            color = "#60e083",
            cterm_color = "74",
            name = "Lua",
        },
        luac = {
            icon = "",
            color = "#60e083",
            cterm_color = "74",
            name = "Lua",
        },
        zsh = {
            icon = "",
            color = "#428850",
            cterm_color = "15",
            name = "Zsh",
        },
        mk = {
            icon = "",
            color = "#FFFFFF",
            cterm_color = "15",
            name = "Makefile",
        },
        makefile = {
            icon = "",
            color = "#FFFFFF",
            cterm_color = "15",
            name = "Makefile",
        },
        gnumakefile = {
            icon = "",
            color = "#FFFFFF",
            cterm_color = "15",
            name = "Makefile",
        },
    },
}
