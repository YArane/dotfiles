syntax enable
colorscheme desert

" -------------{~~ Vundle ~~}------------- "
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
"Plugin 'sjl/gundo.vim'
"Plugin 'AndrewRadev/id3.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
"Plugin 'majutsushi/tagbar'
"Plugin 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
"Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end()
filetype plugin indent on

" ------------{~~ UI Config ~~}------------- "

set showcmd " show command down below
filetype indent on " filetyoe-specific indentation
set wildmenu " autocomplete for commands
set lazyredraw " redraw only when necessary
set showmatch " highlight matching [{()}]
set tabstop=2 " tabs are as wide as two spaces
set laststatus=2 " always show status line
set noerrorbells " disable error bells
set showmode " show the  current mode
set title " show the filename in window titlebar
set scrolloff=3 " start scrolling before the horizontal window border

let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeMapActivateNode = '<space>'
let g:ycm_min_num_of_chars_for_completion = 1
"let g:ctrlp_match_window = 'bottom,order:ttp'
"let g:ctrlp_switch_buffer = 0
"let g:ctrlp_working_path_mode = 0
"let g:ctrlp_user_command = 'ag %s -1 --nocolor --hidden -g ""'


" ------------{~~ Backups ~~}------------- "
set backupdir=~/.vim/backups " centralize backups
set directory=~/.vim/swaps " centralize swapfiles
if exists("&undodir")
	set undodir=~/.vim/undo " centralize undo history
endif
set backupskip=/tmp/*,/private/tmp/* " don't create backups when editing specific files

"
" ------------{~~ Movement ~~}------------- "

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
" Tagbar
nnoremap <leader>t :TagbarToggle<CR>

nmap <leader>l :call ToggleNumber()<CR>

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
