-- Initialize icon table
local icons = {}

-- Declare default icon sets (nil: no options)
local default_icon_sets = {
    buffer = "",
    category = "",
    devicon = "",
    diagnostic = "outline",
    explorer = "outline",
    filesystem = "rounded",
    fold = "thin",
    generic = "outline",
    git = "circle_solid",
    lsp = "nerdfont",
    os = "",
    position = "hexagon_outline",
    progress = "pie",
    separator = "arrow",
}

-- Determine selected icon sets
local icon_sets = {}
for label, default_set in pairs(default_icon_sets) do
    if default_set ~= "" and vim.g.icon_sets ~= nil and vim.g.icon_sets[label] ~= nil then
        icon_sets[label] = vim.g.icon_sets[label]
    end
end

-- Load icons
for label, set in pairs(default_icon_sets) do
    if set == "" then
        icons[label] = require("core.icons." .. label)
    else
        -- Attempt to load icon set, otherwise fall back to default
        local _icons = require("core.icons." .. label)
        icons[label] = _icons[icon_sets[label]] or _icons[set]
    end
end

-- Inject icon dependencies

-- category
icons.category.location = icons.position.symbol

-- devicon --
icons.devicon.default_icon = {
    icon = icons.filesystem.file,
    name = "Default",
}

-- lsp --
icons.lsp.file = icons.filesystem.file
icons.lsp.folder = icons.filesystem.closed_folder

-- progress --
icons.progress.static.error = icons.git.status.unstaged
icons.progress.static.done = icons.git.status.staged
icons.progress.static.moved = icons.git.status.renamed
icons.progress.static.removed = icons.git.status.deleted

return icons
