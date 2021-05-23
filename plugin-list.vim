Plug 'Lokaltog/vim-easymotion'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter' " show git diff on current buffer
Plug 'altercation/vim-colors-solarized'
Plug 'alvan/vim-closetag' " Auto close paired html tag
Plug 'ap/vim-css-color', { 'for': ['css', 'scss'] } " Highlight with color code in CSS
Plug 'brookhong/cscope.vim'
Plug 'cakebaker/scss-syntax.vim' " SASS syntax highlight
Plug 'chriskempson/base16-vim' " base16 colorscheme set
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }
Plug 'clones/vim-zsh', { 'for' : 'zsh' } " ZSH syntax highlight
Plug 'ekalinin/Dockerfile.vim' " syntax of dockerfile
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'jeetsukumaran/vim-buffergator' " buffer switch
Plug 'jelera/vim-javascript-syntax' " Javascript syntax Highlight
Plug 'jiangmiao/auto-pairs' " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'junegunn/vim-easy-align' " text alignment
Plug 'junegunn/vim-oblique'
Plug 'junegunn/vim-pseudocl'
Plug 'kana/vim-fakeclip'
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
Plug 'kuoe0/AuthorInfo'
Plug 'kuoe0/vim-buffer-switch'
Plug 'kuoe0/vim-janitor'
Plug 'kuoe0/vim-skeleton' " skeleton for new files
Plug 'leafgarland/typescript-vim', { 'for': ['typescript'] }
Plug 'lfv89/vim-interestingwords' " highlight multiple words
Plug 'liuchengxu/vista.vim'
Plug 'luochen1990/rainbow'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-startify' " Fancy start screen to quick access
Plug 'myusuf3/numbers.vim' " dynamic line numbers display
Plug 'nvie/vim-flake8' " PEP8 compliant for Python
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'othree/html5.vim', { 'for': 'html' } " HTML5 syntax / omnicomplete tool
Plug 'pelodelfuego/vim-swoop'
Plug 'phongvcao/vim-stardict' " dictionary lookup
Plug 'prabirshrestha/vim-lsp'
Plug 'rhysd/conflict-marker.vim' " Git conflict marker
Plug 'rking/ag.vim'
Plug 'rust-lang/rust.vim', { 'for': ['rust'] } " rust support
Plug 'ryanoasis/vim-devicons' " Fancy font icons
Plug 'scrooloose/syntastic'
Plug 'sfiera/vim-emacsmodeline' " Parse mode line and setlocal of Emacs in vim
Plug 'sjl/gundo.vim' " visualize undo tree
Plug 'tell-k/vim-autopep8', { 'for': ['python', 'python2', 'python3'] } " Applies autopep8 to your current file
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'terryma/vim-multiple-cursors' " multiple cursor
Plug 'thinca/vim-localrc'
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' } " tmux syntax support
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-liquid' " Vim Liquid runtime files with Jekyll enhancements
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline' " Fancy status bar
Plug 'vim-airline/vim-airline-themes' " vim-airline themes
Plug 'zdict/zdict.vim' " zdict integration
Plug g:fzf_dir | Plug 'junegunn/fzf.vim'
