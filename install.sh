# /usr/bin/env bash
# Author: 	KuoE0 <kuoe0.tw@gmail.com>
# Description: 	Auto install vimrc

# OS test
OS=$(uname)
echo $OS

# setting readlink command
if [ "$OS" = 'Linux' ]; then
	REALPATH='readlink -f'
elif [ "$OS" = 'Darwin' ]; then
	REALPATH='realpath'
elif [ "$OS" = 'FreeBSD' ]; then
	REALPATH='realpath'
fi

# absolute path of this script, e.g. /home/usr/bin/foo.sh
SCRIPT=`$REALPATH $0`
# absolute path of current directory
SCRIPTPATH=`dirname "$SCRIPT"`

echo "$SCRIPTPATH"

# setup for vim
VIM_FOLDER="$HOME/.vim"
VIM_CONFIG="$HOME/.vimrc"
if [ -d "$VIM_FOLDER" ]; then
	rm -rf "$VIM_FOLDER"
elif [ -h "$VIM_FOLDER" ]; then
	rm "$VIM_FOLDER"
fi
ln -s "$SCRIPTPATH" "$VIM_FOLDER"

if [ -f "$VIM_CONFIG" ] || [ -h "$VIM_CONFIG" ]; then
	rm "$VIM_CONFIG"
fi
ln -s "$SCRIPTPATH/vimrc" "$VIM_CONFIG"

# setup for neovim
NEOVIM_FOLDER="$HOME/.config/nvim"
NEOVIM_CONFIG="$NEOVIM_FOLDER/init.vim"
if [ -d "$NEOVIM_FOLDER" ]; then
	rm -rf "$NEOVIM_FOLDER"
elif [ -h "$NEOVIM_FOLDER" ]; then
	rm "$NEOVIM_FOLDER"
fi
ln -s "$SCRIPTPATH" "$NEOVIM_FOLDER"

if [ -f "$NEOVIM_CONFIG" ] || [ -h "$NEOVIM_CONFIG" ]; then
	rm "$NEOVIM_CONFIG"
fi
ln -s "$SCRIPTPATH/vimrc" "$NEOVIM_CONFIG"

# create undo directory
if [ ! -d ~/.vim/undo ]; then
	mkdir ~/.vim/undo
fi

# download plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# install all plugin
make install-plug

# development environment
if [ -e "$SCRIPTPATH/.git/hooks/pre-commit" ]; then
	rm "$SCRIPTPATH/.git/hooks/pre-commit"
fi
ln -s ../../dev/pre-commit "$SCRIPTPATH/.git/hooks/pre-commit"
