-- vim.opt.fileformat = "dos"
vim.cmd [[filetype plugin on]]

vim.g.db_ui_use_nerd_fonts = true
vim.g.db_ui_icons = {
    expanded = {
        db = "▾ ",
        buffers = "▾ ",
        saved_queries = "▾ ",
        schemas = "▾ ",
        schema = "▾ פּ",
        tables = "▾ ",
        table = "▾ ",
    },
    collapsed = {
        db = "▸ ",
        buffers = "▸ ",
        saved_queries = "▸ ",
        schemas = "▸ ",
        schema = "▸ פּ",
        tables = "▸ ",
        table = "▸ ",
    },
    saved_query = "",
    new_query = "",
    tables = "",
    buffers = "﬘",
    add_connection = "",
    connection_ok = "✓",
    connection_error = "✗",
}

vim.api.nvim_create_autocmd("FileType", {
    pattern = "dbui",
    callback = function ()
        vim.bo.shiftwidth = 2
    end,
})

-- vim.g.db_ui_table_helpers = {
--     mysql = {
--         count = "SELECT COUNT(*) FROM {table}";
--     }
-- }
