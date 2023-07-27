return function(colour_palette)
    return {
        GitSignsCurrentLineBlame = { fg = colour_palette.grey_fg, italic = true },

        DiffAdd = { fg = colour_palette.vibrant_green },
        DiffAdded = { fg = colour_palette.vibrant_green },
        DiffChange = { fg = colour_palette.yellow },
        diffChanged = { fg = colour_palette.yellow },
        DiffModified = { fg = colour_palette.yellow },
        DiffDelete = { fg = colour_palette.red },
        DiffRemoved = { fg = colour_palette.red },
        DiffChangeDelete = { fg = colour_palette.yellow },

        -- git commits
        gitcommitOverflow = { fg = colour_palette.base08, },
        gitcommitSummary = { fg = colour_palette.base08, },
        gitcommitComment = { fg = colour_palette.base03, },
        gitcommitUntracked = { fg = colour_palette.base03, },
        gitcommitDiscarded = { fg = colour_palette.base03, },
        gitcommitSelected = { fg = colour_palette.base03, },
        gitcommitHeader = { fg = colour_palette.base0E, },
        gitcommitSelectedType = { fg = colour_palette.base0D, },
        gitcommitUnmergedType = { fg = colour_palette.base0D, },
        gitcommitDiscardedType = { fg = colour_palette.base0D, },
        gitcommitBranch = { fg = colour_palette.base09, bold = true, },
        gitcommitUntrackedFile = { fg = colour_palette.base0A, },
        gitcommitUnmergedFile = { fg = colour_palette.base08, bold = true, },
        gitcommitDiscardedFile = { fg = colour_palette.base08, bold = true, },
        gitcommitSelectedFile = { fg = colour_palette.base0B, bold = true, },
    }
end
