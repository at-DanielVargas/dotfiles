local opt = vim.opt

opt.termguicolors = true
opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.cursorline = true
opt.cursorcolumn = true
opt.hidden = true
opt.hlsearch = true
vim.o.lazyredraw = true
opt.number = true
opt.relativenumber = true
opt.list = true
opt.listchars = { tab = " ", trail = "·" }
opt.title = true
opt.wrap = true
opt.mouse = "a"

vim.cmd([[colorscheme daycula]])