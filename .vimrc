set nocompatible
" set rtp=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" 
" Plugin 'VundleVim/Vundle.vim'	" Required
" Plugin 'hdima/python-syntax'
" Plugin 'jeffkreeftmeijer/vim-numbertoggle'
" Plugin 'tlhr/anderson.vim'
" Plugin 'scrooloose/nerdtree'
" Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'tomtom/tcomment_vim'
" Plugin 'airblade/vim-gitgutter'
" Plugin 'nathanaelkane/vim-indent-guides'
" Plugin 'dhruvasagar/vim-table-mode'
" Plugin 'terryma/vim-multiple-cursors'
" Plugin 'tpope/vim-eunuch'
" Plugin 'tpope/vim-surround'
" Plugin 'editorconfig/editorconfig-vim'
" Plugin 'w0rp/ale'
" Plugin 'Xuyuanp/nerdtree-git-plugin'
" Plugin 'neutaaaaan/iosvkem'
" Plugin 'nightsense/carbonized'
" Plugin 'tmhedberg/SimpylFold'
" Plugin 'hashivim/vim-terraform'
" Plugin 'vim-syntastic/syntastic'
" Plugin 'juliosueiras/vim-terraform-completion'
" 
" call vundle#end()
" 
set ttyfast
set lazyredraw
set regexpengine=1
set background=dark
let mapleader = " "
set spellfile=$HOME/.vim-spell-en.utf-8.add

execute pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
" 
" Search
set hlsearch
nnoremap <leader>h :nohlsearch<cr>
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ack_autofold_results = 1
cnoreabbrev ack Ack!
cnoreabbrev ag Ack!
autocmd BufAdd * exe "cd" fnameescape(getcwd())
nnoremap <Leader>f :Ack!<Enter>

" Navigation
set number
set backspace=indent,eol,start
set regexpengine=1
set relativenumber
set splitbelow
set splitright
set mouse=a
let g:jedi#documentation_command = ""

" Make ctrl+hjkl switch focus in that direction
nnoremap <down> <C-W><C-J>
nnoremap <up> <C-W><C-K>
nnoremap <right> <C-W><C-L>
nnoremap <left> <C-W><C-H>

" File
set undofile
set undodir=~/.vimundo
set clipboard=unnamed
set esckeys
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set smarttab
set incsearch
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>

syntax on

"NERDTree Stuff
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*,__pycache__,.*_cache,__init__.py,.terraform,.git
let NERDTreeRespectWildIgnore=1
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>

function! StartUp()
    if !argc() && !exists("s:std_in")
        NERDTree
    end
    if argc() && isdirectory(argv()[0]) && !exists("s:std_in")
        exe 'NERDTree' argv()[0]
        wincmd p
        ene
    end
endfunction

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * call StartUp()

"Fix Shift+Tab
nmap <S-Tab> <<
imap <S-Tab> <Esc><<a

"Move current line up or Down
nmap <S-j> <S-v>xp
nmap <S-k> <S-v>xkP

" Go to last position on file open
if has("autocmd")
  au BufReadPost * if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\]%\\@=%m

au BufNewFile,BufRead Jenkinsfile* setf groovy

au BufNewFile postmortem-*.md 0r ~/.vim/templates/postmortem-template.md

let g:terraform_fmt_on_save=1
autocmd FileType terraform setlocal shiftwidth=2 tabstop=2

autocmd Filetype gitcommit setlocal spell textwidth=72

autocmd Filetype sh setlocal shiftwidth=2 tabstop=2

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Powerline
set rtp+=/Users/kirkbator/.local/lib/python3.6/site-packages/powerline/bindings/vim
set laststatus=2
set t_Co=256

" Remap delete to go to the null register
nnoremap d "_d
vnoremap d "_d

let g:jedi#rename_command = ""
let g:jedi#goto_command = "<leader>g"
let g:jedi#goto_assignments_command = ""

let g:airline_powerline_fonts = 1

autocmd FileType go nmap <Leader>i <Plug>(go-info)
let g:go_auto_type_info = 0
set updatetime=50
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
au FileType go nmap gi <Plug>(go-def-split)
au FileType go nmap gs <Plug>(go-def-vertical)
let $GINKGO_EDITOR_INTEGRATION = "true"

noremap K     {
noremap J     }
noremap H     ^
noremap L     $

