syntax enable
colorscheme desert

inoremap jk <esc>
let mapleader=","

" ---------------{~~ UI Config ~~}---------------- "
set showcmd      " show command down below
set wildmenu     " autocomplete for commands
set lazyredraw   " redraw only when necessary
set showmode     " show the  current mode
set title        " show the filename in window titlebar
set laststatus=2 " always show status line
set noerrorbells " disable error bells
set scrolloff=3  " start scrolling before the horizontal window border

" ----------------{~~ Indents ~~}----------------- "
set tabstop=4    " tabs are as wide as four spaces
set softtabstop=4
set shiftwidth=4
set noexpandtab

" -----------------{~~ Panes ~~}------------------ "
nmap <leader>h :leftabove vnew<CR>
nmap <leader>l :rightbelow vnew<CR>
nmap <leader>k :leftabove new<CR>
nmap <leader>j :rightbelow new<CR>

" ----------------{~~ Folding ~~}----------------- "
set foldenable        " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10    " 10 nest fold moax
set foldmethod=syntax " fold based on marker
nnoremap <space> za

" ---------------{~~ Searching ~~}---------------- "
set incsearch " search as characters are entered
set hlsearch  " highlight matches
set showmatch " highlight matching [{()}]
nnoremap <leader><space> :nohlsearch<CR>

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
nmap <leader>; :call ToggleNumber()<CR>

" ----------------{~~ Backups ~~}----------------- "
set backupdir=~/.vim/backups         " centralize backups
set directory=~/.vim/swaps           " centralize swapfiles
if exists("&undodir")
	set undodir=~/.vim/undo          " centralize undo history
endif
set backupskip=/tmp/*,/private/tmp/* " don't create backups when editing specific files

" ---------------{~~ Building ~~}----------------- "
nnoremap <F4> :make!<cr>
nnoremap <F5> :!./a.out<cr>

augroup project
	autocmd!
	autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

" ---------------{~~ Mappings ~~}----------------- "
source ~/.vim/mappings.vim

" ------------{~~ Silver Searcher ~~}------------- "
source ~/.vim/ag.vim

" ----------------{~~ Vundle ~~}------------------ "
source ~/.vim/plugins.vim

" ---------------{~~ Nerd Tree ~~}---------------- "
source ~/.vim/nerdtree.vim
