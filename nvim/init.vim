call plug#begin('~/.config/nvim/plugged')
  Plug '~/.workspaces/vim-colorschemes/firewatch'

  " Utilities plugins
  Plug 'guns/xterm-color-table.vim' " All 256 xterm colors with their RGB equivalents
  Plug 'scrooloose/nerdtree'
call plug#end()


if (has("termguicolors"))
  set termguicolors
endif

filetype on
filetype indent on
filetype plugin on
syntax enable
set cursorline
set number

set noswapfile
set nobackup
set nowritebackup
set scrolloff=5
set hidden
set wildmode=longest:list,full
" make tab completion for files/buffers act like bash
set wildmenu

" Tab settings
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2

set mouse=a
set conceallevel=0

set relativenumber number

set undofile
set undodir="$HOME/.VIM_UNDO_FILES"

set splitright
set splitbelow

set ignorecase
set smartcase

set synmaxcol=500
syntax on

"let &colorcolumn='78'
" Recommended: continuous vertical split line.
set fillchars=vert:\│

set background=light
let g:hydromel_italics=1
let g:two_firewatch_italics=1
let g:one_allow_italics = 1
let g:material_allow_italics = 1
colo firewatch-light

" Mappings
let g:mapleader=','
" Better navigation between buffers and tabs
nnoremap <leader>]  :bn<cr>
nnoremap <leader>[  :bp<cr>
nnoremap <leader><leader>[ :tabp<cr>
nnoremap <leader><leader>] :tabn<cr>

" Clears incsearch
nnoremap <silent> <cr><cr> :nohlsearch<cr>

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <a-h> <c-w><s-h>
nnoremap <a-j> <c-w><s-j>
nnoremap <a-k> <c-w><s-k>
nnoremap <a-l> <c-w><s-l>

" Display highlight information
nnoremap <leader>ii :echo synIDattr(synID(line('.'), col('.'), 1), 'name')<CR>

" Open file navigator in split or in the current buffer
nnoremap <leader>k :vs.<cr>
nnoremap <leader>l :sp.<cr>
nnoremap <leader>; :e.<cr>

" Display highlighting groups
nnoremap <leader>hi :so $VIMRUNTIME/syntax/hitest.vim<cr>

" Indentation in Visual Mode and keep lines selected
vmap < <gv
vmap > >gv

set pastetoggle=<f6>

" Fold Mapping
nnoremap <space> za
vnoremap <space> za

" NERDTree
map <leader>n :NERDTreeToggle<cr>
let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize=30
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeShowHidden=1
let g:NERDTreeShowBookmarks=1
let g:NERDTreeActivateNode='<Space>'
