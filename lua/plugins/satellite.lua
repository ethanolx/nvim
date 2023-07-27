local present, satellite = pcall(require, "satellite")

if not present then
    return
end

satellite.setup {
    current_only = true,
    winblend = 50,
    zindex = 40,
    excluded_filetypes = {},
    width = 2,
    handlers = {
        search = {
            enable = true,
        },
        diagnostic = {
            enable = true,
        },
        gitsigns = {
            enable = false,
        },
        marks = {
            enable = false,
            show_builtins = false, -- shows the builtin marks like [ ] < >
        },
    },
}
