local present, mason_lspconfig = pcall(require, "mason-lspconfig")

if not present then
    return
end

mason_lspconfig.setup {
    automatic_installation = true,

    ensure_installed = {
        "asm_lsp",
        "clangd",
        "csharp_ls",
        "cssls",
        "dockerls",
        "emmet_ls",
        "html",
        "intelephense",
        "jdtls",
        "jsonls",
        "powershell_es",
        "prosemd_lsp",
        "pyright",
        "rust_analyzer",
        "sqlls",
        "lua_ls",
        "taplo",
        "tsserver",
        "vimls",
        "zls",
    }
}
