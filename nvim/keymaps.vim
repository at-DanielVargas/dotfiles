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
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>n :tabp<CR>
nnoremap <Leader>m :tabn<CR>

" Atajo para abrir el buscador de fzf
nnoremap <Leader>p :Files<CR>

" Atajo para NeerdTree
" nnoremap <Leader>b :call NERDTreeToggleInCurrentDir()<CR>

nnoremap <Leader>w <C-w>




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
