set number
set mouse=a
syntax enable
set showcmd
set encoding=utf-8
set showmatch
set relativenumber

call plug#begin('~/.vim/plugged')

" Temas
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'

" Emmet
Plug 'mattn/emmet-vim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

" Plugins para javascript
Plug 'pangloss/vim-javascript'



" Plugins IDE
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'alvan/vim-closetag'
" Plug 'sirver/ultisnips'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

call plug#end()

" Configuracion del tema
if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif
colorscheme spaceduck


let g:lightline = {'colorscheme': 'spaceduck'}


" Configuracion para LSP

lua << EOF
require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
EOF

" Archivos de configuración

so ~/.config/nvim/coc.vim
so ~/.config/nvim/keymaps.vim
so ~/.config/nvim/coc-explorer-config.vim

" Configuracion de EMMET
let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','
let g:user_emmet_settings={'javascript': {'extends': 'jsx'}}


" Configuracion de NerdTree
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
\ }


let g:python3_host_prog = '/Users/d4nilo/anaconda3/bin/python3'


