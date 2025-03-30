-- Color support
vim.opt.termguicolors = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

-- Highlight cursorline
vim.opt.cursorline = true

-- Identation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

-- Show space chars
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Sync clipboard
vim.opt.clipboard = "unnamedplus"

-- Ignore case
vim.opt.ignorecase = true

-- Undofile
vim.opt.undofile = true
