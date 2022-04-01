let mapleader=" "

" Guarda el archivo
nnoremap <Leader>s :w<CR>

" Cierra el archivo
nnoremap <Leader>q :q<CR>

"Cierra el archivo perdiendo los cambios
nnoremap <Leader>Q :q!<CR>

"Comenta la linea seleccionada
nnoremap <Leader>/ :Commentary<CR>


"Avanza por el archivo arriva o abajo de 10 en 10 lineas
nnoremap <C-j> 10<C-e>
nnoremap <C-k> 10<C-y>

" Atajos para el manejo de tabs
nmap te :tabnew<CR>
nmap <S-Tab> :tabprev<CR>
nmap <Tab> :tabnext<CR>

" Atajos de telescope
nnoremap <C-a> :Telescope live_grep<CR>
nnoremap <C-p> :Telescope find_files<CR>
nnoremap <silent> \\ :Telescope buffers<CR>
" Atajo para NeerdTree
" nnoremap <Leader>b :call NERDTreeToggleInCurrentDir()<CR>

nnoremap <Leader>w <C-w>
map sh <C-w>h
map sj <C-w>j
map sk <C-w>k
map sl <C-w>l

nmap ss :split<CR><C-w>w
nmap sv :vsplit<CR><C-w>w



nnoremap <Leader>f :CocCommand prettier.formatFile<CR>


function! NERDTreeToggleInCurrentDir()
" If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  elseif bufname('%')
    exe ":NERDTreeFind"
  else
    exe ":NERDTreeCWD"
  endif 
endfunction
