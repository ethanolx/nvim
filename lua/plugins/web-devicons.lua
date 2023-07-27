local present, web_devicons = pcall(require, "nvim-web-devicons")

if not present then
    return
end

require("core.utils").load_highlights(
    function(colour_palette)
        return {
            DevIconC = { fg = colour_palette.blue },
            DevIconClangFormat = { fg = colour_palette.blue },
            DevIconCss = { fg = colour_palette.blue },
            DevIconDeb = { fg = colour_palette.cyan },
            DevIconDefault = { fg = colour_palette.red },
            DevIconEditorConfig = { fg = colour_palette.white },
            DevIconDockerfile = { fg = colour_palette.cyan },
            DevIconGitAttributes = { fg = "#E94E31" },
            DevIconGitCommit = { fg = "#E94E31" },
            DevIconGitConfig = { fg = "#E94E31" },
            DevIconGitIgnore = { fg = "#E94E31" },
            DevIconGitLogo = { fg = "#E94E31" },
            DevIconGitModules = { fg = "#E94E31" },
            DevIconHtm = { fg = "#DF4A17" },
            DevIconHtml = { fg = "#DF4A17" },
            DevIconJS = { fg = "#E9D44D" },
            DevIconJpeg = { fg = colour_palette.dark_purple },
            DevIconJpg = { fg = colour_palette.dark_purple },
            DevIconJs = { fg = colour_palette.sun },
            DevIconKt = { fg = colour_palette.orange },
            DevIconLock = { fg = colour_palette.red },
            DevIconLua = { fg = colour_palette.blue },
            DevIconMakefile = { fg = colour_palette.purple },
            DevIconMarkdown = { fg = "#822D06" },
            DevIconMd = { fg = colour_palette.grey },
            DevIconMp3 = { fg = colour_palette.white },
            DevIconMp4 = { fg = colour_palette.white },
            DevIconOut = { fg = colour_palette.white },
            DevIconPng = { fg = colour_palette.dark_purple },
            DevIconPy = { fg = colour_palette.cyan },
            DevIconRb = { fg = colour_palette.pink },
            DevIconRpm = { fg = colour_palette.orange },
            DevIconToml = { fg = colour_palette.blue },
            DevIconTs = { fg = colour_palette.teal },
            DevIconTtf = { fg = colour_palette.white },
            DevIconVue = { fg = colour_palette.vibrant_green },
            DevIconWoff = { fg = colour_palette.white },
            DevIconWoff2 = { fg = colour_palette.white },
            DevIconXz = { fg = colour_palette.sun },
            DevIconZip = { fg = colour_palette.sun },
        }
    end
)

web_devicons.setup {
    default = true,
    override = require("core.icons").devicon
}
