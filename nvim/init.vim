" --- General 

let mapleader = " "

set termguicolors
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set number
set numberwidth=1
set relativenumber
set signcolumn=yes
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set nohlsearch
set ignorecase
set smartcase
set nowrap
set splitbelow
set splitright
set hidden
set scrolloff=999
set noshowmode
set updatetime=250 
set encoding=UTF-8
set mouse=a


" --- Plugins

call plug#begin('~/.config/nvim/plugged')

" General
Plug 'nvim-lualine/lualine.nvim'                   " Status line
Plug 'akinsho/bufferline.nvim'                     " Buffers
Plug 'kyazdani42/nvim-web-devicons'                " Devicons
Plug 'machakann/vim-highlightedyank'               " Highlight yanked text
Plug 'kyazdani42/nvim-tree.lua'                    " File explorer
Plug 'akinsho/toggleterm.nvim'                     " Termial plugin  
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'
Plug 'terryma/vim-multiple-cursors'

" Colorschemes
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'yeddaif/neovim-purple'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'sainnhe/gruvbox-material'
Plug 'Mofiqul/dracula.nvim'

" Lsp
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind-nvim'
" Git
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'windwp/nvim-spectre'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

call plug#end()

lua require('d4nilo')


" --- Colors

set background=dark
colorscheme dracula

" --- Autocommands

" Remove vert split 
" https://www.reddit.com/r/vim/comments/effwku/transparent_vertical_bar_in_vim/
" https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
set fillchars=vert:\  " there is whitespace after the backslash
augroup RemoveVertSplit
    autocmd!
    autocmd BufEnter,ColorScheme * highlight VertSplit ctermfg=1 ctermbg=None cterm=None
augroup END
