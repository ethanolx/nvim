local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
    return
end

treesitter.setup {
    playground = {
        enable = true,
    }
}
