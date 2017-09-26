syntax enable
colorscheme desert

" jk is escape
inoremap jk <esc>

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


" ------------{~~ Movement ~~}------------- "
set scrolloff=3 " start scrolling before the horizontal window border
" highlight last inserted text
nnoremap gV `[v`]

" goto function definition in new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" goto function definiteion in vertical split
"map <C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR> 

" -------{~~ Leader Shortcuts (,)  ~~}------- "
let mapleader=","
" save file as root
noremap <leader>W :w !sudo tee % > /dev/null<CR>
" move to capital letter
nmap <leader>c /[A-Z]<CR>:nohlsearch<CR>
" toggle gundo (graphical undo tree)
nnoremap <leader>u :GundoToggle<CR>
" goto definition with F12
map <leader>g <C-]>
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

nnoremap <leader><space> :nohlsearch<CR>
set incsearch " search as characters are entered
set hlsearch " highlight matches
set showmatch " highlight matching [{()}]

" ------------{~~ Line Numbers ~~}------------- "
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

" ------------{~~ Backups ~~}------------- "
set backupdir=~/.vim/backups " centralize backups
set directory=~/.vim/swaps " centralize swapfiles
if exists("&undodir")
	set undodir=~/.vim/undo " centralize undo history
endif
set backupskip=/tmp/*,/private/tmp/* " don't create backups when editing specific files

" ------------{~~ Building ~~}------------- "
nnoremap <F4> :make!<cr>
nnoremap <F5> :!./a.out<cr>

augroup project
	autocmd!
	autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

" -----------{~~ Silver Searcher ~~}----------- "
source ~/.vim/ag.vim

" -------------{~~ Vundle ~~}------------- "
source ~/.vim/plugins.vim
" ------------{~~ Nerd Tree ~~}------------- "
source ~/.vim/nerdtree.vim
