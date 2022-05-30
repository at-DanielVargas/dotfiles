local opt = vim.opt

opt.termguicolors = false
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
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true


--vim.cmd([[colorscheme rvcs]])
-- vim.cmd([[colorscheme daycula]])
vim.cmd([[
  let g:indentLine_setConceal = 0
]])
