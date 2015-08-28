# /usr/bin/env bash
# Author: 	KuoE0 <kuoe0.tw@gmail.com>
# Description: 	Auto install vimrc

# OS test
OS=$(uname)
echo $OS

# setting readlink command
if [ "$OS" = 'Linux' ]; then
	READLINK='readlink'
elif [ "$OS" = 'Darwin' ]; then
	# need to install GNU coreutils
	READLINK='greadlink'
elif [ "$OS" = 'FreeBSD' ]; then
	READLINK='readlink'
fi

# absolute path of this script, e.g. /home/usr/bin/foo.sh
SCRIPT=`$READLINK -f $0`
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

# download vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
# install all plugin
~/.vim/update.sh

# install YCM
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
cd ~/.vim

