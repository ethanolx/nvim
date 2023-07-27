-- +------------------------------+
-- |                              |
-- |           DEFAULT            |
-- |                              |
-- +------------------------------+

-- Leader key
vim.g.mapleader = " "

-- Set timeout for parenthesis matching
vim.g.matchparen_timeout = 5
vim.g.matchparen_insert_timeout = 5

-- Disable builtin vim plugins
local default_plugins = {
    "2html_plugin",
    "bugreport",
    "compiler",
    "ftplugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "matchit",
    "netrw",
    "netrwFileHandlers",
    "netrwPlugin",
    "netrwSettings",
    "node_provider",
    "optwin",
    "perl_provider",
    "python3_provider",
    "python_provider",
    "rplugin",
    "rrhelper",
    "ruby_provider",
    -- "spellfile_plugin",
    "synmenu",
    "syntax",
    "tar",
    "tarPlugin",
    "tutor",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
}

for _, plugin in pairs(default_plugins) do
    vim.g["loaded_" .. plugin] = true
end

-- +------------------------------+
-- |                              |
-- |            CUSTOM            |
-- |                              |
-- +------------------------------+

-- Colour Scheme
vim.g.colour_scheme = "onedark"

-- Icon Sets
vim.g.icon_sets = {
    git = "square_solid",
}

-- Providers
vim.g.providers = {
    -- hover/native
    hover = "hover",

    -- gps/navic/treesitter
    context = "navic",

    -- aerial/symbols
    outline = "symbols",
}

-- Mappings
-- 0: Do not load compatibility mappings
-- 1: Load compatibility mappings under leader prefix
-- 2: Load compatibility mappings as root mappings
vim.g.compatibility_mode = 1
