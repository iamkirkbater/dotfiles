set nocompatible
set rtp=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'	" Required
Plugin 'hdima/python-syntax'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'tlhr/anderson.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-surround'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'w0rp/ale'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'neutaaaaan/iosvkem'
Plugin 'nightsense/carbonized'
Plugin 'tmhedberg/SimpylFold'
Plugin 'hashivim/vim-terraform'
Plugin 'vim-syntastic/syntastic'
Plugin 'juliosueiras/vim-terraform-completion'

call vundle#end()

filetype plugin indent on

set ttyfast
set lazyredraw
set regexpengine=1
set background=dark
let mapleader = " "

" execute pathogen#infect()
" call pathogen#helptags()

" Search
set hlsearch
nnoremap <leader>h :nohlsearch<cr>

" Navigation
set number
set backspace=indent,eol,start
set regexpengine=1
set relativenumber
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set colorcolumn=81
set mouse=a

let g:SimpylFold_fold_docstring = 0

" File
set undofile
set undodir=~/.vimundo
set clipboard=unnamed
set esckeys
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>

map <C-o> :NERDTreeToggle<CR>
let python_highlight_all = 1

colorscheme carbonized-dark 
let g:carbonized_dark_LineNr = 'off'
let g:carbonized_dark_CursorLineNr = 'off'

let g:terraform_fmt_on_save=1

set runtimepath+=,/usr/share/vim/vim80,~/.vim/syntax
syntax on

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Syntastic Config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" (Optional)Remove Info(Preview) window
set completeopt-=preview

" (Optional)Hide Info(Preview) window after completions
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" (Optional) Enable terraform plan to be include in filter
let g:syntastic_terraform_tffilter_plan = 1

" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
let g:terraform_completion_keys = 1

" (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
let g:terraform_registry_module_completion = 0

" Powerline
set rtp+=/Users/kirkbator/.local/lib/python3.6/site-packages/powerline/bindings/vim
set laststatus=2
set t_Co=256
