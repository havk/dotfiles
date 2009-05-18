set nocompatible

" Various options
set formatoptions="q"
set cpoptions-=$<
set ruler
set scrolloff=1
set encoding=utf-8
set nostartofline
set autowrite

set listchars=tab:».,trail:¤
set list

" Tabulation
set tabstop=4
set shiftwidth=4
set noexpandtab

" Search options
set hlsearch
set ignorecase
set smartcase
set incsearch

" set format textwidth so that the text fits in a 80 columns window
set textwidth=79

filetype on
filetype plugin on
syntax on
se cindent

noremap <F12> <C-]>
noremap <F11> <C-T>

set cindent
set cinkeys=0{,0},!^F,o,O,e " default is: 0{,0},0),:,0#,!^F,o,O,e

let mapleader=','

" buffer navigation
" Use TAB key in normal mode to switch buffers
nnoremap <TAB> <C-W>w
nnoremap <S-TAB> <C-W>W

" use ² (square) two switch between alternate buffer
nnoremap ² :b#<CR>

" These settings are from http://clavier-dvorak.org/wiki/Utilisateur:Kaze/vimrc
" but a little customized
" I need another Esc key
inoremap <Tab> <Esc>
vnoremap <Tab> <Esc>
inoremap <S-Tab> <Tab>
vnoremap <S-Tab> <Tab>
inoremap <S-Return> <Esc>
vnoremap <S-Return> <Esc>
inoremap <M-Return> <Esc>
vnoremap <M-Return> <Esc>

" lazy scrolling
noremap <BS> <PageUp>
noremap <Space> <PageDown>
noremap <S-BS> <C-u>
noremap <S-Space> <C-d>
noremap <S-Return> zt

set bg=dark

" GUI stuff
if has( "gui_running" )
    set bg=light
    colorscheme habiLight
    set guifont=-*-terminus-*-r-*-*-12-*-*-*-*-*-*-*
    set guioptions=a
    set lines=999
    set columns=999
else
    " color scheme for the console
    colorscheme tango
endif

