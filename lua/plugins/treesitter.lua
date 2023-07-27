local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
    return
end

require("core.utils").load_highlights(
    function(colour_palette)
        return {
            TSAnnotation = {
                fg = colour_palette.base0F,
                sp = "none",
            },

            ["@attribute"] = {
                link = "TSAttribute"
            },

            TSAttribute = {
                fg = colour_palette.base0A,
                sp = "none",
            },

            TSCharacter = {
                fg = colour_palette.base08,
                sp = "none",
            },

            TSConstant = {
                link = "Constant",
            },

            TSConstBuiltin = {
                fg = colour_palette.base09,
                sp = "none",
            },

            TSConstMacro = {
                fg = colour_palette.base08,
                sp = "none",
            },

            TSError = {
                fg = colour_palette.base08,
                sp = "none",
            },

            TSException = {
                fg = colour_palette.base08,
                sp = "none",
            },

            TSFloat = {
                fg = colour_palette.base09,
                sp = "none",
            },

            TSKeywordFunction = {
                fg = colour_palette.base0E,
                sp = "none",
            },

            TSKeywordReturn = {
                fg = colour_palette.base0E,
                sp = "none",
            },

            TSFuncBuiltin = {
                fg = colour_palette.base0D,
                sp = "none",
            },

            TSFuncMacro = {
                fg = colour_palette.base08,
                sp = "none",
            },

            TSKeywordOperator = {
                fg = colour_palette.base0E,
                sp = "none",
            },

            TSMethod = {
                fg = colour_palette.base0D,
                sp = "none",
            },

            TSNamespace = {
                fg = colour_palette.base08,
                sp = "none",
            },

            TSNone = {
                fg = colour_palette.base05,
                sp = "none",
            },

            TSParameter = {
                fg = colour_palette.base08,
                sp = "none",
            },

            TSParameterReference = {
                fg = colour_palette.base05,
                sp = "none",
            },

            TSPunctBracket = {
                fg = colour_palette.base0F,
            },

            TSPunctDelimiter = {
                fg = colour_palette.base0F,
                sp = "none",
            },

            TSPunctSpecial = {
                fg = colour_palette.base08,
                sp = "none",
            },

            TSString = {
                link = "String",
            },

            TSStringRegex = {
                fg = colour_palette.base0C,
                sp = "none",
            },

            TSStringEscape = {
                fg = colour_palette.base0C,
                sp = "none",
            },

            TSSymbol = {
                fg = colour_palette.base0B,
                sp = "none",
            },

            TSTagDelimiter = {
                fg = colour_palette.base0F,
                sp = "none",
            },

            TSText = {
                fg = colour_palette.base05,
                sp = "none",
            },

            TSStrong = {
                bold = true,
            },

            TSEmphasis = {
                fg = colour_palette.base09,
                sp = "none",
            },

            TSStrike = {
                fg = colour_palette.base00,
                sp = "none",
                strikethrough = true,
            },

            TSLiteral = {
                fg = colour_palette.base09,
                sp = "none",
            },

            TSURI = {
                fg = colour_palette.base09,
                sp = "none",
                underline = true,
            },

            TSType = {
                link = "Type",
            },

            TSTypeBuiltin = {
                fg = colour_palette.base0A,
                sp = "none",
            },

            TSVariableBuiltin = {
                fg = colour_palette.base09,
                sp = "none",
            },

            TSVariable = {
                fg = colour_palette.base05,
            },

            TSDefinition = { italic = true },
            TSDefinitionUsage = { italic = true },

            TSCurrentScope = {
                bold = true,
            },

            TSField = {
                fg = colour_palette.base0D,
            },

            TSFieldKey = {
                fg = colour_palette.base08,
            },

            TSProperty = {
                fg = colour_palette.base08,
            },
            TreesitterContext = { italic = true, },
            TreesitterContextLineNumber = { fg = colour_palette.grey, italic = true, },
        }
    end
)

local options = {
    highlight = {
        enable = true,
        use_languagetree = true,
    },
    ensure_installed = {
        "c",
        "c_sharp",
        "cpp",
        "css",
        "html",
        "http",
        "java",
        "javascript",
        "json",
        "jsonc",
        "lua",
        "norg",
        "php",
        "python",
        "scss",
        "tsx",
        "typescript",
        "yaml",
        "yuck",
        "vim",
        "zig",
    },
    indent = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
    },
}

treesitter.setup(options)
