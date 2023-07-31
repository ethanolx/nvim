local utils = require("core.utils")
local icons = require("core.icons")

return {
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        config = function()
            for level, icon in pairs(icons.diagnostic) do
                local hl = "DiagnosticSign" .. utils.capitalize(level)
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

            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
                vim.lsp.handlers.hover, { border = "rounded" }
            )

            vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
                vim.lsp.handlers.signature_help,
                { border = "rounded" }
            )

            -- Borders for LspInfo winodw
            local win = require("lspconfig.ui.windows")
            local _default_opts = win.default_opts

            win.default_opts = function(options)
                local opts = _default_opts(options)
                opts.border = "rounded"
                return opts
            end
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = {
            "BufReadPre",
            "BufNewFile",
        },
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic",
        },
        config = function()
            local mason_lspconfig = require("mason-lspconfig")

            local on_attach = function(client, bufnr)
                client.server_capabilities.document_formatting = true
                client.server_capabilities.document_range_formatting = true

                if client.server_capabilities.documentSymbolProvider then
                    require("nvim-navic").attach(client, bufnr)
                end
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

            mason_lspconfig.setup_handlers {
                -- Default handler
                function(server)
                    require("lspconfig")[server].setup {
                        on_attach = on_attach,
                    }
                end,
                pyright = function()
                    require("lspconfig").pyright.setup {
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
                    require("lspconfig").html.setup {
                        filetypes = { "html", "htmldjango" },
                    }
                end,
                emmet_ls = function()
                    local capabilities = vim.lsp.protocol.make_client_capabilities()
                    capabilities.textDocument.completion.completionItem.snippetSupport = true

                    require("lspconfig").emmet_ls.setup {
                        capabilities = capabilities,
                        filetypes = { "html", "htmldjango", "typescriptreact", "javascriptreact", "css", "sass", "scss",
                            "less" },
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
                    require("lspconfig").lua_ls.setup {
                        on_attach = on_attach,
                        settings = {
                            Lua = {
                                runtime = {
                                    version = "LuaJIT",
                                },
                                diagnostics = {
                                    globals = { "vim" },
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
                    require("lspconfig").jdtls.setup {
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
                            return require("lspconfig").util.root_pattern("pom.xml", "gradle.build", ".git", ".gitignore")(
                                fname) or
                                vim.fn.getcwd()
                        end
                    }
                end,
                rust_analyzer = function()
                    require("lspconfig").rust_analyzer.setup {
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
                    require("lspconfig").zls.setup {
                        on_attach = on_attach,
                        settings = {
                            enable_autofix = false,
                        }
                    }
                end
            }
        end,
    },
    {
        "SmiteshP/nvim-navic",
        lazy = true,
        dependencies = {
            "neovim/nvim-lspconfig",
            "nvim-lualine/lualine.nvim",
        },
        config = function()
            local navic = require("nvim-navic")

            utils.load_highlights(
                function(_)
                    return {
                        NavicIconsFile = { link = "TSURI" },
                        NavicIconsModule = { link = "TSNamespace" },
                        NavicIconsNamespace = { link = "TSNamespace" },
                        NavicIconsPackage = { link = "TSNamespace" },
                        NavicIconsClass = { link = "TSType" },
                        NavicIconsMethod = { link = "TSMethod" },
                        NavicIconsProperty = { link = "TSMethod" },
                        NavicIconsField = { link = "TSField" },
                        NavicIconsConstructor = { link = "TSConstructor" },
                        NavicIconsEnum = { link = "TSType" },
                        NavicIconsInterface = { link = "TSType" },
                        NavicIconsFunction = { link = "TSFunction" },
                        NavicIconsVariable = { link = "TSConstant" },
                        NavicIconsConstant = { link = "TSConstant" },
                        NavicIconsString = { link = "TSString" },
                        NavicIconsNumber = { link = "TSNumber" },
                        NavicIconsBoolean = { link = "TSBoolean" },
                        NavicIconsArray = { link = "TSConstant" },
                        NavicIconsObject = { link = "TSType" },
                        NavicIconsKey = { link = "TSType" },
                        NavicIconsNull = { link = "TSType" },
                        NavicIconsEnumMember = { link = "TSField" },
                        NavicIconsStruct = { link = "TSType" },
                        NavicIconsEvent = { link = "TSType" },
                        NavicIconsOperator = { link = "TSOperator" },
                        NavicIconsTypeParameter = { link = "TSParameter" },
                    }
                end
            )

            navic.setup {
                highlight = true,
                icons = utils.padded_icons(),
                separator = " » ",
                depth = 5,
                depth_limit_indicator = "",
            }
        end,
    },
}
