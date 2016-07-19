set nocompatible
filetype off	" Required

set rtp=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'	" Required
Bundle 'altercation/vim-colors-solarized'
Plugin 'git://github.com/jeffkreeftmeijer/vim-numbertoggle.git'
Plugin 'jelera/vim-javascript-syntax'

call vundle#end()

filetype plugin indent on
set number
syntax enable
set background=dark
let g:solarized_termcolors = 256  " New line!!
colorscheme solarized
