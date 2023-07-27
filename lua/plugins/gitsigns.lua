local present, gitsigns = pcall(require, "gitsigns")

if not present then
    return
end

local options = {
    current_line_blame = true,
    current_line_blame_formatter = "  <author>, <author_time:%d/%m/%Y> • <summary>",
    sign_priority = 1,
    preview_config = {
        border = "rounded",
        style = "minimal",
        relative = "cursor",
        focusable = true,
        row = 0,
        col = 1,
    },
}

gitsigns.setup(options)
