local utils = require("core.utils")
local icons = require("core.icons")

return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = function()
            local colour_palette = utils.get_colour_palette().base_30

            return {
                options = {
                    theme = {
                        normal = {
                            a = { fg = colour_palette.black, bg = colour_palette.vibrant_green, gui = 'bold' },
                            b = { fg = colour_palette.white, bg = colour_palette.lightbg },
                            c = { fg = colour_palette.white, bg = colour_palette.black },
                        },
                        command = { a = { fg = colour_palette.black, bg = colour_palette.red, gui = 'bold' } },
                        insert = { a = { fg = colour_palette.black, bg = colour_palette.sun, gui = 'bold' } },
                        visual = { a = { fg = colour_palette.black, bg = colour_palette.cyan, gui = 'bold' } },
                        terminal = { a = { fg = colour_palette.black, bg = colour_palette.blue, gui = 'bold' } },
                        replace = { a = { fg = colour_palette.orange, bg = colour_palette.orange, gui = 'bold' } },
                        inactive = {
                            a = { fg = colour_palette.grey, bg = colour_palette.one_bg, gui = 'bold' },
                            b = { fg = colour_palette.grey, bg = colour_palette.one_bg },
                            c = { fg = colour_palette.grey, bg = colour_palette.black },
                        },
                    },
                    globalstatus = true,
                    disabled_filetypes = {
                        winbar = {
                            "",
                            "DressingInput",
                            "NvimTree",
                            "Outline",
                            "TelescopePrompt",
                            "TelescopeResults",
                            "Trouble",
                            "aerial",
                            "alpha",
                            "dap-repl",
                            "dapui_breakpoints",
                            "dapui_console",
                            "dapui_scopes",
                            "dapui_stacks",
                            "dapui_watches",
                            "dashboard",
                            "help",
                            "lazy",
                            "lazyterm",
                            "lsp-installer",
                            "lspinfo",
                            "mason",
                            "notify",
                            "oil_preview",
                            "packer",
                            "terminal",
                            "toggleterm",
                        },
                        statusline = {
                            "TelescopePrompt",
                        },
                    },
                },
                sections = {
                    lualine_a = {
                        {
                            "mode",
                            icon = icons.generic.main,
                        },
                    },
                    lualine_b = {
                        {
                            function()
                                return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
                            end,
                            icon = icons.lsp.folder,
                            separator = ""
                        },
                        {
                            "filetype",
                            icon_only = true,
                            separator = "",
                            padding = { left = 1, right = 0 },
                        },
                        {
                            "filename",
                            newfile_status = true,
                            symbols = {
                                modified = icons.buffer.modified,
                                readonly = "󰈡",
                                unnamed = "󰟢",
                                newfile = icons.git.status.untracked,
                            },
                        },
                    },
                    lualine_c = {
                        {
                            "branch",
                            color = { bg = colour_palette.statusline_bg },
                            icon = "",
                        },
                        {
                            "diff",
                            colored = true,
                            separator = "",
                            diff_color = {
                                added    = "DiffAdd",
                                modified = "DiffChange",
                                removed  = "DiffDelete",
                            },
                            symbols = {
                                added = icons.git.diff.add .. " ",
                                modified = icons.git.diff.change .. " ",
                                removed = icons.git.diff.delete .. " ",
                            },
                            source = function()
                                local status = {
                                    added = 0,
                                    modified = 0,
                                    removed = 0
                                }
                                if vim.b.gitsigns_status_dict then
                                    status = vim.b.gitsigns_status_dict
                                    status.modified = status.changed
                                end
                                return status
                            end,
                        },
                        {
                            "diagnostics",
                            sources = { "nvim_lsp" },
                            sections = { "info", "hint", "warn", "error" },

                            diagnostics_color = {
                                error = "DiagnosticError",
                                warn  = "DiagnosticWarn",
                                info  = "DiagnosticInfo",
                                hint  = "DiagnosticHint",
                            },
                            symbols = {
                                error = icons.diagnostic.error .. " ",
                                warn = icons.diagnostic.warn .. " ",
                                hint = icons.diagnostic.hint .. " ",
                                info = icons.diagnostic.info .. " ",
                            },
                            colored = true,
                            update_in_insert = false,
                            always_visible = false,
                        },
                        {
                            require("noice").api.statusline.mode.get,
                            cond = require("noice").api.statusline.mode.has,
                            color = { fg = colour_palette.orange },
                        }
                    },
                    lualine_x = {
                        {
                            function()
                                local clients = {}

                                for _, client in pairs(vim.lsp.buf_get_clients(0)) do
                                    clients[#clients + 1] = client.name
                                end

                                return table.concat(clients, " ")
                            end,
                            icon = icons.category.lsp,
                            color = { fg = colour_palette.nord_blue },
                            separator = "",
                        },
                        {
                            "fileformat",
                            color = { bg = colour_palette.statusline_bg },
                            fmt = function(ff, _)
                                if vim.bo.fileencoding == "" then
                                    return ff
                                end
                                return ff .. " " .. string.upper(vim.bo.fileencoding)
                            end
                        },
                    },
                    lualine_y = {
                        {
                            function()
                                local current_line = vim.fn.line "."
                                local total_line = vim.fn.line "$"
                                local current_col = vim.fn.col "."

                                local prefix = ""
                                if current_line == 1 then
                                    prefix = icons.position.top
                                elseif current_line == total_line then
                                    prefix = icons.position.bottom
                                else
                                    local percentage, _ = math.modf((current_line / total_line) * 100)
                                    prefix = tostring(percentage) .. "%%"
                                end

                                return prefix .. " " .. current_line .. ":" .. current_col
                            end,
                            icon = icons.position.symbol,
                        }
                    },
                    lualine_z = {
                        "'" .. icons.generic.main .. "'",
                    },
                },
            }
        end,
    },
}
