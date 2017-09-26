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
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'

Plugin 'tikhomirov/vim-glsl'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'AndrewRadev/id3.vim'
"Plugin 'lyuts/vim-rtags'
"Plugin 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }

call vundle#end()
filetype plugin indent on


"let g:ctrlp_match_window = 'bottom,order:ttp'
"let g:ctrlp_switch_buffer = 0
"let g:ctrlp_working_path_mode = 'ra'
"let g:ctrlp_user_command = 'ag %s -1 --nocolor --hidden -g ""'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_min_num_of_chars_for_completion = 1
