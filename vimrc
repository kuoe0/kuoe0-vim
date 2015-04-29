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
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-surround'
Plugin 'KuoE0/AuthorInfo'
Plugin 'edsono/vim-matchit'
Plugin 'chusiang/vim-sdcv.git'
Plugin 'thinca/vim-localrc'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'Valloric/YouCompleteMe'
" ZSH syntax highlight
Plugin 'clones/vim-zsh'

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


" --- vim-sdcv ---
nmap <Leader>l :call SearchWord()<CR>

" --- emmet ---
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

" --- unite.vim ---
let g:unite_source_history_yank_enable = 1
" file search
nnoremap <Leader>ff :Unite -start-insert file_rec/async<CR>
nnoremap <Leader>rf :Unite -quick-match file_mru<CR>
" content search
nnoremap <Leader>g  :Unite -auto-preview grep:.<CR>
" quick switch between buffer
nnoremap <Leader>s  :Unite -quick-match buffer<CR>

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
" jump to definition or declaration
nnoremap <Leader><CR> :YcmCompleter GoToDefinitionElseDeclaration<CR>
" get type of current variable
nnoremap <Leader>type :YcmCompleter GetType<CR>

