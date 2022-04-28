require('nvim-tree').setup {
    update_cwd = true,
    view = {
        width = 30
    },
    actions = {
        open_file = {
            resize_window = false
        }
    },
}

vim.api.nvim_set_keymap('n', '<Leader>n', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- This highlight override is based on the tokyonight
-- theme. Changing the theme will cause NvimTreeEndOfBuffer to break
vim.cmd[[
    augroup NvimTreeHighlightGroups
        autocmd!
        autocmd BufEnter,ColorScheme * highlight NvimTreeEndOfBuffer guifg=#1f2335
    augroup END
]]
