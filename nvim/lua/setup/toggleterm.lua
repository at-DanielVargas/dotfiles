local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ 
    cmd = "lazygit", 
    hidden = true,
    direction = "float"
})

function _lazygit_toggle()
    lazygit:toggle()
end


vim.api.nvim_set_keymap("n", "<Leader>x", "<Cmd>lua _lazygit_toggle()<Cr>", {noremap = true, silent = true})