local present, comment = pcall(require, "Comment")

if not present then
    return
end

comment.setup {

    toggler = {
        line = "gcc",
        block = "gCC",
    },

    opleader = {
        line = "gc",
        block = "gC",
    },

    extra = {
        above = "gcO",
        below = "gco",
        eol = "gcA",
    },

    ignore = "^$",
}

local ft = require("Comment.ft")

ft.javascript = { "//%s", "/*%s*/" }
ft.yaml = "#%s"
ft.php = { "//*%s", "/*%s*/" }
