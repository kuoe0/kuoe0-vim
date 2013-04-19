" =============================================================================
"      FileName: vimrc
"          Desc: vim environment config
"        Author: KuoE0
"         Email: kuoe0.tw@gmail.com
"      HomePage: http://kuoe0.ch/
" =============================================================================

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmark/vundle'

" orignal repo on github
Bundle 'ervandew/supertab'
Bundle 'kana/vim-fakeclip'
Bundle 'altercation/vim-colors-solarized'
Bundle 'KuoE0/vim-template'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Bundle 'majutsushi/tagbar'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-surround'
Bundle 'davidhalter/jedi-vim'
Bundle 'KuoE0/AuthorInfo'
Bundle 'Rip-Rip/clang_complete'

" --- general config ---

let OS = substitute( system( 'uname' ), "\n", "", "" )

filetype plugin indent on
syntax on

" color config
set t_Co=256
colorscheme solarized
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

" --- powerline ---
let g:Powerline_symbols='fancy'
let g:Powerline_colorscheme='solarized256'

" --- AuthorInfo ---
let g:vimrc_author='KuoE0'
let g:vimrc_email='kuoe0.tw@gmail.com'
let g:vimrc_homepage='http://kuoe0.ch/'

nmap<F4> :AuthorInfoDetect<CR>

" --- jedi-vim ---
let g:jedi#autocompletion_command = "<C-X><C-U>"
" support for supertab
au FileType python set completefunc=pythoncomplete#Complete

