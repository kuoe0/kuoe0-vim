# /usr/bin/env sh
vim +PluginClean! +qa
vim +PluginInstall! +qa

# install YCM
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
cd ~/.vim

# install tern_for_vim
cd ~/.vim/bundle/tern_for_vim
npm install
cd ~/.vim

