local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

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
keymap('n', '<Leader>f', ':PrettierAsync<CR>', {noremap = true, silent = true})


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
keymap('n', '<Leader>[', ':BufferLineCyclePrev<CR>', opts)
keymap('n', '<Leader>]', ':BufferLineCycleNext<CR>', opts)
keymap('n', '<Leader>q', ':bdelete<CR>', opts)

-- telescope
keymap('n', '<Leader>af', ':lua require\'telescope.builtin\'.live_grep()<Cr>', opts)
keymap('n', '<Leader>p', ':lua require\'d4nilo.telescope\'.project_files()<Cr>', opts)
keymap('n', '<Leader>df', ':lua require\'d4nilo.telescope\'.search_dotfiles()<Cr>', opts)
keymap('n', '\\', ':lua require\'telescope.builtin\'.buffers()<CR>', opts)

-- search
keymap('n', '<Leader>b', ':lua require\'spectre\'.open_file_search()<Cr>', opts)
keymap('n', '<A-s>', ':lua require\'spectre\'.open()<Cr>', opts)

---------- VISUAL ----------

-- text move Alt+j|k move text to (down|up)
keymap('v', '<A-j>', ':m \'>+1<CR>gv=gv', opts)
keymap('v', '<A-k>', ':m \'<-2<CR>gv=gv', opts)

---------- INSERT ----------

-- text move Alt+j|k move text to (down|up) 
keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', opts)
keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', opts)
