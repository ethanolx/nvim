return {
    {
        "folke/flash.nvim",
        version = "*",
        lazy = true,
        opts = {
            jump = {
                nohlsearch = true,
            },
            search = {
                mode = "fuzzy",
            },
            modes = {
                search = {
                    enabled = false,
                },
            }
        }
    },
}
