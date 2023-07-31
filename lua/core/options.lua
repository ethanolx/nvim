-- Colour Scheme
vim.opt.termguicolors = true

-- Conceal
vim.opt.conceallevel = 2

-- Labels
vim.opt.title = false

vim.opt.laststatus = 3
vim.opt.showmode = false

-- Special Characters
vim.opt.fillchars = {
    eob = " ",

    fold = " ",
    foldsep = " ",
    foldopen = "",
    foldclose = "",

    horiz = "─",
    horizup = '┴',
    horizdown = "┬",

    vert = "│",
    vertleft = "┤",
    vertright = "├",
    verthoriz = "┼",
}

vim.opt.list = true
vim.opt.listchars = {
    extends = "…",
    tab = "",
    space = " ",
    lead = "·",
    trail = "…",
}

-- Gutter
vim.opt.signcolumn = "auto:2-4"

vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = "v:lua.require('core.utils').foldtext()"
vim.opt.foldmethod = "expr"
vim.opt.foldenable = true

vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.relativenumber = true
vim.opt.ruler = false

-- Indentation
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.smartindent = false

-- Case Sensitivity
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Tiling
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Timing
vim.opt.timeoutlen = 400
vim.opt.updatetime = 250

-- Clipboard
vim.opt.clipboard = ""

-- Backup
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo/"

vim.opt.backup = true
vim.opt.backupdir = vim.fn.stdpath("data") .. "/backup/"

vim.opt.swapfile = true
vim.opt.dir = vim.fn.stdpath("data") .. "/swap/"

-- Sessions
vim.opt.sessionoptions = "buffers,curdir,folds,tabpages,winpos,winsize"

-- Wrapping
vim.opt.formatoptions = "tcqjrp"
vim.opt.linebreak = false
vim.opt.breakat = " !;:,./?"
vim.opt.whichwrap = "<>[]bs"

-- Redrawing
vim.opt.lazyredraw = false
vim.opt.redrawtime = 100

-- Mouse
vim.opt.mouse = "a"

-- Scrolling
vim.opt.scrolloff = 0

-- Compatibility
vim.opt.compatible = false

-- Miscellaneous
vim.opt.completeopt = "menuone,noselect"
vim.opt.cursorcolumn = false
vim.opt.cursorline = false
vim.opt.shortmess:append "sI"
vim.cmd "language en_SG"

-- Spellchecking
vim.opt.autoread = true
vim.opt.spell = false

-- Shada
vim.schedule(function()
    vim.opt.shadafile = vim.fn.stdpath("data") .. "/shada/main.shada"
    vim.cmd [[ silent! rsh ]]
end)
