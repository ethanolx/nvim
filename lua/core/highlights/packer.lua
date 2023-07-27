return function(colour_palette)
    return {
        PackerPackageName = { fg = colour_palette.red },
        PackerSuccess = { fg = colour_palette.green },
        PackerStatusSuccess = { fg = colour_palette.base08 },
        PackerStatusCommit = { fg = colour_palette.blue },
        PackeProgress = { fg = colour_palette.blue },
        PackerOutput = { fg = colour_palette.red },
        PackerStatus = { fg = colour_palette.blue },
        PackerHash = { fg = colour_palette.blue },
    }
end
