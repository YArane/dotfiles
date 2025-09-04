set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()

" core plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-obsession' " :Obsess | vim -S
Plugin 'tpope/vim-unimpaired'
Plugin 'wesQ3/vim-windowswap' " <leader>ww to swap
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'mileszs/ack.vim'

" code plugins
Plugin 'sheerun/vim-polyglot'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'w0rp/ale'

call vundle#end()
filetype plugin indent on

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_min_num_of_chars_for_completion = 1
