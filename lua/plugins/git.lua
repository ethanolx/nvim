return {
    {
        "lewis6991/gitsigns.nvim",
        version = "*",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            current_line_blame = true,
            current_line_blame_formatter = "  <author>, <author_time:%d/%m/%Y> • <summary>",
            sign_priority = 1,
            preview_config = {
                border = "rounded",
                style = "minimal",
                relative = "cursor",
                focusable = true,
                row = 0,
                col = 1,
            },
        }
    },
    {
        "rhysd/git-messenger.vim",
        cmd = "GitMessenger",
        init = function()
            vim.g.git_messenger_floating_win_opts = { border = "rounded", }
            vim.g.git_messenger_no_default_mappings = true
        end,
    },
    {
        "TimUntersberger/neogit",
        cmd = "Neogit",
        opts = {
            kind = "tab",
            commit_popup = "split",
            signs = {
                -- { CLOSED, OPENED }
                section = { "", "" },
                item = { "", "" },
                hunk = { "", "" },
            },
        },
    },
}
