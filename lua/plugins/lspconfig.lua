local present, lspconfig = pcall(require, "lspconfig")

if not present then
    return
end

local icons = require("core.icons").diagnostic

for level, icon in pairs(icons) do
    local hl = "DiagnosticSign" .. require("core.utils").capitalize(level)
    vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

vim.diagnostic.config {
    virtual_text = false,
    signs = true,
    underline = true,
    float = {
        focusable = false,
        border = "rounded",
    },
    update_in_insert = false,
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
})

-- Borders for LspInfo winodw
local win = require "lspconfig.ui.windows"
local _default_opts = win.default_opts

win.default_opts = function(options)
    local opts = _default_opts(options)
    opts.border = "rounded"
    return opts
end

local on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = true
    client.server_capabilities.document_range_formatting = true
    if vim.g.providers.context == "navic" then
        require("nvim-navic").attach(client, bufnr)
    end
end

require("mason-lspconfig").setup_handlers {
    -- Default handler
    function(server)
        lspconfig[server].setup {
            on_attach = on_attach,
        }
    end,
    pyright = function ()
        lspconfig.pyright.setup {
            on_attach = on_attach,
            settings = {
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        diagnosticMode = "openFilesOnly",
                        useLibraryCodeForTypes = true,
                    }
                }
            }
        }
    end,
    html = function()
        lspconfig.html.setup {
            filetypes = { "html", "htmldjango" },
        }
    end,
    emmet_ls = function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        lspconfig.emmet_ls.setup {
            capabilities = capabilities,
            filetypes = { "html", "htmldjango", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
            init_options = {
                html = {
                    options = {
                            ["bem.enabled"] = true,
                    },
                },
            }
        }
    end,
    lua_ls = function()
        lspconfig.lua_ls.setup {
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim", "packer_plugins" },
                    },
                    workspace = {
                        library = {
                                [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                                [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                        },
                        maxPreload = 100000,
                        preloadFileSize = 10000,
                    },
                },
            },
        }
    end,
    jdtls = function()
        local os
        if vim.fn.has("win64") == 1 then
            os = "win"
        elseif vim.fn.has("mac") then
            os = "mac"
        else
            os = "linux"
        end
        local jar_path = vim.fn.glob(vim.fn.stdpath("data") ..
            "/packages/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar")
        local config_path = vim.fn.stdpath("data") .. "/packages/packages/jdtls/config_" .. os
        local workspace_path = vim.fn.stdpath("data") .. "/packages/packages/jdtls/workspace"
        lspconfig.jdtls.setup {
            on_attach = on_attach,
            cmd = {
                "java",
                "-jar",
                jar_path,
                "-configuration",
                config_path,
                "-data",
                workspace_path,
            },
            init_options = {
                jvm_args = {},
                workspace = workspace_path
            },
            root_dir = function(fname)
                return require("lspconfig").util.root_pattern("pom.xml", "gradle.build", ".git", ".gitignore")(fname) or
                    vim.fn.getcwd()
            end
        }
    end,
    rust_analyzer = function()
        lspconfig.rust_analyzer.setup {
            on_attach = on_attach,
            settings = {
                ["rust-analyzer"] = {
                    rustfmt = {
                        extraArgs = { "--config", "control_brace_style=ClosingNextLine" }
                    }
                }
            }
        }
    end,
    zls = function()
        lspconfig.zls.setup {
            on_attach = on_attach,
            settings = {
                enable_autofix = false,
            }
        }
    end
}
