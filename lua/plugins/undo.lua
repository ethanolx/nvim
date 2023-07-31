return {
    {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
    },
    {
        "debugloop/telescope-undo.nvim",
        lazy = true,
        config = function()
            require("telescope").load_extension("undo")
        end
    },
}
