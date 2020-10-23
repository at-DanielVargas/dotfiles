set nocompatible
filetype off

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
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
call plug#end()

filetype plugin indent on
let mapleader = ","
noremap <leader>w :w<cr>
noremap <leader>gs :CocSearch
noremap <leader>i :Prettier<cr>
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


syntax enable
set background=dark
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
set clipboard=unnamed

let g:user_emmet_expandabbr_key='<Tab>'
let g:coc_disable_startup_warning = 1
let g:coc_global_extensions = [ 'coc-tsserver', 'coc-json', 'coc-angular' ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif


autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

colorscheme nord

