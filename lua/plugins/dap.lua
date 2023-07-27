local present, dap = pcall(require, "dap")

if not present then
   return
end

vim.fn.sign_define("DapStopped", { text="", texthl="", linehl="", numhl="" })
vim.fn.sign_define("DapBreakpoint", { text="󰏃", texthl="", linehl="", numhl="" })
vim.fn.sign_define("DapBreakpointCondition", { text="", texthl="", linehl="", numhl="" })
vim.fn.sign_define("DapBreakpointRejected", { text="󰀩", texthl="", linehl="", numhl="" })
vim.fn.sign_define("DapLogPoint", { text="", texthl="", linehl="", numhl="" })

-- INFO: C++ --
-- dap.adapters.lldb = {
--     id = 'lldb',
--     name = 'lldb',
--     type = 'executable',
--     command = 'C:\\Users\\ethan.tan\\scoop\\apps\\llvm\\current\\bin\\lldb.exe',
--     options = {
--         detached = false
--     }
-- }
--
-- dap.configurations.cpp = {
--     {
--         name = "Launch file",
--         type = "lldb",
--         request = "launch",
--         MIMode = "lldb",
--         program = function()
--             return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--         end,
--         cwd = '${workspaceFolder}',
--         stopOnEntry = true,
--     },
-- }

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
dap.adapters.python = {
    type = "executable";
    command = "python";
    args = { "-m", "debugpy.adapter" };
}

dap.configurations.python = {
    {
        type = "python";
        request = "launch";
        name = "Launch file";
        program = "${file}";
        python = { "python" };
        console = "integratedTerminal";
    },
}
