local present, indent_blankline = pcall(require, "indent_blankline")

if not present then
    return
end

require("core.utils").load_highlights(
    function(colour_palette)
        return {
            IndentBlanklineContextChar = { fg = colour_palette.blue },
            IndentBlanklineContextStart = { fg = "", bg = "", italic = true, underline = false },
            IndentBlanklineContextSpaceChar = { fg = colour_palette.line },
            IndentBlanklineChar = { fg = colour_palette.line },
            IndentBlanklineSpaceChar = { fg = colour_palette.line },
        }
    end
)

indent_blankline.setup {
    enabled = true,
    filetype_exclude = {
        "",
        "aerial",
        "alpha",
        "DressingInput",
        "help",
        "lsp-installer",
        "lspinfo",
        "mason",
        "Outline",
        "packer",
        "TelescopePrompt",
        "TelescopeResults",
        "terminal",
    },
    buftype_exclude = { "terminal" },
    char = "",
    char_blankline = "",
    context_char = "",
    context_char_blankline = "",
    show_first_indent_level = false,
    show_trailing_blankline_indent = false,
    -- show_current_context = true,
    -- show_current_context_start = true,
    use_treesitter = true,
}
