return {
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        config = function()
            require("Comment").setup {
                toggler = {
                    line = "gcc",
                    block = "gCC",
                },

                opleader = {
                    line = "gc",
                    block = "gC",
                },

                extra = {
                    above = "gcO",
                    below = "gco",
                    eol = "gcA",
                },

                ignore = "^$",
            }

            local ft = require("Comment.ft")

            ft.javascript = { "//%s", "/*%s*/" }
            ft.php = { "//*%s", "/*%s*/" }
            ft.yaml = "#%s"
        end,
    },
    {
        "folke/todo-comments.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = true,
    },
}
