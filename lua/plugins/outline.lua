local utils = require("core.utils")

return {
    {
        "stevearc/aerial.nvim",
        cmd = {
            "AerialToggle",
            "AerialOpen",
        },
        opts = {
            backends = {
                "lsp",
                "treesitter",
                "markdown"
            },
            layout = {
                max_width = 40,
                min_width = 30,
            },
            icons = utils.padded_icons(),
        }
    },
}
