#!/usr/bin/env bash

# script to "install" some dotfiles into the system, only symbolic link are created
# so one can just modify the files from the .dotfiles directory

DO_BACKUP=false

VIMRC="$HOME/.vimrc"
SPACEMACS="$HOME/.spacemacs"
NVIMRC="$HOME/.config/nvim/init.vim"
TMUX="$HOME/.tmux.conf"

if [[ -e $VIMRC ]]; then
	if [[ $DO_BACKUP ]]; then
		mv $VIMRC "$VIMRC.bak"
	else
		rm $VIMRC
	fi
	ln -s ~/.dotfiles/.vimrc $VIMRC
fi

if [[ -e $SPACEMACS ]]; then
	if [[ $DO_BACKUP ]]; then
		mv $SPACEMACS "$SPACEMACS.bak"
	else
		rm $SPACEMACS
	fi
	rm $SPACEMACS
	ln -s ~/.dotfiles/.spacemacs $SPACEMACS
fi

if [[ -e $NVIMRC ]]; then
	if [[ $DO_BACKUP ]]; then
		mv $NVIMRC "$NVIMRC.bak"
	else
		rm $NVIMRC
	fi
	rm $NVIMRC
	ln -s ~/.dotfiles/init.vim $NVIMRC
fi

if [[ -e $TMUX ]]; then
	if [[ $DO_BACKUP ]]; then
		mv $TMUX "$TMUX.bak"
	else
		rm $TMUX
	fi
	ln -s ~/.dotfiles/.tmux.conf $TMUX
fi

