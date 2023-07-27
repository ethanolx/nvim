local present, bufferline = pcall(require, "bufferline")
local icons = require "core.icons"

if not present then
    return
end

bufferline.setup {
    options = {
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        buffer_close_icon = icons.buffer.close,
        modified_icon = icons.buffer.modified,
        close_icon = icons.buffer.close,
        show_close_icon = false,
        left_trunc_marker = icons.buffer.left_truncation .. " ",
        right_trunc_marker = icons.buffer.right_truncation .. " ",
        max_name_length = 20,
        max_prefix_length = 13,
        tab_size = 20,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        show_buffer_close_icons = true,
        separator_style = "slant",
        color_icons = true,
        show_buffer_icons = true,

        groups = {
            items = {
                require("bufferline.groups").builtin.pinned:with({
                    highlight = { gui = "bold" },
                    icon = icons.buffer.pin,
                }),
            }
        }
    },
}
