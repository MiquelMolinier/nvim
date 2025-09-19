return {
    "HiPhish/rainbow-delimiters.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local opts = {}
        require("rainbow-delimiters.setup").setup(opts)
    end,
}
