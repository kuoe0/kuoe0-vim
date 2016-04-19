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

# remove origin .vim and .vimrc 
if [ -d ~/.vim ] || [ -h ~/.vim ]; then
	rm -rf ~/.vim
fi

if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]; then
	rm ~/.vimrc
fi

# re-link them with current file
ln -s "$SCRIPTPATH" ~/.vim
ln -s "$SCRIPTPATH/vimrc" ~/.vimrc

# create undo directory
if [ ! -d ~/.vim/undo ]; then
	mkdir ~/.vim/undo
fi

# download plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# install all plugin
make plugin_install

# dev env
ln -s ../../dev/pre-commit .git/hooks/
