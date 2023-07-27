local present, hover = pcall(require, "hover")

if not present then
    return
end

hover.setup {
    init = function()
        -- Require providers
        require('hover.providers.lsp')
        -- require('hover.providers.gh')
        -- require('hover.providers.man')
        require('hover.providers.dictionary')
    end,
    preview_opts = {
        border = "rounded"
    },
    title = true
}

-- -- Require providers
-- require('hover.providers.lsp')
-- -- require('hover.providers.gh')
-- require('hover.providers.man')
-- require('hover.providers.dictionary')
