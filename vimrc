set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmark/vundle'

" orignal repo on github
Bundle 'Shougo/neocomplcache'
Bundle 'ervandew/supertab'
Bundle 'kana/vim-fakeclip'
Bundle 'altercation/vim-colors-solarized'
Bundle 'KuoE0/vim-template'

" --- general config ---

filetype plugin indent on
syntax on

" color config
set t_Co=256
colorscheme solarized
set background=dark

" ========================================
" ---------- plugin setting --------------
" ========================================

" --- neocomplcache ---
" auto activate neocomplcache
let g:neocomplcache_enable_at_startup=1

" --- supertab ---
let g:SuperTabDefaultCompletionType='<C-X><C-U>'

