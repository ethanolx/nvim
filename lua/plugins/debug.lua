return {
    {
        "mfussenegger/nvim-dap",
        cmd = {
            "DapContinue",
            "DapToggleBreakpoint",
        },
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text"
        },
        config = function()
            local dap = require("dap")

            vim.fn.sign_define("DapStopped", { text = "", texthl = "", linehl = "", numhl = "" })
            vim.fn.sign_define("DapBreakpoint", { text = "󰏃", texthl = "", linehl = "", numhl = "" })
            vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "", linehl = "", numhl = "" })
            vim.fn.sign_define("DapBreakpointRejected", { text = "󰀩", texthl = "", linehl = "", numhl = "" })
            vim.fn.sign_define("DapLogPoint", { text = "", texthl = "", linehl = "", numhl = "" })

            -- INFO: PHP --
            dap.adapters.php = {
                type = "executable",
                command = "node",
                args = { "C:\\php\\vscode-php-debug\\out\\phpDebug.js" }
            }

            dap.configurations.php = {
                {
                    type = "php",
                    request = "launch",
                    name = "Listen for Xdebug",
                    port = 9003
                },
            }

            -- INFO: Python --
            dap.adapters.python = function(cb, config)
                if config.request == "attach" then
                    ---@diagnostic disable-next-line: undefined-field
                    local port = (config.connect or config).port
                    ---@diagnostic disable-next-line: undefined-field
                    local host = (config.connect or config).host or "127.0.0.1"
                    cb({
                        type = "server",
                        port = assert(port, "`connect.port` is required for a python `attach` configuration"),
                        host = host,
                        options = {
                            source_filetype = "python",
                        },
                    })
                else
                    cb({
                        type = "executable",
                        command = "python",
                        args = { "-m", "debugpy.adapter" },
                        options = {
                            source_filetype = "python",
                        },
                    })
                end
            end

            dap.configurations.python = {
                {
                    type = "python",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    pythonPath = { "python" },
                },
            }
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        lazy = true,
        config = function()
            local dap = require("dap")
            local dap_ui = require("dapui")

            dap_ui.setup {
                icons = { expanded = "▾", collapsed = "▸" },
                mappings = {
                    -- Use a table to apply multiple mappings
                    expand = { "<CR>", "<2-LeftMouse>" },
                    open = "o",
                    remove = "d",
                    edit = "e",
                    repl = "r",
                    toggle = "t",
                },
                -- Expand lines larger than the window
                -- Requires >= 0.7
                expand_lines = vim.fn.has("nvim-0.7"),
                layouts = {
                    {
                        elements = {
                            -- Elements can be strings or table with id and size keys.
                            "scopes",
                            "breakpoints",
                            "stacks",
                            "watches",
                        },
                        size = 40,
                        position = "left",
                    },
                    {
                        elements = {
                            "repl",
                            "console",
                        },
                        size = 10,
                        position = "bottom",
                    },
                },
                floating = {
                    max_height = nil,  -- These can be integers or a float between 0 and 1.
                    max_width = nil,   -- Floats will be treated as percentage of your screen.
                    border = "single", -- Border style. Can be "single", "double" or "rounded"
                    mappings = {
                        close = { "q", "<Esc>" },
                    },
                },
                windows = { indent = 1 },
                render = {
                    max_type_length = nil, -- Can be integer or nil.
                }
            }
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dap_ui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dap_ui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dap_ui.close()
            end
        end
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        lazy = true,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            enabled = true,
            enabled_commands = true,
            highlight_changed_variables = true,
            highlight_new_as_changed = false,
            show_stop_reason = true,
            commented = false,
            only_first_definition = true,
            all_references = false,
            filter_references_pattern = "<module",

            virt_text_pos = "eol",
            all_frames = false,
            virt_lines = false,
            virt_text_win_col = nil
        }
    },
    {
        "nvim-telescope/telescope-dap.nvim",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        lazy = true,
        config = function()
            require("telescope").load_extension("dap")
        end,
    },
}
