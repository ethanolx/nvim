local present, todo = pcall(require, "todo-comments")

if not present then
   return
end

todo.setup {
    -- keywords = {
    --     FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
    --     TODO = { icon = " ", color = "info" },
    --     HACK = { icon = " ", color = "warning" },
    --     WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
    --     PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    --     NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    --     OPT = { icon = " ", color = "optional", alt = { "OPTIONAL" }},
    -- },
    -- merge_keywords = false,
}
