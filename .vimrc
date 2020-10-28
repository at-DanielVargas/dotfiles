set nocompatible
syntax on
if has("autocmd")
    filetype plugin indent on
    "           │     │    └──── Enable file type detection
    "           │     └───────── Enable loading of indent file
    "           └─────────────── Enable loading of plugin files
endif

set autoindent                 " Copy indent to the new line

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'beanworks/vim-phpfmt'
Plug 'shawncplus/phpcomplete.vim'
Plug 'artanikin/vim-synthwave84'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arzg/vim-colors-xcode'
Plug 'pgavlin/pulumi.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'franbach/miramare'
Plug 'sainnhe/sonokai'
Plug 'chriskempson/base16-vim'
Plug 'davidcelis/vim-ariake-dark'
call plug#end()

filetype plugin indent on
let mapleader = ","
noremap <leader>w :w<cr>
noremap <leader>gs :CocSearch
noremap <leader>i :Prettier<cr>
inoremap <leader>i <C-c>:Prettier<cr>
noremap <leader>p :GFiles<cr>
noremap <leader>b :NERDTreeToggle<cr>
noremap <leader><cr> <cr><c-w>h:q<cr>
noremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>
noremap <leader>q :q<cr>
noremap <leader>n :tabp<cr>
noremap <leader>m :tabn<cr>
noremap <leader>t :tabnew<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gf <Plug>(coc-fix-current)
:imap ii <Esc>
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

"set background=dark
set wildmenu
set ttyfast
set lazyredraw
set updatetime=300
set laststatus=2
set number
set tabstop=4
set backspace=indent,eol,start
set wrap
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}
let &t_TI = ""
let &t_TE = ""
set listchars=tab:▸\           " ┐
set listchars+=trail:·         " │ Use custom symbols to
set listchars+=eol:↴           " │ represent invisible characters
set listchars+=nbsp:_          " ┘


let g:prettier#autoformat = 0
let g:prettier#config#tab_width = 4
"none" - No trailing commas.
"es5" - Trailing commas where valid in ES5 (objects, arrays, etc.)
"all" - Trailing commas wherever possible (including function arguments). This requires node 8 or a transform.
let g:prettier#config#trailing_comma = 'es5'
autocmd BufWritePre *.html*.php,*.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md Prettier


let g:user_emmet_expandabbr_key='<Tab>'
let g:coc_disable_startup_warning = 1
let g:coc_global_extensions = [ 'coc-tsserver', 'coc-json', 'coc-angular' ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

let g:prettier#autoformat = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

set termguicolors

" Available values of theme sonokai : `'default'`, `'atlantis'`, `'andromeda'`, `'shusia'`, `'maia'`

"let g:sonokai_style = 'shusia'
"colorscheme sonokai

colorscheme synthwave84

"colorscheme base16-default-dark
"colorscheme miramare
"colorscheme xcodedark
"colorscheme pulumi
