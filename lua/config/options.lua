local opt = vim.opt

-- Appearance and UI
opt.guicursor = ""
opt.termguicolors = true
--opt.laststatus = 0

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.colorcolumn = "80"

opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Indentation
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.autoindent = true

-- Search Behavior
opt.ignorecase = true
opt.hlsearch = true
opt.incsearch = true

-- Backup and Undo
opt.backup = false
opt.swapfile = false
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
