#!/usr/bin/env bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

install_packages() {
	echo "installing dotfiles packages with GNU Stow..."
	
	# Check if stow is installed
	if ! command -v stow &> /dev/null; then
		echo "GNU Stow is not installed. Please install it first:"
		echo "  macOS: brew install stow"
		echo "  Ubuntu/Debian: sudo apt install stow"
		echo "  CentOS/RHEL: sudo yum install stow"
		exit 1
	fi
	
	# Install each package
	cd "$DOTFILES_DIR"
	for package in bash vim tmux git; do
		if [ -d "$package" ]; then
			echo "Installing $package package..."
			stow "$package"
		fi
	done
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

finalize() {
	echo "sourcing .bashrc"
	source ~/.bashrc
}

create_vim_dirs
install_packages
install_vundle
finalize
echo "dotfiles installed successfully with GNU Stow"
