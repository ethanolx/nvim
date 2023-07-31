local utils = require("core.utils")
local icons = require("core.icons")

return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = true,
        cmd = {
            "TSInstall",
            "TSBufEnable",
            "TSBufDisable",
            "TSEnable",
            "TSDisable",
            "TSModuleInfo",
        },
        build = ":TSUpdate",
        config = function()
            utils.load_highlights(
                function(colour_palette)
                    return {
                        TSAnnotation = {
                            fg = colour_palette.base0F,
                            sp = "none",
                        },

                        ["@attribute"] = {
                            link = "TSAttribute"
                        },

                        TSAttribute = {
                            fg = colour_palette.base0A,
                            sp = "none",
                        },

                        TSCharacter = {
                            fg = colour_palette.base08,
                            sp = "none",
                        },

                        TSConstant = {
                            link = "Constant",
                        },

                        TSConstBuiltin = {
                            fg = colour_palette.base09,
                            sp = "none",
                        },

                        TSConstMacro = {
                            fg = colour_palette.base08,
                            sp = "none",
                        },

                        TSError = {
                            fg = colour_palette.base08,
                            sp = "none",
                        },

                        TSException = {
                            fg = colour_palette.base08,
                            sp = "none",
                        },

                        TSFloat = {
                            fg = colour_palette.base09,
                            sp = "none",
                        },

                        TSKeywordFunction = {
                            fg = colour_palette.base0E,
                            sp = "none",
                        },

                        TSKeywordReturn = {
                            fg = colour_palette.base0E,
                            sp = "none",
                        },

                        TSFuncBuiltin = {
                            fg = colour_palette.base0D,
                            sp = "none",
                        },

                        TSFuncMacro = {
                            fg = colour_palette.base08,
                            sp = "none",
                        },

                        TSKeywordOperator = {
                            fg = colour_palette.base0E,
                            sp = "none",
                        },

                        TSMethod = {
                            fg = colour_palette.base0D,
                            sp = "none",
                        },

                        TSNamespace = {
                            fg = colour_palette.base08,
                            sp = "none",
                        },

                        TSNone = {
                            fg = colour_palette.base05,
                            sp = "none",
                        },

                        TSParameter = {
                            fg = colour_palette.base08,
                            sp = "none",
                        },

                        TSParameterReference = {
                            fg = colour_palette.base05,
                            sp = "none",
                        },

                        TSPunctBracket = {
                            fg = colour_palette.base0F,
                        },

                        TSPunctDelimiter = {
                            fg = colour_palette.base0F,
                            sp = "none",
                        },

                        TSPunctSpecial = {
                            fg = colour_palette.base08,
                            sp = "none",
                        },

                        TSString = {
                            link = "String",
                        },

                        TSStringRegex = {
                            fg = colour_palette.base0C,
                            sp = "none",
                        },

                        TSStringEscape = {
                            fg = colour_palette.base0C,
                            sp = "none",
                        },

                        TSSymbol = {
                            fg = colour_palette.base0B,
                            sp = "none",
                        },

                        TSTagDelimiter = {
                            fg = colour_palette.base0F,
                            sp = "none",
                        },

                        TSText = {
                            fg = colour_palette.base05,
                            sp = "none",
                        },

                        TSStrong = {
                            bold = true,
                        },

                        TSEmphasis = {
                            fg = colour_palette.base09,
                            sp = "none",
                        },

                        TSStrike = {
                            fg = colour_palette.base00,
                            sp = "none",
                            strikethrough = true,
                        },

                        TSLiteral = {
                            fg = colour_palette.base09,
                            sp = "none",
                        },

                        TSURI = {
                            fg = colour_palette.base09,
                            sp = "none",
                            underline = true,
                        },

                        TSType = {
                            link = "Type",
                        },

                        TSTypeBuiltin = {
                            fg = colour_palette.base0A,
                            sp = "none",
                        },

                        TSVariableBuiltin = {
                            fg = colour_palette.base09,
                            sp = "none",
                        },

                        TSVariable = {
                            fg = colour_palette.base05,
                        },

                        TSDefinition = { italic = true },
                        TSDefinitionUsage = { italic = true },

                        TSCurrentScope = {
                            bold = true,
                        },

                        TSField = {
                            fg = colour_palette.base0D,
                        },

                        TSFieldKey = {
                            fg = colour_palette.base08,
                        },

                        TSProperty = {
                            fg = colour_palette.base08,
                        },
                        TreesitterContext = { italic = true, },
                        TreesitterContextLineNumber = { fg = colour_palette.grey, italic = true, },
                    }
                end
            )

            require("nvim-treesitter.configs").setup {
                highlight = {
                    enable = true,
                    use_languagetree = true,
                },
                ensure_installed = {
                    "c",
                    "c_sharp",
                    "cpp",
                    "css",
                    "html",
                    "http",
                    "java",
                    "javascript",
                    "json",
                    "jsonc",
                    "lua",
                    "markdown",
                    "norg",
                    "php",
                    "python",
                    "scss",
                    "tsx",
                    "typescript",
                    "yaml",
                    "yuck",
                    "vim",
                    "zig",
                },
                indent = {
                    enable = true,
                },
                incremental_selection = {
                    enable = true,
                },
            }
        end,
    },
    {
        "nvim-treesitter/playground",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        build = ":TSInstall query",
        cmd = { "TSPlaygroundToggle" },
        require("nvim-treesitter.configs").setup {
            playground = {
                enable = true,
                disable = {},
                updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
                persist_queries = false, -- Whether the query persists across vim sessions
                keybindings = {
                    toggle_query_editor = 'o',
                    toggle_hl_groups = 'i',
                    toggle_injected_languages = 't',
                    toggle_anonymous_nodes = 'a',
                    toggle_language_display = 'I',
                    focus_language = 'f',
                    unfocus_language = 'F',
                    update = 'R',
                    goto_node = '<cr>',
                    show_help = '?',
                },
            }
        }
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        event = "BufRead",
        config = function()
            require("nvim-treesitter.configs").setup {
                textobjects = {
                    select = {
                        enable = true,

                        -- Automatically jump forward to textobj, similar to targets.vim
                        lookahead = true,

                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ["aF"] = "@function.outer",
                            ["iF"] = "@function.inner",
                            ["af"] = "@call.outer",
                            ["if"] = "@call.inner",
                            ["aC"] = "@class.outer",
                            ["iC"] = "@class.inner",
                            ["aP"] = "@parameter.outer",
                            ["iP"] = "@parameter.inner",
                            ["ac"] = "@conditional.outer",
                            ["ic"] = "@conditional.inner",
                            ["al"] = "@loop.outer",
                            ["il"] = "@loop.inner",
                            ["aS"] = "@statement.outer",
                        },
                    },
                    swap = {
                        enable = true,
                        swap_next = {
                            ["<leader>mn"] = "@parameter.inner",
                        },
                        swap_previous = {
                            ["<leader>mp"] = "@parameter.inner",
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = false,
                        goto_next_start = {
                            ["]F"] = "@function.outer",
                            ["]f"] = "@call.outer",
                            ["]C"] = "@class.outer",
                            ["]p"] = "@parameter.inner",
                            ["]P"] = "@parameter.outer",
                            ["]c"] = "@conditional.outer",
                            ["]S"] = "@statement.outer",
                        },
                        goto_next_end = {
                        },
                        goto_previous_start = {
                            ["[F"] = "@function.outer",
                            ["[f"] = "@call.outer",
                            ["[C"] = "@class.outer",
                            ["[p"] = "@parameter.inner",
                            ["[P"] = "@parameter.outer",
                            ["[c"] = "@conditional.outer",
                            ["[S"] = "@statement.outer",
                        },
                        goto_previous_end = {
                        },
                    },
                },
            }
        end
    },
    {
        "David-Kunz/treesitter-unit",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        event = "BufRead",
        config = function()
            vim.api.nvim_set_keymap('x', 'iu', ':lua require"treesitter-unit".select()<CR>',
                { noremap = true, silent = true, })
            vim.api.nvim_set_keymap('x', 'au', ':lua require"treesitter-unit".select(true)<CR>',
                { noremap = true, silent = true, })
            vim.api.nvim_set_keymap('o', 'iu', ':<c-u>lua require"treesitter-unit".select()<CR>',
                { noremap = true, silent = true, })
            vim.api.nvim_set_keymap('o', 'au', ':<c-u>lua require"treesitter-unit".select(true)<CR>',
                { noremap = true, silent = true, })
        end,
    },
    {
        "SmiteshP/nvim-gps",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        lazy = true,
        config = function()
            local padded_icons = {}

            for item, icon in pairs(icons.lsp) do
                padded_icons[utils.capitalize(item) .. "-name"] = icon .. " "
            end

            require("nvim-gps").setup {
                icons = padded_icons,
                separator = " » ",
                depth = 5,
                depth_limit_indicator = "",
            }
        end
    },
}
