" =============================================================================
"      FileName: vimrc
"          Desc: vim environment config
"        Author: KuoE0
"         Email: kuoe0.tw@gmail.com
"      HomePage: http://kuoe0.tw/
" =============================================================================

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Plugin 'gmarik/vundle'

" orignal repo on github
Plugin 'ervandew/supertab'
Plugin 'kana/vim-fakeclip'
Plugin 'altercation/vim-colors-solarized'
Plugin 'KuoE0/vim-template'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'majutsushi/tagbar'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-surround'
Plugin 'davidhalter/jedi-vim'
Plugin 'KuoE0/AuthorInfo'
Plugin 'Rip-Rip/clang_complete'
Plugin 'Shougo/neocomplcache'
Plugin 'edsono/vim-matchit'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'adimit/prolog.vim'
Plugin 'chusiang/vim-sdcv.git'
Plugin 'mattn/emmet-vim'
Plugin 'justinmk/vim-sneak'
Plugin 'sophacles/vim-processing'
Plugin 'thinca/vim-localrc'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/html5.vim'

" --- general config ---

let OS = substitute( system( 'uname' ), "\n", "", "" )

filetype plugin indent on
syntax on

" color config
set t_Co=256
try
	colorscheme solarized
catch /^Vim\%((\a\+)\)\=:E185/
	colorscheme morning
endtry
set background=dark

" auto reload vimrc when editing
autocmd! bufwritepost .vimrc source ~/.vimrc

" read multiple file encoding
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936,cp950

" enable line number
set number 	" 'set nu' for short

" backapse setting
set backspace=indent,eol,start

" highlight current line
set cursorline

" show 80 column border
set colorcolumn=81 	" 'set cc=81' for short
hi ColorColumn ctermbg=0

" show command
set showcmd

" show current mode
set showmode

" show matched parentheses, e.g. () [] {}
set showmatch

" indent setting
set cindent
set autoindent
set smartindent
set smarttab

" tab setting
set shiftwidth=4 	" unit for >> and <<
set tabstop=4 		" unit for <tab>
set softtabstop=4 	" unit for mix <tab> and space

" show invisible character
set listchars=nbsp:¬,tab:»·,trail:·,eol:⑀
set list

" search setting
set hlsearch 	" highlight search result
set incsearch 	" go to first result 

" undo setting
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=1000

" history
set history=100

" clipboard
set clipboard=unnamed	" use system register (*)

" mouse
set mouse=a

" spell check
set spell

" status setting
set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ 
set statusline+=\ \ \ [%{&ff}/%Y]\ 
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\ 
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L\ 

function! HasPaste()
	if &paste
		return '[PASTE]'
	else
		return ''
	endif
endfunction

function! CurDir()
	let curdir = substitute(getcwd(), $HOME, "~", "")
	return curdir
endfunction


" --- hotkey config ---

let mapleader="`"

" mouse toggle
map m :set mouse=nv<CR>
map <silent><leader>m :set mouse=<CR>

" indent in normal mode
map<tab> v>
map<s-tab> v<

" shortcut for shell
map <F3>	:sh<CR>
imap <F3>	:sh<CR>

" replace command
imap <c-r> <Esc><c-r>

" move around split windows
" move to the below split 
map <c-j> <c-w>j
" move to the above split 
map <c-k> <c-w>k
" move to the left split 
map <c-h> <c-w>h
" move to the right split  
map <c-l> <c-w>l

" toggle list
map <F2> :set list!<CR>
" change fileencoding to utf8 and fileformat to unix
map <F5> :set fileencoding=utf8 \| :set fileformat=unix <CR>

" underline for title
nnoremap <Leader>t= yypVr=
nnoremap <Leader>t- yypVr-
nnoremap <Leader>t# yypVr#
nnoremap <Leader>t" yypVr"
nnoremap <Leader>t* yypVr*


" =======================================
" --------------- language --------------
" =======================================

" --- python ---
function! PythonStyle()
	set expandtab
	" mark invalid indentation
	highlight BadWhitespace ctermbg=red guibg=red 
	match BadWhitespace /^\t\+/ 

endfunction
au BufRead,BufNewFile *py,*pyw call PythonStyle()

" --- Arduino ---
autocmd BufRead,BufNewFile *.ino set filetype=cpp

" --- Processing ---
autocmd BufRead,BufNewFile *.pde set filetype=java

" --- Mozilla ---
autocmd BufRead,BufNewFile moz.build set filetype=python
autocmd BufRead,BufNewFile *.jsm set filetype=javascript


" ========================================
" ---------- plugin setting --------------
" ========================================

" --- neocomplcache ---
" auto activate neocomplcache
let g:neocomplcache_enable_at_startup=1

" --- supertab ---
let g:SuperTabDefaultCompletionType='<C-X><C-U>'

" --- vim-template ---
let g:email='kuoe0.tw@gmail.com'
let g:username='KuoE0'

" --- NED Tree ---
map<F9> <plug>NERDTreeTabsToggle<CR>

" --- tarbar ---
" shortcut 
nmap<F8> :TagbarToggle<CR>
" width
let g:tagbar_width=30
" tag resource

if OS == "Linux"
	let g:tagbar_ctags_bin='ctags'
elseif OS == "Darwin"
	let g:tagbar_ctags_bin='/usr/local/Cellar/ctags/5.8/bin/ctags'
endif

" --- lightline ---
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" symbol ref:
" https://github.com/Lokaltog/powerline/commit/53fbfe15fead8cc7598bcb4ee9714a221ab7e446

" --- AuthorInfo ---
let g:vimrc_author='KuoE0'
let g:vimrc_email='kuoe0.tw@gmail.com'
let g:vimrc_homepage='http://kuoe0.ch/'

nmap<F4> :AuthorInfoDetect<CR>

" --- jedi-vim ---
let g:jedi#completions_command = "<C-X><C-U>"

" support for supertab

" --- NeoComplCache ---
let g:neocomplcache_enable_at_startup=1
" enable omni completion
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" --- vim-sdcv ---
nmap <leader>l :call SearchWord()<CR>

" --- emmet ---
let g:user_emmet_install_global = 0
autocmd FileType html,css,php EmmetInstall

" --- clang_complete

if OS == 'Darwin'
	let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
elseif OS == 'Linux'
	let g:clang_library_path='/usr/lib/llvm-3.4/lib'
endif


