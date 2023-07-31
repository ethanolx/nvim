return {
    {
        "rlane/pounce.nvim",
        cmd = "Pounce",
        config = function()
            local pounce = require("pounce")

            require("core.utils").load_highlights(
                function(colour_palette)
                    return {
                        PounceAccept = { fg = colour_palette.one_bg, bg = colour_palette.orange },
                        PounceAcceptBest = { fg = colour_palette.one_bg, bg = colour_palette.blue },
                        PounceCursor = { fg = colour_palette.one_bg, bg = colour_palette.red },
                        PounceCursorAccept = { fg = colour_palette.one_bg, bg = colour_palette.orange },
                        PounceCursorAcceptBest = { fg = colour_palette.one_bg, bg = colour_palette.blue },
                        PounceCursorGap = { fg = colour_palette.one_bg, bg = colour_palette.red },
                        PounceGap = { fg = colour_palette.one_bg, bg = colour_palette.green },
                        PounceMatch = { fg = colour_palette.one_bg, bg = colour_palette.green },
                    }
                end
            )

            pounce.setup {}
        end,
    }
}
