-- Load utility functions
local utils = require("core.utils")

-- Alias for creating autocommands
local autocmd = vim.api.nvim_create_autocmd

-- Cursor*
autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float({ focusable = false, border = "rounded" })
    end
})

-- Buf*
autocmd("BufEnter", {
    callback = function()
        if vim.g.providers.context == "gps" then
            require "nvim-gps"
        elseif vim.g.providers.context == "navic" then
            require "nvim-navic"
        elseif vim.g.providers.context == "treesitter" then
            require "treesitter-context"
        end
    end,
    once = true,
})

autocmd({ "BufEnter", "BufWinEnter" }, { pattern = "quickfix", callback = require("core.utils").replace_with_trouble, })
-- autocmd("BufWritePre", {
--     callback = function()

--         local cursor_pos = vim.api.nvim_win_get_cursor(0)

--         -- delete trailing whitespace
--         vim.cmd([[:keepjumps keeppatterns %s/\s\+$//e]])

--         -- delete lines @ eof
--         vim.cmd([[:keepjumps keeppatterns silent! 0;/^\%(\n*.\)\@!/,$d]])

--         utils.reset_cursor_pos(cursor_pos)
--     end
-- })

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
    pattern = "gitcommit",
    callback = function()
        vim.wo.signcolumn = "no"
    end,
})
autocmd("FileType", {
    pattern = "Outline",
    callback = function()
        vim.wo.signcolumn = "no"
        vim.wo.foldcolumn = "0"
        vim.wo.foldenable = false
    end,
})
autocmd("FileType", {
    pattern = "NeogitStatus",
    callback = function()
        vim.wo.foldcolumn = "0"
    end,
})
-- autocmd("FileType", {
--     pattern = "norg",
--     callback = function()
--         vim.wo.foldcolumn = "auto:6"
--         vim.wo.signcolumn = "yes:1"
--     end,
-- })
-- autocmd("FileType", { pattern = "mason", command = "IndentBlanklineDisable" })
