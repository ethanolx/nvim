local present, gps = pcall(require, "nvim-gps")

if not present then
    return
end

local icons = require("core.icons").lsp

local padded_icons = {}

for item, icon in pairs(icons) do
    padded_icons[require("core.utils").capitalize(item) .. "-name"] = icon .. " "
end

gps.setup {
    icons = padded_icons,
    separator = " » ",
}

require("core.utils").load_context_provider(gps)
