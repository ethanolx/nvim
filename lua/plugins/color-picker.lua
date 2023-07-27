local present, color_picker = pcall(require, "color-picker")

if not present then
    return
end

color_picker.setup { -- for changing icons & mappings
    -- ["icons"] = { "ﱢ", "" },
    -- ["icons"] = { "ﮊ", "" },
    -- ["icons"] = { "", "ﰕ" },
    -- ["icons"] = { "", "" },
    -- ["icons"] = { "", "" },
    ["icons"] = { "ﱢ", "" },
    ["border"] = "rounded", -- none | single | double | rounded | solid | shadow
    ["keymap"] = { -- mapping example:
        ["U"] = "<Plug>ColorPickerSlider5Decrease",
        ["O"] = "<Plug>ColorPickerSlider5Increase",
    },
}
