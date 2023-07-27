return function(colour_palette)
    return {
        ["@text.danger"] = {
            fg = colour_palette.red,
        },

        Whitespace = { fg = colour_palette.line },
        MatchWord = {
            bg = colour_palette.grey,
            fg = colour_palette.white,
        },

        Pmenu = { bg = "" },
        PmenuSbar = { bg = "" },
        PmenuSel = { bg = colour_palette.pmenu_bg, fg = colour_palette.black },
        PmenuThumb = { bg = colour_palette.grey },

        MatchParen = { link = "MatchWord" },

        Comment = { fg = colour_palette.grey_fg },

        CursorLineNr = { fg = colour_palette.white },
        LineNr = { fg = colour_palette.grey },

        -- floating windows
        FloatBorder = { fg = colour_palette.grey },
        NormalFloat = {},

        NvimInternalError = { fg = colour_palette.red },
        WinSeparator = { fg = colour_palette.line },
        VertSplit = { fg = colour_palette.line, bg = "" },

        Normal = {
            fg = colour_palette.base05,
            bg = colour_palette.base00,
        },

        Bold = {
            bold = true,
        },

        Debug = {
            fg = colour_palette.base08,
        },

        Todo = {
            fg = "",
            bg = "",
        },

        Directory = {
            fg = colour_palette.base0D,
        },

        Error = {
            fg = colour_palette.base00,
            bg = colour_palette.base08,
        },

        ErrorMsg = {
            fg = colour_palette.base08,
            bg = colour_palette.base00,
        },

        Exception = {
            fg = colour_palette.base08,
        },

        FoldColumn = { fg = colour_palette.teal, bg = "" },
        Folded = { fg = "", bg = colour_palette.one_bg2 },

        IncSearch = {
            fg = colour_palette.base01,
            bg = colour_palette.base09,
        },

        Italic = {
            italic = true,
        },

        Macro = {
            fg = colour_palette.base08,
        },

        ModeMsg = {
            fg = colour_palette.base0B,
        },

        MoreMsg = {
            fg = colour_palette.base0B,
        },

        Question = {
            fg = colour_palette.base0D,
        },

        Search = {
            fg = colour_palette.base01,
            bg = colour_palette.base0A,
        },

        Substitute = {
            fg = colour_palette.base01,
            bg = colour_palette.base0A,
            sp = "none",
        },

        SpecialKey = {
            fg = colour_palette.base03,
        },

        TooLong = {
            fg = colour_palette.base08,
        },

        UnderLined = {
            -- fg = colour_palette.base0B,
            underline = true,
        },

        Visual = {
            bg = colour_palette.base02,
        },

        VisualNOS = {
            fg = colour_palette.base08,
        },

        WarningMsg = {
            fg = colour_palette.base08,
        },

        WinBar = {
        },

        WildMenu = {
            fg = colour_palette.base08,
            bg = colour_palette.base0A,
        },

        Title = {
            fg = colour_palette.base0D,
            sp = "none",
        },

        Conceal = {
            bg = "NONE",
        },

        Cursor = { reverse = true },

        NonText = {
            fg = colour_palette.base03,
        },

        SignColumn = {
            fg = colour_palette.base03,
            sp = "NONE",
        },

        ColorColumn = {
            bg = colour_palette.base01,
            sp = "none",
        },

        CursorColumn = {
            bg = colour_palette.base01,
            sp = "none",
        },

        CursorLine = {
            bg = "none",
            sp = "none",
        },

        QuickFixLine = {
            bg = colour_palette.base01,
            sp = "none",
        },

        -- spell
        SpellBad = {
            undercurl = true,
            sp = colour_palette.base08,
        },

        SpellLocal = {
            undercurl = true,
            sp = colour_palette.base0C,
        },

        SpellCap = {
            undercurl = true,
            sp = colour_palette.base0D,
        },

        SpellRare = {
            undercurl = true,
            sp = colour_palette.base0E,
        },

        StatusLine = {
            fg = colour_palette.nord_blue,
            bg = colour_palette.statusline_bg,
        },
        TabLine = {
            fg = colour_palette.nord_blue,
            bg = colour_palette.black,
        },
        TabLineSel = {
            fg = colour_palette.nord_blue,
            bg = colour_palette.black,
        },
        TabLineFill = {
            bg = colour_palette.black,
        }
    }
end
