local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")
local icons = require("core.icons")

lazy.setup("plugins", {
    root = vim.fn.stdpath("data") .. "/lazy",
    install = {
        colorscheme = {},
    },
    custom_keys = {
        ["<localleader>l"] = false,
        ["<localleader>t"] = false,
    },
    checker = {
        enabled = true,
        frequency = 60 * 60 * 24 * 7 -- Check for updates every week
    },
    performance = {
        rtp = {
            disabled_plugins = vim.g.disable_plugins
        }
    },
    ui = {
        border = "rounded",
        icons = {
            cmd = " ",
            config = "",
            event = "",
            ft = " ",
            init = " ",
            import = " ",
            keys = " ",
            lazy = "󰒲 ",
            loaded = "●",
            not_loaded = "○",
            plugin = " ",
            runtime = " ",
            source = " ",
            start = "",
            task = "✔ ",
            list = {
                "●",
                "➜",
                "★",
                "‒",
            },
        }
    },
    readme = {
        root = vim.fn.stdpath("data") .. "/lazy/readme",
    },
    state = vim.fn.stdpath("data") .. "/lazy/state.json",
})
