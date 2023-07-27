local present, persisted = pcall(require, "persisted")

if not present then
    return
end

local buffer_manager = {
    close = function ()
        if packer_plugins["nvim-tree.lua"].loaded then
            local nvim_tree_view = require "nvim-tree.view"

            vim.g.open_nvim_tree = nvim_tree_view.is_visible()
            vim.cmd "NvimTreeClose"
        end

        -- if packer_plugins["symbols-outline.nvim"].loaded then
        --     local symbols_outline = require "symbols-outline"

        --     vim.g.open_symbols_outline = symbols_outline.state.outline_buf ~= nil
        --     vim.cmd "SymbolsOutlineClose"
        -- end
    end,
    open = function ()
        if packer_plugins["nvim-tree.lua"].loaded then
            if vim.g.open_nvim_tree then
                local nvim_tree = require "nvim-tree"
                nvim_tree.toggle(false, true)
            end
        end

        -- if packer_plugins["symbols-outline.nvim"].loaded then
        --     if vim.g.open_symbols_outline then
        --         vim.cmd "SymbolsOutlineOpen"
        --     end
        -- end
    end
}

persisted.setup {
    -- autoload = true,
    autosave = false,
    use_git_branch = false,
    before_save = buffer_manager.close,
    after_save = buffer_manager.open,
    after_source = buffer_manager.open,
}

local telescope_present, telescope = pcall(require, "telescope")

if not telescope_present then
    return
end

telescope.load_extension "persisted"
