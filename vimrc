set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmark/vundle'

" orignal repo on github
Bundle 'KuoE0/AuthorInfo'
Bundle 'Shougo/neocomplcache'
Bundle 'ervandew/supertab'


filetype plugin indent on

" ========================================
" ---------- plugin setting --------------
" ========================================

" --- AuthorInfo ---
let g:vimrc_author='KuoE0'
let g:vimrc_email='kuoe0.tw@gmail.com'
let g:vimrc_homepage='http://kuoe0.ch/'

nmap<F4> :AuthorInfoDetect<CR>

" --- neocomplcache ---
" auto activate neocomplcache
let g:neocomplcache_enable_at_startup=1

