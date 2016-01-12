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

set fillchars+=vert:\         " remove dash from horizontal separator

" load powerline
source $HOME/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim/plugin/powerline.vim
set laststatus=2

autocmd VimEnter * NERDTree   " load NERDTree on vim load
autocmd VimEnter * wincmd p   " shift focus to main pane

let NERDTreeShowHidden=1      " show hidden files by default in NERDTree

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction
