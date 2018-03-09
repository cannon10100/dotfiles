"With pathogen and packages darcula, ctrlp.vim, vim-airline, vim-gitgutter"

"Delete these eventually"
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

let mapleader=","
let maplocalleader=","

set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

set termguicolors

set spell spelllang=en_us

set number
set showcmd
set hlsearch
set incsearch
set wildmenu

set ruler

execute pathogen#infect()
syntax on

colorscheme darcula

filetype plugin indent on

filetype plugin on

set updatetime=250
let g:gitgutter_realtime = 1

let g:airline#extensions#tabline#enabled = 1

" Needed for airline
set laststatus=2

augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* loadview
augroup END

let g:tex_flavor='latex'
set iskeyword+=:

nmap <C-t> :TagbarToggle<CR>
map <C-n> :NERDTreeToggle<CR>

let g:ale_lint_on_insert_leave = 1

let g:neotex_enabled = 2

set guioptions-=m
set guioptions-=T

let g:ctrlp_use_caching = 1
let g:ctrlp_cmd = 'CtrlPMixed'

autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!
