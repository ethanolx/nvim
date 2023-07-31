-- Load utility functions
local utils = require("core.utils")

-- Alias for creating autocommands
local autocmd = vim.api.nvim_create_autocmd

-- Buf*
autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = "quickfix", callback = utils.replace_with_trouble,
})
autocmd({ "BufReadPre", "BufNewFile" }, {
    callback = function()
        local colour_palette = utils.get_colour_palette().base_30

        require("lualine").setup {
            winbar = {
                lualine_c = {
                    {
                        "%=",
                        color = { fg = nil, bg = colour_palette.black },
                        separator = "",
                    },
                    {
                        function()
                            local navic = require("nvim-navic")
                            if navic.is_available() then
                                return navic.get_location()
                            end
                            local gps = require("nvim-gps")
                            if gps.is_available() then
                                return gps.get_location()
                            end
                            return ""
                        end,
                        separator = "",
                    },
                    {
                        "%=",
                        color = { fg = nil, bg = colour_palette.black },
                    },
                }
            }
        }
    end,
    once = true,
})

-- Cursor*
autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float({ focusable = false, border = "rounded" })
    end
})

-- Insert*
autocmd("InsertEnter", {
    pattern = "*",
    callback = function()
        vim.diagnostic.disable(0)
    end,
})
autocmd("InsertLeave", {
    pattern = "*",
    callback = function()
        vim.diagnostic.enable(0)
    end,
})

-- FileType
autocmd("FileType", {
    pattern = {
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
        "oil",
        "oil_preview",
        "packer",
        "terminal",
        "toggleterm",
    },
    callback = function ()
        vim.b.autopairs_enabled = false
    end,
})
autocmd("FileType", {
    pattern = "gitcommit",
    callback = function()
        vim.wo.signcolumn = "no"
    end,
})
autocmd("FileType", {
    pattern = "NeogitStatus",
    callback = function()
        vim.wo.foldcolumn = "0"
    end,
})
autocmd("FileType", {
    pattern = "lazy",
    callback = function ()
        vim.api.nvim_buf_set_keymap(0, 'n', '<esc>', ':close<cr>',
            { noremap = true, silent = true, })
    end
})
