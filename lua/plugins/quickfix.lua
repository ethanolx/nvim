return {
    {
        "folke/trouble.nvim",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        ft = "qf",
        cmd = "Trouble",
        opts = {
            position = "bottom",
            height = 10,
            width = 50,
            icons = true,
            mode = "quickfix",
            fold_open = "",
            fold_closed = "",
            group = true,
            padding = false,
            action_keys = {
                close = "q",
                cancel = "<esc>",
                refresh = "r",
                jump = { "<cr>", "<tab>" },
                open_split = { "<c-x>" },
                open_vsplit = { "<c-v>" },
                open_tab = { "<c-t>" },
                jump_close = { "o" },
                toggle_mode = "m",
                toggle_preview = "P",
                hover = "K",
                preview = "p",
                close_folds = { "zM", "zm" },
                open_folds = { "zR", "zr" },
                toggle_fold = { "zA", "za" },
                previous = "k",
                next = "j"
            },
            indent_lines = true,
            auto_open = false,
            auto_close = false,
            auto_preview = true,
            auto_fold = false,
            auto_jump = {},

            signs = {
                other = ""
            },
            use_diagnostic_signs = true
        }
    },
}
