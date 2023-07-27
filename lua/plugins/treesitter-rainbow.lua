local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
    return
end

local utils = require("core.utils")
local colour_palette = utils.get_colour_palette().base_16

treesitter.setup {
    rainbow = {
        colors = {
            colour_palette["base07"],
            colour_palette["base08"],
            colour_palette["base09"],
            colour_palette["base0A"],
            colour_palette["base0B"],
            colour_palette["base0C"],
            colour_palette["base0D"],
            colour_palette["base0E"],
        },
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
}
