local present, telescope = pcall(require, "telescope")

if not present then
    return
end

require "nvim-treesitter"

require("core.utils").load_highlights(
    function(colour_palette)
        return {
            TelescopeBorder = { fg = colour_palette.grey, },
            TelescopePromptBorder = { fg = colour_palette.grey, },
            TelescopePromptNormal = { fg = colour_palette.white, },
            TelescopePromptPrefix = { fg = colour_palette.red, },
            TelescopeNormal = { bg = colour_palette.darker_black },
            TelescopePreviewTitle = { fg = colour_palette.black, bg = colour_palette.green, },
            TelescopePromptTitle = { fg = colour_palette.black, bg = colour_palette.red, },
            TelescopeResultsTitle = { fg = colour_palette.black, bg = colour_palette.nord_blue, },
            TelescopeSelection = { bg = colour_palette.one_bg, fg = colour_palette.white, },
            TelescopeResultsDiffAdd = { fg = colour_palette.green, },
            TelescopeResultsDiffChange = { fg = colour_palette.yellow, },
            TelescopeResultsDiffDelete = { fg = colour_palette.red, },
        }
    end
)

local options = {
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
        file_ignore_patterns = { "node_modules" },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
    }
}

telescope.setup(options)

telescope.load_extension "notify"
