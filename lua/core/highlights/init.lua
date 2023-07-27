local default_categories = {
    "default",
    "git",
    "lsp",
    "syntax",
    "devicon",
}

for _, category in ipairs(default_categories) do
    require("core.utils").load_highlights(require("core.highlights." .. category))
end
