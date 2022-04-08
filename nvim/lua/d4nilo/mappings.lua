vim.api.nvim_set_keymap('n', '<Leader>s', ':w<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>tr', 'v:count1 . \'ToggleTerm\'<CR>', {noremap = true, expr = true})
vim.api.nvim_set_keymap('n', '<Leader>f', ':PrettierAsync<CR>', {noremap = true, silent = true})

