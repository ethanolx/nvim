local present, neorg = pcall(require, "neorg")

if not present then
    return
end

neorg.setup {
    load = {
        ["core.defaults"] = {},
        ["core.keybinds"] = {
            config = {
                hook = function(keybinds)
                    keybinds.remap_key("presenter", "n", "h", "<C-h>")
                    keybinds.remap_key("presenter", "n", "l", "<C-l>")
                end,
            }
        },
        ["core.dirman"] = {
            config = {
                workspaces = {
                    notes = vim.fn.has("win64") == 1 and "D:\\Data\\Notes\\Neorg" or "~/notes",
                },
            },
        },
        ["core.completion"] = {
            config = {
                engine = "nvim-cmp",
                name = "[neorg]",
            },
        },
        ["core.presenter"] = {
            config = {
                zen_mode = "zen-mode",
            },
        },
        ["core.journal"] = {
            config = {
                strategy = "flat", -- NOTE: Avoid "nested" for OS-compatibility reasons
            },
        },
        ["core.manoeuvre"] = {},
        ["core.concealer"] = {},
    },
}
