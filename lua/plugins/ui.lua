local utils = require("core.utils")
local icons = require("core.icons")

return {
    {
        "rcarriga/nvim-notify",
        lazy = true,
        init = function()
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.notify = function(...)
                require("lazy").load({ plugins = { "nvim-notify" } })
                return vim.notify(...)
            end
        end,
        config = function()
            local notify = require("notify")

            notify.setup {
                fps = 30,
                icons = {
                    DEBUG = icons.diagnostic.debug,
                    ERROR = icons.diagnostic.error,
                    WARN = icons.diagnostic.warn,
                    INFO = icons.diagnostic.info,
                    TRACE = icons.diagnostic.trace,
                },
                -- level = "info",
                level = "trace",
                minimum_width = 40,
                render = "default",
                stages = "fade_in_slide_out",
                timeout = 1000,
                on_open = function(win)
                    local offset = 2

                    -- Manually calculate the dimensions of the notification window
                    local content_width = vim.api.nvim_win_get_width(win)
                    local content_height = vim.api.nvim_win_get_height(win) - offset
                    local content_length = content_width * content_height
                    local new_content_width = 40 -- match minimum_width
                    local new_content_height = math.ceil(content_length / new_content_width)

                    -- Coerce notification windows to be of width 40, height auto
                    vim.api.nvim_win_set_width(win, new_content_width)
                    vim.api.nvim_win_set_height(win, new_content_height + offset + 1) -- for wrapping at spaces
                    vim.api.nvim_win_set_option(win, "wrap", true)

                    vim.api.nvim_win_set_option(win, "winblend", 30)
                    vim.api.nvim_win_set_config(win, { zindex = 100 })
                end,
            }

        end,
    },
    {
        "stevearc/dressing.nvim",
        lazy = true,
        init = function()
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.select = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.select(...)
            end
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.input = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.input(...)
            end
        end,
        config = function()
            require("core.utils").load_highlights(
                function(colour_palette)
                    return {
                        FloatTitle = {
                            fg = colour_palette.black,
                            bg = colour_palette.yellow,
                        },
                    }
                end
            )

            require("dressing").setup {
                input = {
                    win_options = {
                        winblend = 0,
                    },
                    prompt_align = "center",
                    default_prompt = "Input",
                    relative = "editor",
                    prefer_width = 80,
                    get_config = function(_)
                    end
                },
                select = {},
            }
        end,
    },
    {
        "lewis6991/satellite.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            current_only = true,
            winblend = 50,
            zindex = 40,
            excluded_filetypes = {
                "NvimTree"
            },
            width = 2,
            handlers = {
                search = {
                    enable = true,
                },
                diagnostic = {
                    enable = true,
                },
                gitsigns = {
                    enable = false,
                },
                marks = {
                    enable = false,
                    show_builtins = false,
                },
            },
        }
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            utils.load_highlights(
                function(colour_palette)
                    return {
                        IndentBlanklineContextChar = { fg = colour_palette.blue },
                        IndentBlanklineContextStart = { fg = "", bg = "", italic = true, underline = false },
                        IndentBlanklineContextSpaceChar = { fg = colour_palette.line },
                        IndentBlanklineChar = { fg = colour_palette.line },
                        IndentBlanklineSpaceChar = { fg = colour_palette.line },
                    }
                end
            )

            require("indent_blankline").setup {
                enabled = true,
                filetype_exclude = {
                    "",
                    "DressingInput",
                    "Outline",
                    "TelescopePrompt",
                    "TelescopeResults",
                    "Trouble",
                    "aerial",
                    "alpha",
                    "dashboard",
                    "help",
                    "lazy",
                    "lazyterm",
                    "lsp-installer",
                    "lspinfo",
                    "mason",
                    "noice",
                    "notify",
                    "oil_preview",
                    "packer",
                    "terminal",
                    "toggleterm",
                },
                buftype_exclude = { "terminal" },
                char = "",
                char_blankline = "",
                context_char = "",
                context_char_blankline = "",
                show_first_indent_level = false,
                show_trailing_blankline_indent = false,
                -- show_current_context = true,
                -- show_current_context_start = true,
                use_treesitter = true,
            }
        end
    },
    {
        "folke/noice.nvim",
        version = "*",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        event = "VeryLazy",
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
                hover = {
                    enabled = false,
                },
                signature = {
                    enabled = false,
                },
            },
            routes = {
                {
                    filter = {
                        event = "msg_show",
                        any = {
                            { find = "%d+L, %d+B" },
                            { find = "; after #%d+" },
                            { find = "; before #%d+" },
                        },
                    },
                    view = "mini",
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = true,
            },
        },
    },
    {
        "folke/twilight.nvim",
        version = "*",
        cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
        config = true,
    },
    {
        "folke/zen-mode.nvim",
        version = "*",
        dependencies = {
            "folke/twilight.nvim",
        },
        cmd = "ZenMode",
        opts = {
            window = {
                options = {
                    foldcolumn = "0",
                    foldenable = false,
                    scrolloff = 999,
                }
            },
        },
    },
    { "nvim-tree/nvim-web-devicons", lazy = true, },
    { "MunifTanjim/nui.nvim",        lazy = true, },
    { "nvim-lua/popup.nvim",         lazy = true, }
}
