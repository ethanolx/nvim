local present, zen_mode = pcall(require, "zen-mode")

if not present then
    return
end

zen_mode.setup {
    window = {
        options = {
            foldcolumn = "0",
            foldenable = false,
            scrolloff = 999,
        }
    }
}