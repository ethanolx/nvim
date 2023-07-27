local present, mason_tool_installer = pcall(require, "mason-tool-installer")

if not present then
    return
end

mason_tool_installer.setup {
    auto_update = false,
    run_on_start = false,

    ensure_installed = {
        "black",
        "debugpy",
        "prettierd",
    },
}
