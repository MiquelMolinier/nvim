return {
    "luk400/vim-jukit",
    -- enable = false,
    ft = { "python", "*.ipynb" },
    config = function()
        -- Configure vim-jukit
        local ipython = string.gsub(vim.fn.system("pyenv which ipython"), "\n", " ")
        if ipython:find("command not found") then
            ipython = "/home/miquel/.local/opt/pyenv/versions/3.12.11/envs/neovim/bin/ipython"
        end
        -- Setup
        vim.g.jukit_shell_cmd = ipython
        vim.g.jukit_mappings_ext = { "python", "*.ipynb" }
        vim.g.jukit_layout = {
            split = "horizontal",
            p1 = 0.6,
            val = {
                "file_content",
                {
                    split = "vertical",
                    p1 = 0.6,
                    val = { "output", "output_history" },
                },
            },
        }
        -- Sending code
        vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
            pattern = { "*.ipynb", "*.py" },
            callback = function(ev)
                local bufnr = ev.buf
                local function opts(desc)
                    return { desc = desc, buffer = bufnr, silent = true }
                end
                vim.keymap.set(
                    { "n" },
                    "<S-Space>",
                    ":call jukit#send#line()<CR>",
                    opts("Send current line")
                )
                vim.keymap.set(
                    { "n" },
                    "<C-CR>",
                    ":call jukit#send#section(0)<cr>",
                    opts("Send code within the current cell to output split")
                )
                vim.keymap.set(
                    { "n" },
                    "<S-CR>",
                    ":call jukit#send#section(1)<cr>",
                    opts("Send code within the current cell to output split and go to next cell")
                )
                vim.keymap.set(
                    "v",
                    "<C-CR>",
                    ":<C-U>call jukit#send#selection()<cr>",
                    opts("Send visually selected code to output split")
                )
                vim.keymap.set(
                    "n",
                    "<leader>Jru",
                    ":call jukit#send#until_current_section()<cr>",
                    opts("Execute all cells until the current cell")
                )
                vim.keymap.set(
                    "n",
                    "<leader>Jra",
                    ":call jukit#send#all()<cr>",
                    opts("Execute all cells")
                )
                -- Splits
                vim.keymap.set(
                    "n",
                    "<leader>Jos",
                    ":call jukit#splits#output()<cr>",
                    opts(
                        "Opens a new output window and executes the command specified in `g:jukit_shell_cmd`"
                    )
                )
                vim.keymap.set(
                    "n",
                    "<leader>Jts",
                    ":call jukit#splits#term()<cr>",
                    opts("Opens a new output window without executing any command")
                )
                vim.keymap.set(
                    "n",
                    "<leader>Jhs",
                    ":call jukit#splits#history()<cr>",
                    opts(
                        "Opens a new output-history window, where saved ipython outputs are displayed"
                    )
                )
                vim.keymap.set(
                    "n",
                    "<leader>Johs",
                    ":call jukit#splits#output_and_history()<cr>",
                    opts("Shortcut for opening output terminal and output-history")
                )
                vim.keymap.set(
                    "n",
                    "<leader>Jhc",
                    ":call jukit#splits#close_history()<cr>",
                    opts("Close output-history window")
                )
                vim.keymap.set(
                    "n",
                    "<leader>Joc",
                    ":call jukit#splits#close_output_split()<cr>",
                    opts("Close output window")
                )
                vim.keymap.set(
                    "n",
                    "<leader>Johc",
                    ":call jukit#splits#close_output_and_history(1)<cr>",
                    opts(
                        "Close both windows. Argument: Whether or not to ask you to confirm before closing."
                    )
                )
                vim.keymap.set(
                    "n",
                    "<leader>Jso",
                    ":call jukit#splits#show_last_cell_output(1)<cr>",
                    opts(
                        "Show output of current cell (determined by current cursor position) in output-history window. Argument: Whether or not to reload outputs if cell id of outputs to display is the same as the last cell id for which outputs were displayed"
                    )
                )
                vim.keymap.set(
                    "n",
                    "<leader>Jj",
                    ":call jukit#splits#out_hist_scroll(1)<cr>",
                    opts(
                        "Scroll down in output-history window. Argument: whether to scroll down (1) or up (0)"
                    )
                )
                vim.keymap.set(
                    "n",
                    "<leader>Jk",
                    ":call jukit#splits#out_hist_scroll(0)<cr>",
                    opts(
                        "Scroll up in output-history window. Argument: whether to scroll down (1) or up (0)"
                    )
                )
                vim.keymap.set(
                    "n",
                    "<leader>Jsa",
                    ":call jukit#splits#toggle_auto_hist()<cr>",
                    opts(
                        "Create/delete autocmd for displaying saved output on CursorHold. Also, see explanation for `g:jukit_auto_output_hist`"
                    )
                )
                vim.keymap.set(
                    "n",
                    "<leader>Jsl",
                    ":call jukit#layouts#set_layout()<cr>",
                    opts(
                        "Apply layout (see `g:jukit_layout`) to current splits - NOTE: it is expected that this function is called from the main file"
                    )
                )
                -- Cells
                vim.keymap.set(
                    "n",
                    "<leader>Jcb",
                    "<cmd>call jukit#cells#create_below(0)<cr>",
                    opts(
                        "Create new code [c]ell [b]elow. Argument: Whether to create code cell (0) or markdown cell (1)"
                    )
                )
                vim.keymap.set(
                    "n",
                    "<leader>Jca",
                    ":call jukit#cells#create_above(0)<cr>",
                    opts(
                        "Create new code [c]ell [a]bove. Argument: Whether to create code cell (0) or markdown cell (1)"
                    )
                )
                vim.keymap.set(
                    "n",
                    "<leader>Jtb",
                    ":call jukit#cells#create_below(1)<cr>",
                    opts(
                        "Create new [t]extcell [b]elow. Argument: Whether to create code cell (0) or markdown cell (1)"
                    )
                )
                vim.keymap.set(
                    "n",
                    "<leader>Jta",
                    ":call jukit#cells#create_above(1)<cr>",
                    opts(
                        "Create new [t]extcell [a]bove. Argument: Whether to create code cell (0) or markdown cell (1)"
                    )
                )
                vim.keymap.set(
                    "n",
                    "<leader>Jcd",
                    ":call jukit#cells#delete()<cr>",
                    opts("[D]elete current [c]ell")
                )
                vim.keymap.set(
                    "n",
                    "<leader>Jcs",
                    ":call jukit#cells#split()<cr>",
                    opts(
                        "[S]plit current [c]ell (saved output will then be assigned to the resulting cell above)"
                    )
                )
                vim.keymap.set(
                    "n",
                    "<leader>Jma",
                    ":call jukit#cells#merge_above()<cr>",
                    opts("[M]erge current [c]ell with the cell above")
                )
                vim.keymap.set(
                    "n",
                    "<leader>Jmb",
                    ":call jukit#cells#merge_below()<cr>",
                    opts("[M]erge current [c]ell with the cell below")
                )
                vim.keymap.set(
                    { "n", "i" },
                    "<M-S-k>",
                    ":call jukit#cells#move_up()<cr>",
                    opts("Move current cell up")
                )
                vim.keymap.set(
                    { "n", "i" },
                    "<M-S-j>",
                    ":call jukit#cells#move_down()<cr>",
                    opts("Move current cell down")
                )
                vim.keymap.set(
                    { "n", "i" },
                    "<M-j>",
                    ":call jukit#cells#jump_to_next_cell()<cr>",
                    opts("Jump to the next cell below")
                )
                vim.keymap.set(
                    { "n", "i" },
                    "<M-k>",
                    ":call jukit#cells#jump_to_previous_cell()<cr>",
                    opts("Jump to the previous cell above")
                )
                vim.keymap.set(
                    "n",
                    "<leader>Jdo",
                    ":call jukit#cells#delete_outputs(0)<cr>",
                    opts(
                        "[D]elete saved [o]utput of current cell. Argument: Whether to delete all saved outputs (1) or only saved output of current cell (0)"
                    )
                )
                vim.keymap.set(
                    "n",
                    "<leader>Jda",
                    ":call jukit#cells#delete_outputs(1)<cr>",
                    opts(
                        "[D]elete saved outputs of [a]ll cells. Argument: Whether to delete all saved outputs (1) or only saved output of current cell (0)"
                    )
                )
                -- Convert between ipynb and py
                vim.keymap.set(
                    "n",
                    "<leader>Jnp",
                    ":call jukit#convert#notebook_convert('jupyter-notebook')<cr>",
                    opts(
                        "Convert from [n]otebook ipynb to [p]ython or vice versa. Argument: Optional. If an argument is specified, then its value is used to open the resulting ipynb file after converting script."
                    )
                )
                vim.keymap.set(
                    "n",
                    "<leader>Jfh",
                    ":call jukit#convert#save_nb_to_file(0,1,'html')<cr>",
                    opts(
                        "Convert [f]ile to [h]tml (including all saved outputs) and open it using the command specified in `g:jukit_html_viewer'. If `g:jukit_html_viewer` is not defined, then will default to `g:jukit_html_viewer='xdg-open'`. Arguments: 1.: Whether to rerun all cells when converting 2.: Whether to open it after converting 3.: filetype to convert to"
                    )
                )
                vim.keymap.set(
                    "n",
                    "<leader>Jfrh",
                    ":call jukit#convert#save_nb_to_file(1,1,'html')<cr>",
                    opts("same as above, but will (re-)[r]un all cells when converting to [h]tml")
                )
                vim.keymap.set(
                    "n",
                    "<leader>Jfp",
                    ":call jukit#convert#save_nb_to_file(0,1,'pdf')<cr>",
                    opts(
                        "Convert [f]ile to [p]df (including all saved outputs) and open it using the command specified in `g:jukit_pdf_viewer'. If `g:jukit_pdf_viewer` is not defined, then will default to `g:jukit_pdf_viewer='xdg-open'`. Arguments: 1.: Whether to rerun all cells when converting 2.: Whether to open it after converting 3.: filetype to convert to. NOTE: If the function doesn't work there may be issues with your nbconvert or latex version - to debug, try converting to pdf using `jupyter nbconvert --to pdf --allow-errors --log-level='ERROR' --HTMLExporter.theme=dark </abs/path/to/ipynb> && xdg-open </abs/path/to/pdf>` in your terminal and check the output for possible issues."
                    )
                )
                vim.keymap.set(
                    "n",
                    "<leader>Jfrp",
                    ":call jukit#convert#save_nb_to_file(1,1,'pdf')<cr>",
                    opts(
                        "same as above, but will (re-)[r]un all cells when converting to [p]df. NOTE: If the function doesn't work there may be issues with your nbconvert or latex version - to debug, try converting to pdf using `jupyter nbconvert --to pdf --allow-errors --log-level='ERROR' --HTMLExporter.theme=dark </abs/path/to/ipynb> && xdg-open </abs/path/to/pdf>` in your terminal and check the output for possible issues."
                    )
                )
            end,
        })
    end,
}
