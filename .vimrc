runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax on
filetype on
filetype indent on
filetype plugin on

if $TERM == "xterm-256color"
  set t_Co=256
endif

set background=dark
colorscheme railscasts

set expandtab
set tabstop=2
set shiftwidth=2

set number                    " display line numbers
set noswapfile                " disable swap file creation 
