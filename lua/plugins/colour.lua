return {
    {
        "norcalli/nvim-colorizer.lua",
        event = "BufReadPost",
        config = true,
    },
    {
        "ziontee113/color-picker.nvim",
        cmd = { "PickColor", "PickColorInsert" },
        opts = {
            ["icons"] = { "ﱢ", "" },
            ["border"] = "rounded", -- none | single | double | rounded | solid | shadow
            ["keymap"] = { -- mapping example:
                ["U"] = "<Plug>ColorPickerSlider5Decrease",
                ["O"] = "<Plug>ColorPickerSlider5Increase",
            },
        }
    },
}
