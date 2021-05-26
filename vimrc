" =============================================================================
"      FileName: vimrc
"          Desc: vim environment config
"        Author: KuoE0
"         Email: kuoe0.tw@gmail.com
"      HomePage: http://kuoe0.tw/
" =============================================================================

set nocompatible

call plug#begin('~/.vim/plugged')
" --- plug.vim ---
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

" backapse setting
set backspace=indent,eol,start

" highlight current line
set cursorline

" highlight entire column of cursor
set cursorcolumn

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
set clipboard=unnamedplus " use system register (+)

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

autocmd FileType qf nnoremap <buffer> q :q<CR>

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
nmap <Leader>dict :call SearchWord()<CR>

" --- emmet-vim ---
let g:user_emmet_install_global = 0
autocmd FileType html,css,php EmmetInstall

" --- Gundo ---
nnoremap <Leader>undo :GundoToggle<CR>

" --- ag ---
nmap <Leader>ag :Ag<CR>

" --- vim-janitor ---
let g:janitor_auto_clean_up_on_write = 1
let g:janitor_auto_clean_up_only_added = 1
let g:janitor_exclude_on_blank_lines = ['python']

" --- vim-devicons ---
let g:webdevicons_enable_airline_tabline = 0

" --- vim-startify ---
let g:startify_custom_header = []
let g:startify_session_dir = '~/.vim/session'
autocmd User Startified setlocal cursorline
nmap <Leader>h :Startify<CR>

" --- numbers.vim ---

let g:numbers_exclude = ['defx', 'vista_kind']

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

" --- vim-easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1 " case-insensitive

" Search by 2-character
nmap s <Plug>(easymotion-s2)
" Jump to anywhere in current line
nmap f <Plug>(easymotion-bd-wl)
" Jump to anywhere by the specified keyword
map <Leader>/ <Plug>(easymotion-sn)
" Jump to anywhere by the specified character
map <Leader>s <Plug>(easymotion-bd-f)

" --- vim-closetag ---
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*xml"

" --- incsearch.vim ---
" how to use:
" - using <tab> or <s-tab> to switch the search result
" - using <C-J> or <C-K> to the search result at next page or previous page
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
" search w/o moving the cursor
map g/ <Plug>(incsearch-stay)

" --- rainbow ---
let g:rainbow_active = 1 " enable rainbow parentheses

" --- vim-markdown ---
let g:vim_markdown_folding_disabled = 1

" --- defx.nvim ---
call defx#custom#option('_', {
      \ 'winwidth': 40,
      \ 'split': 'vertical',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': 'defxplorer',
      \ 'toggle': 1,
      \ 'resume': 1,
      \ 'preview_width': 85,
      \ 'preview_height': 200,
      \ 'vertical_preview': 1,
      \ 'floating_preview': 1,
      \ 'columns': 'git:mark:indent:icons:filename:type'
      \ })

" Toggle Defx
nnoremap <space>D :Defx <CR>

autocmd FileType defx call s:defx_settings()
function! s:defx_settings() abort
	nnoremap <silent><buffer><expr> ;
				\ defx#do_action('repeat')
	nnoremap <silent><buffer><expr> <Space>
				\ defx#do_action('toggle_select') . 'j'
	nnoremap <silent><buffer><expr> *
				\ defx#do_action('toggle_select_all')
	nnoremap <silent><buffer><expr> cd
				\ defx#do_action('change_vim_cwd')

	nnoremap <silent><buffer><expr> <CR>
				\ defx#is_directory() ?
				\ defx#do_action('open_tree') :
				\ defx#do_action('preview')

	nnoremap <silent><buffer><expr> b
				\ defx#do_action('multi', ['close_tree', 'close_tree', 'close_tree', 'close_tree', 'close_tree', 'close_tree', 'close_tree', 'close_tree', 'close_tree', 'close_tree'])
	nnoremap <silent><buffer><expr> o
				\ match(bufname('%'), 'defx') >= 0 ?
				\ (defx#is_directory() ? 0 : defx#do_action('drop')) :
				\ (defx#is_directory() ? 0 : defx#do_action('multi', ['open', 'quit']))
	nnoremap <silent><buffer><expr> l
				\ defx#is_directory() ? defx#do_action('open') : 0
	nnoremap <silent><buffer><expr> h
				\ defx#do_action('cd', ['..'])
	nnoremap <silent><buffer><expr> K
				\ defx#do_action('new_directory')
	nnoremap <silent><buffer><expr> N
				\ defx#do_action('new_file')
	nnoremap <silent><buffer><expr> d
				\ defx#do_action('remove')
	nnoremap <silent><buffer><expr> r
				\ defx#do_action('rename')

	nnoremap <silent><buffer><expr> L
				\ defx#do_action('redraw')
	nnoremap <silent><buffer><expr> S
				\ defx#do_action('toggle_sort', 'time')
	nnoremap <silent><buffer><expr> .
				\ defx#do_action('toggle_ignored_files')
	nnoremap <silent><buffer><expr> q
				\ defx#do_action('quit')

	nnoremap <silent><buffer><expr> j
				\ line('.') == line('$') ? 'gg' : 'j'
	nnoremap <silent><buffer><expr> k
				\ line('.') == 1 ? 'G' : 'k'

	nnoremap <silent><buffer><expr> yy
				\ defx#do_action('yank_path')
	nnoremap <silent><buffer><expr> <C-g>
				\ defx#do_action('print')

	nnoremap <silent><buffer><expr> !
				\ defx#do_action('execute_command')
	nnoremap <silent><buffer><expr> x
				\ defx#do_action('execute_system')
endfunction

" --- vista.vim ---

" Toggle Vista
nnoremap <space>V :Vista <CR>

let g:vista_default_executive = 'vim_lsp'
let g:vista_executive_for = {
			\ 'cpp': 'vim_lsp',
			\ 'python': 'vim_lsp',
			\ }

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly. Calling
" RunForNearestMethodOrFunction() when entering VIM to show the nearest function
" in the statusline automatically,
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" --- vim-lsp ---

let g:lsp_log_file = '/tmp/vim-lsp.log'
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
endif

" --- vim-clap ---
" search a file in current directory
nnoremap <Leader>ff :Clap files<CR>
" search in current directory and only tracked by git
nnoremap <Leader>fg :Clap gfiles<CR>
" search a file in opened bufferrs
nnoremap <Leader>fb :Clap buffers<CR>
" search a file in history
nnoremap <Leader>fh :Clap history<CR>
" search a line in current buffer
nnoremap <Leader>fl :Clap lines<CR>

" --- coc.nvim ---
let g:coc_global_extensions = [
      \ 'coc-clangd',
      \ 'coc-git',
      \ 'coc-highlight',
      \ 'coc-pairs',
      \ 'coc-prettier',
      \ 'coc-pyright',
      \ 'coc-rust-analyzer',
      \ 'coc-smartf',
      \ 'coc-spell-checker',
      \ 'coc-yank' ]
nmap <silent> <Leader>coc :CocList<CR>

" Use <tab> and <s-tab> to go through the completion list.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" GoTo code navigation.
nmap <silent> <Leader>gd <Plug>(coc-definition)
nmap <silent> <Leader>gy <Plug>(coc-type-definition)
nmap <silent> <Leader>gi <Plug>(coc-implementation)
nmap <silent> <Leader>gr <Plug>(coc-references)

" Fix the error if possible
nmap <silent> <Leader>fix :call CocAction('doQuickfix')<CR>
" Refactor naming
nmap <silent> <Leader>re :call CocAction('refactor')<CR>
" List diagnostics (errors and warnings)
nmap <silent> <Leader>err :CocList --normal diagnostics<CR>
" Search symbols in the current buffer (errors and warnings)
nmap <silent> <Leader>s :CocList outline<CR>
" Show symbols in the entire projects (errors and warnings)
nmap <silent> <Leader>gs :CocList symbols<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" coc-highlight
autocmd CursorHold * silent call CocActionAsync('highlight')
" coc-yank
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<CR>

" coc-smartf
" press <esc> to cancel.
nmap f <Plug>(coc-smartf-forward)
nmap F <Plug>(coc-smartf-backward)
nmap rf <Plug>(coc-smartf-repeat)
nmap rF <Plug>(coc-smartf-repeat-opposite)

augroup Smartf
  autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#6638F0
  autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
augroup end

" coc-prettier
command! -nargs=0 Prettify :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" coc-spell-checker
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" --- vim-easygrep ---
let g:EasyGrepMode=1 " search in opened files/buffers
