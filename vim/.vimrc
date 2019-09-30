"Delete these eventually"
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

let mapleader=","
let maplocalleader=","

set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

set spell spelllang=en_us
set spellfile=$HOME/.vim/en.utf-8.add

set number
set showcmd
set hlsearch
set incsearch
set ignorecase
set smartcase
set wildmenu

set ruler
set hidden

execute pathogen#infect()

filetype plugin indent on
filetype plugin on
syntax on


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

let g:neotex_enabled = 2

set guioptions-=m
set guioptions-=T

let g:ctrlp_use_caching = 1
let g:ctrlp_cmd = 'CtrlPMixed'

autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

let g:sneak#label = 1

let g:ycm_always_populate_location_list = 1

nnoremap gd :YcmCompleter GoTo<CR>

let g:scratch_autohide = 1
let g:scratch_persistence_file = "/home/cannon/.vim/scratch.txt"

call plug#begin()
Plug 'justinmk/vim-sneak'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'mtth/scratch.vim'
Plug 'kien/ctrlp.vim'
Plug 'blueshirts/darcula'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
if has('nvim')
  "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  "Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
"let g:deoplete#enable_at_startup = 1
call plug#end()

colorscheme darcula
