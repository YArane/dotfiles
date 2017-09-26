#!/usr/bin/env bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

backup() {
	echo "creating backup of all dotfiles in home directory in $DOTFILES_DIR/backup"
	if [ ! -d backup ]; then
		mkdir backup
	fi
	# backup all dotfiles in home directory - dont print 'ommiting directories'
	cp ~/.* backup/ 2>/dev/null
	echo "backup complete."
}

create_links() {
	echo "creating symbolic links to home directory.."

	ln -svf $DOTFILES_DIR/.vimrc ~
	ln -svf $DOTFILES_DIR/.vim/.ycm_extra_conf.py ~/.vim
	ln -svf $DOTFILES_DIR/.vim/nerdtree.vim ~/.vim
	ln -svf $DOTFILES_DIR/.vim/plugins.vim ~/.vim

	ln -svf $DOTFILES_DIR/.tmux.conf ~
	ln -svf $DOTFILES_DIR/.bashrc ~
	ln -svf $DOTFILES_DIR/.bash_prompt ~
	ln -svf $DOTFILES_DIR/.env ~
	ln -svf $DOTFILES_DIR/.aliases ~
	ln -svf $DOTFILES_DIR/.functions ~
	ln -svf $DOTFILES_DIR/.inputrc ~
}

create_vim_dirs() {
	if [ ! -d ~/.vim ]; then
		mkdir ~/.vim
	fi
	if [ ! -d ~/.vim/backups ]; then
		mkdir ~/.vim/backups
	fi
	if [ ! -d ~/.vim/undo ]; then
		mkdir ~/.vim/undo
	fi
	if [ ! -d ~/.vim/swaps ]; then
		mkdir ~/.vim/swaps
	fi
}

install_vundle() {
	echo "installing vundle package manager for vim.."
	if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
		git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	fi
	vim +PluginInstall +qall
}

install() {
	echo "sourcing .bashrc"
	source ~/.bashrc
}

backup
create_vim_dirs
create_links
install_vundle
install
echo "dotfiles installed successfully"
