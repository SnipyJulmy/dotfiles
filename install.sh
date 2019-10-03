#!/usr/bin/env bash

#===============================================================================
#         NAME:  install
#  DESCRIPTION:  The purpose of this script is to install various configuration
#                files like vimrc or spacemacs, automatically and with backup
#                information.
#===============================================================================    

__ScriptVersion="1.0"

DO_BACKUP=false
OVERWRITE=false

#===  FUNCTION  ================================================================
#         NAME:  usage
#  DESCRIPTION:  Display usage information.
#===============================================================================
function usage ()
{
    echo "Usage :  $0 [options] [--]

    Options:
    -o|overwrite  Force the overwrite of the existing configuration files
    -b|backup     Create backup file of existing configuration files if they are overwriten
    -d|verbose    Enable verbose mode
    -h|help       Display this message
    -v|version    Display script version"

}    # ----------  end of function usage  ----------

#-----------------------------------------------------------------------
#  Handle command line arguments
#-----------------------------------------------------------------------

while getopts ":hvobd" opt
do
    case $opt in

        o|overwrite ) OVERWRITE=true                                                              ;;
        b|backup    ) DO_BACKUP=true                                                              ;;
        d|verbose   ) set -x                                                                      ;;
        h|help      ) usage; exit 0                                                               ;;
        v|version   ) echo "$0 -- Version $__ScriptVersion"; exit 0                               ;;
        *           ) echo -e "\n  Option does not exist : $OPTARG\n" ;             usage; exit 1 ;;

    esac    # --- end of case ---
done
shift $(($OPTIND-1))

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
                mv $DESTINATION_PATH $DESTINATION_PATH.bak
            fi
            rm $DESTINATION_PATH
            ln -s $SOURCE_PATH $DESTINATION_PATH
        else
            echo "$DESTINATION_PATH already exists, do nothing"
        fi
    else
        ln -s $SOURCE_PATH $DESTINATION_PATH
    fi
}

install "vimrc" "$HOME/.vimrc"
install "spacemacs" "$HOME/.spacemacs"
install "tmux.conf" "$HOME/.tmux.conf"
install "init.vim" "$HOME/.config/nvim/init.vim"
install "ctags.d" "$HOME/.ctags.d"
