local dap_present, dap = pcall(require, "dap")
local dap_ui_present, dap_ui = pcall(require, "dapui")

if not (dap_present and dap_ui_present) then
   return
end

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
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
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

require('telescope').load_extension('dap')

dap.listeners.after.event_initialized["dapui_config"] = function()
    dap_ui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dap_ui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dap_ui.close()
end
