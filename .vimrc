syntax enable
colorscheme desert

" -------------{~~ Vundle ~~}------------- "
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" core plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-obsession' " :Obsess | vim -S
Plugin 'wesQ3/vim-windowswap' " <leader>ww to swap
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'


Plugin 'tikhomirov/vim-glsl'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'AndrewRadev/id3.vim'
"Plugin 'lyuts/vim-rtags'
"Plugin 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
"Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end()
filetype plugin indent on

" ------------{~~ UI Config ~~}------------- "

set showcmd " show command down below
filetype indent on " filetyoe-specific indentation
set wildmenu " autocomplete for commands
set lazyredraw " redraw only when necessary
set showmode " show the  current mode
set title " show the filename in window titlebar
set laststatus=2 " always show status line
set noerrorbells " disable error bells

" ----------------{~~ TABS ~~}----------------- "
set tabstop=4 " tabs are as wide as four spaces
set softtabstop=4
set shiftwidth=4
set noexpandtab

let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeMapActivateNode = '<space>'
"let g:ctrlp_match_window = 'bottom,order:ttp'
"let g:ctrlp_switch_buffer = 0
"let g:ctrlp_working_path_mode = 0
"let g:ctrlp_user_command = 'ag %s -1 --nocolor --hidden -g ""'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_min_num_of_chars_for_completion = 1



" ------------{~~ Backups ~~}------------- "
set backupdir=~/.vim/backups " centralize backups
set directory=~/.vim/swaps " centralize swapfiles
if exists("&undodir")
	set undodir=~/.vim/undo " centralize undo history
endif
set backupskip=/tmp/*,/private/tmp/* " don't create backups when editing specific files

"
" ------------{~~ Movement ~~}------------- "

set scrolloff=3 " start scrolling before the horizontal window border
" move vertically by visual ilne
"nnoremap j gj
"nnoremap k gk 
" highlight last inserted text
nnoremap gV `[v`]

" jk is escape
inoremap jk <esc>
" goto function definition in new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" goto function definiteion in vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR> 

" -------{~~ Leader Shortcuts (,)  ~~}------- "

let mapleader=","
nnoremap <leader><space> :nohlsearch<CR>
" save file as root
noremap <leader>W :w !sudo tee % > /dev/null<CR>
" move to capital letter
nmap <leader>c /[A-Z]<CR>:nohlsearch<CR>
" toggle gundo (graphical undo tree)
nnoremap <leader>u :GundoToggle<CR>
" goto definition with F12
map <leader><g> <C-]>
" NERDTree
nnoremap <leader>n :NERDTree<CR>
"nmap <leader>r :NERDTreeFocus<CR>:NERDTreeFind<CR>
" Tagbar
nnoremap <leader>t :TagbarToggle<CR>

nmap <leader>; :call ToggleNumber()<CR>
" save file as root
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" -------------{~~ Panes ~~}-------------- "
nmap <leader>h :leftabove vnew<CR>
nmap <leader>l :rightbelow vnew<CR>
nmap <leader>k :leftabove new<CR>
nmap <leader>j :rightbelow new<CR>


" ------------{~~ Folding ~~}------------- "
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nest fold moax
" space open/closes folds
nnoremap <space> za
set foldmethod=syntax " fold based on marker


" ------------{~~ Searching ~~}------------- "

set incsearch " search as characters are entered
set hlsearch " highlight matches
set showmatch " highlight matching [{()}]

" toggle between number, relativenumber and no linenumbers
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    elseif(&number == 1)
	    set nonumber
    else
        set relativenumber
	set number
    endif
endfunc

" ------------{~~ Building ~~}------------- "
nnoremap <F4> :make!<cr>
nnoremap <F5> :!./a.out<cr>


augroup project
	autocmd!
	autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

" ------------{~~ Nerd Tree ~~}------------- "
" Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
"autocmd BufEnter * call SyncTree()
