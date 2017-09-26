let g:NERDTreeDirArrowD = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeMapActivateNode = '<space>'

" calls NERDTreeFind iff NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
function! s:syncTree()
  let s:curwnum = winnr()
  NERDTreeFind
  exec s:curwnum . "wincmd w"
endfunction

" returns true iff NERDTRee open / active
function! s:isNERDTreeOpen()
	return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! s:syncTreeIf()
  if (winnr("$") > 1 && s:isNERDTreeOpen())
    call s:syncTree()
  endif
endfunction
  
" Shows NERDTree on start and synchronizes the tree with opened file when switching between opened windows
autocmd BufEnter * call s:syncTreeIf()

" Focus on opened view after starting (instead of NERDTree)
autocmd VimEnter * call s:syncTree()
au VimEnter * :wincmd w

" Automatically close vim if only NERDTree left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
   
" sets the local window working directory to the current file's directory
autocmd BufEnter * lcd %:p:h

" Show/Hide NERDTree
:nmap <expr> <leader>n (winnr("$") == 1) ? ':NERDTreeFind<CR>' : ':NERDTreeToggle<CR>'
" Prevent this command activation in NERDTree
"autocmd FileType nerdtree noremap <buffer> <leader>n <nop>
