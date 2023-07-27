local present, aerial = pcall(require, "aerial")

if not present then
    return
end

aerial.setup {
    backends = { "treesitter", "lsp", "markdown" },
    layout = {
        max_width = 40,
        min_width = 30,
    },
}
