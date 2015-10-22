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
Plugin 'kana/vim-fakeclip'
Plugin 'altercation/vim-colors-solarized'
Plugin 'KuoE0/vim-template'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'KuoE0/AuthorInfo'
Plugin 'edsono/vim-matchit'
Plugin 'chusiang/vim-sdcv.git'
Plugin 'mattn/emmet-vim'
Plugin 'thinca/vim-localrc'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
" ZSH syntax highlight
Plugin 'clones/vim-zsh'
" Logcat syntax highlight
Plugin 'thinca/vim-logcat'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-abolish'
Plugin 'brookhong/cscope.vim'
Plugin 'rking/ag.vim'
Plugin 'majutsushi/tagbar'

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

" completion options
set completeopt=longest,menu
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

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

" enable modeline to fit the display settings for opened file
set modeline

" indent setting
set cindent
set autoindent
set smartindent
set smarttab " insert tabs on the start of a line according to shiftwidth, not tabstop

" tab setting
set shiftwidth=4 	" unit for >> and <<
set tabstop=4 		" unit for <tab>
set softtabstop=4 	" unit for mix <tab> and space
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'

" show invisible character
set listchars=nbsp:¬,tab:»·,trail:·,eol:⑀

" better line wraps
set showbreak=⇇

" better line wraps
set showbreak=⇇

" search setting
set hlsearch 	" highlight search result
set incsearch 	" go to first result 
set ignorecase  " ignore case when searching
set smartcase   " ignore case if search pattern is all lowercase, case-sensitive otherwise

" hides buffers instead of closing them
set hidden

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

let mapleader="\<Space>"

" remove the highlight of search result
nnoremap <silent> <Leader>/ :nohlsearch<CR>

" make ; be as same as :
nnoremap ; :

" mouse toggle
map m :set mouse=nv<CR>
map <silent><Leader>m :set mouse=<CR>

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

" highlight trailing space
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter *.{c,cc,cpp,h,py,js,idl,html,webidl} match ExtraWhitespace /\s\+$/
autocmd InsertEnter *.{c,cc,cpp,h,py,js,idl,html,webidl} match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave *.{c,cc,cpp,h,py,js,idl,html,webidl} match ExtraWhitespace /\s\+$/
autocmd BufWinLeave *.{c,cc,cpp,h,py,js,idl,html,webidl} call clearmatches()

" --- C/C++ ---
autocmd BufRead,BufNewFile *.{c,cpp,h,hpp} TagbarToggle

" --- Python ---
function! PythonStyle()
	set expandtab
	" mark invalid indentation
	highlight BadWhitespace ctermbg=red guibg=red 
	match BadWhitespace /^\t\+/ 

endfunction
autocmd BufRead,BufNewFile *py,*pyw call PythonStyle()

" --- JavaScript ---
autocmd BufRead,BufNewFile *js set tabstop=2
autocmd BufRead,BufNewFile *js set shiftwidth=2

" --- Arduino ---
autocmd BufRead,BufNewFile *.ino set filetype=cpp

" --- Processing ---
autocmd BufRead,BufNewFile *.pde set filetype=java

" --- Mozilla ---
autocmd BufRead,BufNewFile moz.build set filetype=python
autocmd BufRead,BufNewFile *.jsm set filetype=javascript

" --- ZSH ---
autocmd BufRead,BufNewFile *.zsh* set filetype=zsh



" ========================================
" ---------- plugin setting --------------
" ========================================

" --- vim-template ---
let g:email='kuoe0.tw@gmail.com'
let g:username='KuoE0'

" --- NED Tree ---
map<F9> <plug>NERDTreeTabsToggle<CR>

" --- airline ---
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" --- AuthorInfo ---
let g:vimrc_author='KuoE0'
let g:vimrc_email='kuoe0.tw@gmail.com'
let g:vimrc_homepage='http://kuoe0.ch/'

nmap<F4> :AuthorInfoDetect<CR>


" --- vim-sdcv ---
nmap <Leader>l :call SearchWord()<CR>

" --- emmet-vim ---
let g:user_emmet_install_global = 0
autocmd FileType html,css,php EmmetInstall

" --- syntastic ---
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" --- YouCompleteMe ---
" YCM generator: https://github.com/rdnetto/YCM-Generator
let g:ycm_global_ycm_extra_conf = "~/.vim/ycm_extra_conf.py"
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" completion for keyword in language
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" load from tagfiles like tags generated from exuberant ctags
let g:ycm_collect_identifiers_from_tags_files = 1
" disable cache
let g:ycm_cache_omnifunc = 0
let g:ycm_confirm_extra_conf = 0
" jump to definition or declaration
nnoremap <C-]> :YcmCompleter GoToDefinitionElseDeclaration<CR>
" get type of current variable
nnoremap <Leader>type :YcmCompleter GetType<CR>

" --- Ctrl-P ---
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files = 0
nnoremap <Leader>ff :CtrlP<CR>
nnoremap <Leader>fb :CtrlPBuffer<CR>
nnoremap <Leader>fr :CtrlPMRU<CR>
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'

" --- Gundo ---
nnoremap <Leader>undo :GundoToggle<CR>

" --- cscope ---
" s: Find this C symbol
nnoremap  <leader>css :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>csg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>csd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>csc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>cst :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>cse :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>csf :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>csi :call CscopeFind('i', expand('<cword>'))<CR>

" --- Tagbar ---
nmap <F8> :TagbarToggle<CR>

