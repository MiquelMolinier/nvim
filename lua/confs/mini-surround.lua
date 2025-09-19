return {
    custom_surroundings = {
        [")"] = { output = { left = "(", right = ")" } },
        ["]"] = { output = { left = "[", right = "]" } },
        ["}"] = { output = { left = "{", right = "}" } },
        s = {
            input = { "%[%[().-()%]%]" },
            output = { left = "[[", right = "]]" },
        },
        ["*"] = {
            input = function()
                local n_star = MiniSurround.user_input("Number of * to find")
                local many_star = string.rep("%*", tonumber(n_star) or 1)
                local pattern = "[^%*](" .. many_star .. "[^%*]+" .. many_star .. ")[^%*]"
                return { pattern, many_star .. "().*()" .. many_star }
            end,
            output = function()
                local n_star = MiniSurround.user_input("Number of * to output")
                local many_star = string.rep("*", tonumber(n_star) or 1)
                return { left = many_star, right = many_star }
            end,
        },
        ["="] = {
            input = function()
                local n_star = MiniSurround.user_input("Number of = to find")
                local many_symbol = string.rep("=", tonumber(n_star) or 1)
                local pattern = "[^=](" .. many_symbol .. "[^=]+" .. many_symbol .. ")[^=]"
                return { pattern, many_symbol .. "().=()" .. many_symbol }
            end,
            output = function()
                local n_star = MiniSurround.user_input("Number of = to output")
                local many_symbol = string.rep("=", tonumber(n_star) or 1)
                return { left = many_symbol, right = many_symbol }
            end,
        },
    },
    respect_selection_type = true,
    search_method = "cover_or_next",
    n_lines = 20,
}
