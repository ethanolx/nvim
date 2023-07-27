return function(colour_palette)
    -- Standard syntax highlighting
    return {
        Boolean = {
            fg = colour_palette.base09,
        },

        Character = {
            fg = colour_palette.base08,
        },

        Conditional = {
            fg = colour_palette.base0E,
        },

        Constant = {
            fg = colour_palette.base08,
        },

        Define = {
            fg = colour_palette.base0E,
            sp = "none",
        },

        Delimiter = {
            fg = colour_palette.base0F,
        },

        Float = {
            fg = colour_palette.base09,
        },

        Variable = {
            fg = colour_palette.base05,
        },

        Function = {
            fg = colour_palette.base0D,
        },

        Identifier = {
            fg = colour_palette.base08,
            sp = "none",
        },

        Include = {
            fg = colour_palette.base0D,
        },

        Keyword = {
            fg = colour_palette.base0E,
        },

        Label = {
            fg = colour_palette.base0A,
        },

        Number = {
            fg = colour_palette.base09,
        },

        Operator = {
            fg = colour_palette.base05,
            sp = "none",
        },

        PreProc = {
            fg = colour_palette.base0A,
        },

        Repeat = {
            fg = colour_palette.base0A,
        },

        Special = {
            fg = colour_palette.base0C,
        },

        SpecialChar = {
            fg = colour_palette.base0F,
        },

        Statement = {
            fg = colour_palette.base08,
        },

        StorageClass = {
            fg = colour_palette.base0A,
        },

        String = {
            fg = colour_palette.base0B,
        },

        Structure = {
            fg = colour_palette.base0E,
        },

        Tag = {
            fg = colour_palette.base0A,
        },

        Type = {
            fg = colour_palette.base0A,
            sp = "none",
        },

        Typedef = {
            fg = colour_palette.base0A,
        },
    }
end
