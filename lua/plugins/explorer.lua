local icons = require("core.icons")

return {
    {
        "kyazdani42/nvim-tree.lua",
        cmd = {
            "NvimTreeFindFile",
            "NvimTreeFindFileToggle",
            "NvimTreeFocus",
            "NvimTreeOpen",
            "NvimTreeRefresh",
            "NvimTreeToggle",
        },
        config = function()
            local tree = require("nvim-tree")

            require("core.utils").load_highlights(
                function(colour_palette)
                    return {
                        NvimTreeEmptyFolderName = { fg = colour_palette.folder_bg },
                        NvimTreeEndOfBuffer = { fg = colour_palette.black },
                        NvimTreeFolderIcon = { link = "Directory" },
                        NvimTreeFolderName = { fg = colour_palette.folder_bg },
                        NvimTreeIndentMarker = { fg = colour_palette.grey_fg },
                        NvimTreeNormal = { bg = colour_palette.black },
                        NvimTreeNormalNC = { bg = colour_palette.black },
                        NvimTreeOpenedFolderName = { fg = colour_palette.folder_bg },
                        NvimTreeGitIgnored = { fg = colour_palette.light_grey },

                        -- NvimTreeWinSeparator = {
                        --     fg = colour_palette.black,
                        --     bg = colour_palette.black,
                        -- },

                        NvimTreeWindowPicker = {
                            fg = colour_palette.red,
                            bg = colour_palette.black2,
                        },

                        NvimTreeCursorLine = {
                            bg = colour_palette.black2,
                        },

                        NvimTreeGitModified = { fg = colour_palette.yellow },
                        NvimTreeGitDirty = { fg = colour_palette.yellow },
                        NvimTreeGitMerge = { fg = colour_palette.orange },
                        NvimTreeGitStaged = { fg = colour_palette.vibrant_green },
                        NvimTreeGitNew = { fg = colour_palette.vibrant_green },
                        NvimTreeGitDeleted = { fg = colour_palette.red },
                        NvimTreeLiveFilterPrefix = { fg = colour_palette.dark_purple },

                        NvimTreeSpecialFile = {
                            fg = colour_palette.yellow,
                            bold = true,
                        },

                        NvimTreeRootFolder = {
                            fg = colour_palette.red,
                            bold = true,
                        },
                    }
                end
            )

            local icon_padding = ""
            if (vim.fn.has('unix') == 1 or vim.fn.has('macunix') == 1) then
                icon_padding = " "
            end

            local options = {
                create_in_closed_folder = false,
                auto_reload_on_write = false,
                disable_netrw = true,
                hijack_netrw = true,
                open_on_tab = false,
                hijack_cursor = true,
                hijack_unnamed_buffer_when_opening = false,
                update_focused_file = {
                    enable = false,
                    update_cwd = false,
                },
                view = {
                    side = "left",
                    width = 30,
                    centralize_selection = true,
                    preserve_window_proportions = true,
                },
                git = {
                    enable = true,
                    ignore = false,
                    timeout = 500,
                },
                filesystem_watchers = {
                    enable = true,
                },
                renderer = {
                    indent_markers = {
                        enable = true,
                        icons = {
                            corner = icons.fold.guides.corner .. icon_padding,
                            item = icons.fold.guides.edge .. icon_padding,
                            edge = icons.fold.guides.edge .. icon_padding,
                            none = " " .. icon_padding,
                        }
                    },
                    icons = {
                        show = {
                            folder = true,
                            folder_arrow = false,
                            file = true,
                            git = true,
                        },
                        glyphs = {
                            default = icons.filesystem.file,
                            symlink = icons.filesystem.symlink_file,
                            git = icons.git.status,
                            folder = {
                                arrow_open = icons.fold.open,
                                arrow_closed = icons.fold.closed,
                                default = icons.filesystem.closed_folder,
                                open = icons.filesystem.opened_folder,
                                empty = icons.filesystem.closed_empty_folder,
                                empty_open = icons.filesystem.opened_empty_folder,
                                symlink = icons.filesystem.closed_symlink_folder,
                                symlink_open = icons.filesystem.opened_symlink_folder,
                            },
                        },
                        webdev_colors = true,
                        git_placement = "before",
                    },
                    highlight_git = true,
                    add_trailing = true,
                    highlight_opened_files = "none",
                    special_files = {},
                    root_folder_label = false,
                },
                diagnostics = {
                    enable = true,
                    show_on_dirs = true,
                    icons = {
                        info = icons.diagnostic.info .. " ",
                        hint = icons.diagnostic.hint .. " ",
                        warning = icons.diagnostic.warn .. " ",
                        error = icons.diagnostic.error .. " ",
                    },
                },
                live_filter = {
                    prefix = icons.explorer.filter .. " ",
                    always_show_folders = false,
                },
            }

            tree.setup(options)

            local window_options = {
                cursorline = true,
                foldcolumn = "1",
                signcolumn = "auto:2-5",
            }

            for k, v in pairs(window_options) do
                require("nvim-tree.view").View.winopts[k] = v
            end
        end,
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        lazy = true,
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        config = function()
            local telescope = require("telescope")

            telescope.setup {
                extensions = {
                    file_browser = {
                        dir_icon = icons.filesystem.closed_folder,
                        dir_icon_hl = "Directory",
                        hijack_netrw = true,
                    }
                }
            }

            telescope.load_extension("file_browser")
        end,
    },
    {
        'stevearc/oil.nvim',
        cmd = "Oil",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {},
    },
}
