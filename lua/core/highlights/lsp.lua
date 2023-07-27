return function(colour_palette)
    return {
        DiagnosticTrace = { fg = colour_palette.nord_blue, bg = "" },
        DiagnosticDebug = { fg = colour_palette.pink, bg = "" },
        DiagnosticInfo = { fg = colour_palette.base0C, bg = "" },
        DiagnosticHint = { fg = colour_palette.purple, bg = "" },
        DiagnosticWarn = { fg = colour_palette.base09, bg = "" },
        DiagnosticError = { fg = colour_palette.red, bg = "" },

        DiagnosticUnderlineInfo = { underline = false, undercurl = true, sp = colour_palette.base0C },
        DiagnosticUnderlineHint = { underline = false, undercurl = true, sp = colour_palette.purple },
        DiagnosticUnderlineWarn = { underline = false, undercurl = true, sp = colour_palette.base09 },
        DiagnosticUnderlineError = { underline = false, undercurl = true, sp = colour_palette.red },

        -- LSP References
        LspReferenceText = { fg = colour_palette.darker_black, bg = colour_palette.white },
        LspReferenceRead = { fg = colour_palette.darker_black, bg = colour_palette.white },
        LspReferenceWrite = { fg = colour_palette.darker_black, bg = colour_palette.white },

        -- Lsp Diagnostics
        LspSignatureActiveParameter = { fg = colour_palette.black, bg = colour_palette.green },
    }
end
