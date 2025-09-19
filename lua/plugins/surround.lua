return {
    "kylechui/nvim-surround",
    enabled = false,
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("nvim-surround").setup({})
    end,
}
