return {
    {
        "akinsho/toggleterm.nvim",
        version = "v2.*",
        cmd = "ToggleTerm",
        opts = {
            size = function(term)
                if term.direction == "horizontal" then
                    return vim.o.lines * 0.5
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            highlights = {
                FloatBorder = { link = "FloatBorder", },
            },
            hide_numbers = true,
            open_mapping = "<C-\\>",
            shade_filetypes = {},
            shade_terminals = false,
            insert_mappings = true,
            terminal_mappings = true,
            persist_size = true,
            persist_mode = false,
            direction = "tab",
            close_on_exit = true,
            shell = vim.loop.os_uname().sysname == "Linux" and "zsh" or "pwsh",
            on_open = function (_)
                vim.cmd "normal i"
            end,
            float_opts = {
                border = "curved",
            },
            winbar = {
                enabled = true,
                name_formatter = function(terminal)
                    return terminal.display_name or terminal.id
                end
            },
        },
    },
}
