" =============================================================================
"      FileName: vimrc
"          Desc: vim environment config
"        Author: KuoE0
"         Email: kuoe0.tw@gmail.com
"      HomePage: http://kuoe0.tw/
" =============================================================================

set nocompatible

call plug#begin('~/.vim/plugged')
" --- functions for plug.vim ---
" build YCM when updated
function! BuildYCM(info)
	echo 'status:' . a:info.status
	if a:info.status == 'updated' || a:info.status == 'installed'
		!./install.sh --clang-completer --racer-completer
	endif
endfunction

source ~/.vim/plugin-list.vim
call plug#end()

" --- general config ---

let OS = substitute( system( 'uname' ), "\n", "", "" )

filetype plugin indent on
syntax on

" color config
set t_Co=256
set background=dark

try
	if $VIM_COLORSCHEME != ''
		if $BASE16_SUPPORT == 1 && split($VIM_COLORSCHEME, '-')[0] == 'base16'
			let base16colorspace = 256 " Access colors present in 256 colorspace
		endif
		colorscheme $VIM_COLORSCHEME
	else
		colorscheme desert
	endif
catch /^Vim\%((\a\+)\)\=:E185/
	colorscheme desert
endtry

" auto reload vimrc when editing
autocmd! bufwritepost .vimrc source ~/.vimrc

" completion options
set completeopt=longest,menu
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

" set encoding to UTF-8 (this option is not supported in neovim)
if !has('nvim')
	set encoding=utf-8
endif
" read multiple file encoding
set fileencodings=ucs-bom,utf-8,cp936,cp950,gb18030

" enable line number
set number 	" 'set nu' for short

" backapse setting
set backspace=indent,eol,start

" highlight current line
set cursorline

" show 80 column border
set colorcolumn=81 	" 'set cc=81' for short
hi ColorColumn ctermbg=0

set wildignore+=.git

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
hi clear SpellBad
hi SpellBad cterm=underline

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

" indentation
vnoremap<tab>   >gv
vnoremap<s-tab> <gv

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

" --- C/C++ ---
if winwidth(0) >= 120
	autocmd BufRead,BufNewFile *.{c,cpp,h,hpp} TagbarOpen
endif

" --- Python ---
autocmd BufRead,BufNewFile *py,*pyw set expandtab
autocmd BufRead,BufNewFile *.py3 set filetype=python

" --- JavaScript ---
autocmd BufRead,BufNewFile *js set tabstop=2
autocmd BufRead,BufNewFile *js set shiftwidth=2
let g:syntastic_javascript_checkers = ['eslint']

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
if $VIM_AIRLINE_THEME != ''
	let g:airline_theme=$VIM_AIRLINE_THEME
else
	let g:airline_theme='papercolor'
endif
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

" --- AuthorInfo ---
let g:vimrc_author='KuoE0'
let g:vimrc_email='kuoe0.tw@gmail.com'
let g:vimrc_homepage='http://kuoe0.tw/'

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
" For Rust
let g:ycm_rust_src_path = '~/Works/rust/src'

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

" --- ag ---
nmap <Leader>ag :Ag

" --- Tagbar ---
nmap <F8> :TagbarToggle<CR>

" --- vim-scavenger ---
let g:scavenger_auto_clean_up_on_write = 1
let g:scavenger_auto_clean_up_only_added = 1
let g:scavenger_exclude_on_blank_lines = ['python']

" --- vim-devicons ---
let g:webdevicons_enable_airline_tabline = 0

" --- vim-startify ---
let g:startify_custom_header = []
let g:startify_session_dir = '~/.vim/session'

" --- vim-gitgutter ---
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" --- vim-autopep8 ---
function! SetupAutopep8()
	if exists(':Autopep8')
		let g:autopep8_disable_show_diff = 1
		autocmd BufWritePre *.py,*.py3 :Autopep8
	endif
endfunction
autocmd VimEnter * :call SetupAutopep8()

" --- vim-skeleton ---
let g:skeleton_author = "KuoE0"
let g:skeleton_email = "kuoe0.tw@gmail.com"

" --- vim-easy-align ---
nmap <Leader>a= :EasyAlign =<CR>
vmap <Leader>a= :EasyAlign =<CR>
nmap <Leader>a: :EasyAlign :<CR>
vmap <Leader>a: :EasyAlign :<CR>

" --- vim-closetag ---
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*xml"

" --- vim-fzf ---
" search a file in current directory
nnoremap <Leader>ff :Files<CR>
" search in current directory and only tracked by git
nnoremap <Leader>fg :GFiles<CR>
" search a file in opened bufferrs
nnoremap <Leader>fb :Buffers<CR>
" search a file in history
nnoremap <Leader>fr :History<CR>
" search a line in current buffer
nnoremap <Leader>fl :BLines<CR>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
