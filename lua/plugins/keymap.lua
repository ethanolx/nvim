local utils = require("core.utils")

return {
    {
        "folke/which-key.nvim",
        config = function()
            local which_key = require("which-key")

            utils.load_highlights(
                function(colour_palette)
                    return {
                        WhichKey = { fg = colour_palette.blue },
                        WhichKeySeparator = { fg = colour_palette.light_grey },
                        WhichKeyDesc = { fg = colour_palette.red },
                        WhichKeyGroup = { fg = colour_palette.green },
                        WhichKeyValue = { fg = colour_palette.green },
                    }
                end
            )

            which_key.setup {
                plugins = {
                    spelling = {
                        enabled = true,
                        suggestions = 30,
                    }
                },

                icons = {
                    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
                    separator = "", -- symbol used between a key and it's label
                    group = "", -- symbol prepended to a group
                },

                operators = {
                    gc = "comments",
                    ys = "surround",
                },

                popup_mappings = {
                    scroll_down = "<C-d>", -- binding to scroll down inside the popup
                    scroll_up = "<C-u>", -- binding to scroll up inside the popup
                },

                window = {
                    border = "rounded", -- none/single/double/shadow
                    margin = { 0, 0, 0, 0 },
                    padding = { 1, 1, 1, 1 },
                },

                layout = {
                    spacing = 5, -- spacing between columns
                },
            }

            utils.load_mappings(require("core.mappings"), which_key)
        end,
    },
}
