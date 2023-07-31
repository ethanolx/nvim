return {
    {
        "olimorris/persisted.nvim",
        cmd = {
            "SessionLoad",
            "SessionSave",
        },
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("persisted").setup {
                -- autoload = true,
                save_dir = vim.fn.stdpath("data") .. "/sessions/src/",
                autosave = false,
                use_git_branch = false,
            }

            require("telescope").load_extension "persisted"
        end
    },
    {
        "Weissle/persistent-breakpoints.nvim",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        cmd = {
            "PBToggleBreakpoint",
            "PBSetConditionalBreakpoint",
            "PBClearAllBreakpoints",
        },
        opts = {
            save_dir = vim.fn.stdpath("data") .. "/sessions/debug/breakpoints",
            load_breakpoints_event = { "BufReadPost" },
        }
    },
}
