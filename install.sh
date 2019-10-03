#!/usr/bin/env bash

# script to "install" some dotfiles into the system, only symbolic link are created
# so one can just modify the files from the .dotfiles directory

DO_BACKUP=false
OVERWRITE=false

LOCAL_VIMRC=".vimrc"
DEST_VIMRC="$HOME/.vimrc"

SPACEMACS="$HOME/.spacemacs"
NVIMRC="$HOME/.config/nvim/init.vim"
TMUX="$HOME/.tmux.conf"
CTAGS="$HOME/.ctags"

# install a file into the specified path, the installation is done by creating symbolic link
# so one can modify standard file and modify only the one present in the git repository
# expect # arguments :
# #1 : the file name present in the git repository
# #2 : the standard path where the file should be put
function install() {
    SOURCE_PATH=`realpath $1`
    DESTINATION_PATH=$2
    if [[ -e $DESTINATION_PATH ]]; then
        if [[ $OVERWRITE == true ]]; then
            if [[ $DO_BACKUP == true ]]; then
                echo "mv $DESTINATION_PATH $DESTINATION_PATH.bak"
            fi
            echo "rm $DESTINATION_PATH"
        fi
    fi
    echo "ln -s $SOURCE_PATH $DESTINATION_PATH"
}

install $LOCAL_VIMRC $DEST_VIMRC

#
#if [[ -e $VIMRC ]] && [[ $OVERWRITE ]] ; then
#	if [[ $DO_BACKUP ]]; then
#		mv $VIMRC "$VIMRC.bak"
#	else
#		rm $VIMRC
#	fi
#fi
#
#if [[ -e $SPACEMACS ]] && [[ $OVERWRITE ]] ; then
#	if [[ $DO_BACKUP ]]; then
#		mv $SPACEMACS "$SPACEMACS.bak"
#	else
#		rm $SPACEMACS
#	fi
#	rm $SPACEMACS
#fi
#
#if [[ -e $NVIMRC ]] && [[ $OVERWRITE ]] ; then
#	if [[ $DO_BACKUP ]]; then
#		mv $NVIMRC "$NVIMRC.bak"
#	else
#		rm $NVIMRC
#	fi
#fi
#
#if [[ -e $TMUX ]] && [[ $OVERWRITE ]] ; then
#	if [[ $DO_BACKUP ]]; then
#		mv $TMUX "$TMUX.bak"
#	else
#		rm $TMUX
#	fi
#fi
#
#ln -s ~/.dotfiles/.vimrc $VIMRC
#ln -s ~/.dotfiles/.tmux.conf $TMUX
#ln -s ~/.dotfiles/init.vim $NVIMRC
#ln -s ~/.dotfiles/.spacemacs $SPACEMACS
#ln -s ~/.dotfiles/.ctags $CTAGS
