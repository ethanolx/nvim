local icons = require("core.icons")

return {
    {
        "williamboman/mason.nvim",
        cmd = { "Mason" },
        config = function()

            require("mason").setup {
                ui = {
                    check_outdated_packages_on_open = false,

                    border = "rounded",

                    icons = {
                        package_installed = icons.progress.static.done,
                        package_pending = icons.progress.static.pending,
                        package_uninstalled = icons.progress.static.error,
                    },

                    keymaps = {
                        toggle_package_expand = "<CR>",
                        install_package = "i",
                        update_package = "u",
                        check_package_version = "c",
                        update_all_packages = "U",
                        check_outdated_packages = "C",
                        uninstall_package = "X",
                        cancel_installation = "<C-c>",
                        apply_language_filter = "<C-f>",
                    },
                },

                install_root_dir = vim.fn.stdpath("data") .. "/packages",
            }
        end,
    },
}
