jedi-vim

install jedi
pip install jedi

requirement
-----------

- cscope
- cmake
- ctags

For JS
- eslint (npm)
- babel-eslint (npm)

For vim-devicons
- [Nerd-font](https://github.com/ryanoasis/nerd-fonts)

For vim-autopep8
- [autopep8]

Hotkey

vim-multiple-cursors

- ctrl-n: select current word / select next
- ctrl-p: cancel current word and back to previous
- ctrl-x: do not select current word and go to next

For fzf.vim

Install fzf first! Use homebrew on Mac. for linux install by yourself and link it to /usr/local/opt/fzf.

Notice
------

**Ctrl-H mapping doesn't work on macOS**

Execute the following commands in terminal to fix it:

```
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
tic $TERM.ti
```

See [here](https://github.com/neovim/neovim/wiki/FAQ#my-ctrl-h-mapping-doesnt-work) for more information.
