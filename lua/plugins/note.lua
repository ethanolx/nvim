return {
    {
        "nvim-neorg/neorg",
        version = "*",
        ft = "norg",
        cmd = "Neorg",
        build = ":Neorg sync-parsers",
        config = function()
            require("neorg").setup {
                load = {
                    ["core.defaults"] = {},
                    ["core.keybinds"] = {
                        config = {
                            neorg_leader = "<leader>",
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
                            default_workspace = "notes",
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
                            -- NOTE: Avoid "nested" for OS-compatibility reasons
                            strategy = "flat",
                        },
                    },
                    ["core.manoeuvre"] = {},
                    ["core.concealer"] = {},
                },

            }
            local cmp = require("cmp")
            cmp.setup.filetype("norg", {
                sources = cmp.config.sources({
                    { name = "neorg" },
                    { name = "luasnip", keyword_length = 1, max_item_count = 5 },
                    { name = "buffer" },
                })
            })
        end
    },
}
