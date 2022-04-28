--Keymaps
local opts = {noremap= true, silent = true}
local term_ops = {silent = true}

local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "
-- Remaps

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


---------- NORMAL ----------

keymap('n', '<Leader>s', ':w<CR>', opts)
--keymap('n', '<Leader>tr', 'v:count1 . \'ToggleTerm\'<CR>', {noremap = true, expr = true})
--keymap('n', '<Leader>f', ':PrettierAsync<CR>', {noremap = true, silent = true})
keymap('n', '<Leader>f', ':lua vim.lsp.buf.formatting()<CR>', opts)

-- duplicate line
keymap('n', '<C-D>', 'Yp', opts)

-- text move Alt+j|k move text to (down|up)
keymap('n', '<A-j>', ':m .+1<CR>==', opts)
keymap('n', '<A-k>', ':m .-2<CR>==', opts)

-- resize window
keymap('n', '<A-Up>', ':resize -2<CR>', opts)
keymap('n', '<A-Down>', ':resize +2<CR>', opts)
keymap('n', '<A-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<A-Right>', ':vertical resize +2<CR>', opts)

-- switch window
keymap('n', '<Leader>h', '<C-w>h<CR>', opts)
keymap('n', '<Leader>j', '<C-w>j<CR>', opts)
keymap('n', '<Leader>k', '<C-w>k<CR>', opts)
keymap('n', '<Leader>l', '<C-w>l<CR>', opts)
keymap('n', '<Leader>ss', ':split<CR>', opts)
keymap('n', '<Leader>sv', ':vs<CR>', opts)

-- buffer tabs move
keymap('n', '<Tab>', ':BufferLineCyclePrev<CR>', opts)
keymap('n', '<S-Tab>', ':BufferLineCycleNext<CR>', opts)
keymap('n', '<Leader>q', ':bdelete<CR>', opts)

-- telescope
keymap('n', '<Leader>af', ':lua require\'telescope.builtin\'.live_grep()<Cr>', opts)
keymap('n', '<Leader>p', ':lua require\'telescope.builtin\'.find_files()<Cr>', opts)
keymap('n', '\\', ':lua require\'telescope.builtin\'.buffers()<CR>', opts)

-- search
keymap('n', '<Leader>b', ':lua require\'spectre\'.open_file_search()<Cr>', opts)
keymap('n', '<A-s>', ':lua require\'spectre\'.open()<Cr>', opts)


-- lsp actions
keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
keymap('n', '<space>d', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

---------- VISUAL ----------

-- text move Alt+j|k move text to (down|up)
keymap('v', '<A-j>', ':m \'>+1<CR>gv=gv', opts)
keymap('v', '<A-k>', ':m \'<-2<CR>gv=gv', opts)

---------- INSERT ----------

-- duplicate line
keymap('i', '<C-D>', '<ESC> Ypi', opts)

-- text move Alt+j|k move text to (down|up) 
keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', opts)
keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', opts)
