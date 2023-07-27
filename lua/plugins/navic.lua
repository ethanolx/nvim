local present, navic = pcall(require, "nvim-navic")

if not present then
    return
end

require("core.utils").load_highlights(
    function(_)
        return {
            NavicIconsFile = { link = "TSURI" },
            NavicIconsModule = { link = "TSNamespace" },
            NavicIconsNamespace = { link = "TSNamespace" },
            NavicIconsPackage = { link = "TSNamespace" },
            NavicIconsClass = { link = "TSType" },
            NavicIconsMethod = { link = "TSMethod" },
            NavicIconsProperty = { link = "TSMethod" },
            NavicIconsField = { link = "TSField" },
            NavicIconsConstructor = { link = "TSConstructor" },
            NavicIconsEnum = { link = "TSType" },
            NavicIconsInterface = { link = "TSType" },
            NavicIconsFunction = { link = "TSFunction" },
            NavicIconsVariable = { link = "TSConstant" },
            NavicIconsConstant = { link = "TSConstant" },
            NavicIconsString = { link = "TSString" },
            NavicIconsNumber = { link = "TSNumber" },
            NavicIconsBoolean = { link = "TSBoolean" },
            NavicIconsArray = { link = "TSConstant" },
            NavicIconsObject = { link = "TSType" },
            NavicIconsKey = { link = "TSType" },
            NavicIconsNull = { link = "TSType" },
            NavicIconsEnumMember = { link = "TSField" },
            NavicIconsStruct = { link = "TSType" },
            NavicIconsEvent = { link = "TSType" },
            NavicIconsOperator = { link = "TSOperator" },
            NavicIconsTypeParameter = { link = "TSParameter" },
        }
    end
)

local icons = require("core.icons").lsp

local padded_icons = {}

for item, icon in pairs(icons) do
    padded_icons[require("core.utils").capitalize(item)] = icon .. " "
end

navic.setup {
    highlight = true,
    icons = padded_icons,
    separator = " » ",
}

require("core.utils").load_context_provider(navic)
