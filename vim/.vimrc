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
nnoremap <leader>fi :YcmCompleter FixIt<CR>
nnoremap <leader>tp :YcmCompleter GetType<CR>
nnoremap <leader>in :YcmCompleter GoToInclude<CR>
nnoremap <leader>yd :YcmDiags<CR>

let g:scratch_autohide = 1
let g:scratch_persistence_file = "/home/cannon/.vim/scratch.txt"

let g:racer_cmd = "/home/cannon/.cargo/bin/racer"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:clang_format#code_style = "llvm"
autocmd FileType c,cpp,objc nnoremap <leader>gq :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <leader>gq :ClangFormat<CR>

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
Plug 'neomake/neomake'
Plug 'milkypostman/vim-togglelist'
Plug 'racer-rust/vim-racer'
Plug 'mechatroner/rainbow_csv'
Plug 'vim-scripts/LargeFile'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'rhysd/vim-clang-format'
if has('nvim')
  "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  "Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
"let g:deoplete#enable_at_startup = 1
call plug#end()

call neomake#configure#automake('w')

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

colorscheme darcula
