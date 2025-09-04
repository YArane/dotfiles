" highlight last inserted text
nnoremap gV `[v`]

" -------{~~ Leader Shortcuts (,)  ~~}------- "

" save file as root
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" move to capital letter
nmap <leader>c /[A-Z]<CR>:nohlsearch<CR>

" Tagbar
nnoremap <leader>t :TagbarOpen fj<CR>

" save file as root
noremap <leader>W :w !sudo tee % > /dev/null<CR>
