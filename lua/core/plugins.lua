-- Bootstrap packer.nvim installation
local fresh_install = false
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    print("Commencing initial installation...")
    vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd("packadd packer.nvim")
    fresh_install = true
end

-- Load packer
local packer = require("packer")

-- Fetch icons
local icons = require("core.icons")

-- Initialize packer
packer.init {
    auto_clean = true,
    compile_on_sync = true,
    snapshot_path = vim.fn.stdpath("data") .. "/snapshot/",
    display = {
        -- Symbols
        working_sym = icons.progress.static.pending .. " ",
        error_sym = icons.progress.static.error .. " ",
        done_sym = icons.progress.static.done .. " ",
        removed_sym = icons.progress.static.removed .. " ",
        moved_sym = icons.progress.static.moved .. " ",

        -- Borders
        prompt_border = "rounded",
        open_fn = function() return require("packer.util").float({ border = "rounded" }) end,

        -- Keybindings
        keybindings = {
            quit = "<esc>",
        }
    },
}

-- Load plugins
packer.startup(function(use)
    local plugins = require("plugins")

    for plugin, opts in pairs(plugins) do
        table.insert(opts, plugin)
    use(opts)
    end

    -- Install latest plugins if fresh installation
    if fresh_install then
        packer.sync()
    end
end)
