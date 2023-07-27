local present, notify = pcall(require, "notify")

if not present then
    return
end

local icons = require "core.icons"

vim.notify = notify

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
    end,
}
