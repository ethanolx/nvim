return {
    {
        "lewis6991/hover.nvim",
        lazy = true,
        opts = {
            init = function()
                -- Require providers
                require('hover.providers.lsp')
                -- require('hover.providers.gh')
                require('hover.providers.dictionary')
                require('hover.providers.man')
            end,
            preview_opts = {
                border = "rounded"
            },
            title = true
        },
    },
}
