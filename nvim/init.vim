scriptencoding utf-8

" Ramzi's Neovim configuration

""" ============================================================================
""" PLUGINS #plugins ===========================================================
""" ============================================================================
call plug#begin()

  """ Colorschemes and visual candy
  Plug '~/.workspaces/_projects/vim-colorschemes/vim-firewatch'
  Plug '~/.workspaces/_projects/vim-colorschemes/vim-one'
  Plug '~/.workspaces/_projects/vim-colorschemes/vim-two-firewatch'
  Plug 'jszakmeister/vim-togglecursor'

  Plug 'Yggdroot/indentLine'

call plug#end()

""" ============================================================================
""" BASICS #basics =============================================================
""" ============================================================================

""" Tabs
set tabstop=2
set softtabstop=2
set expandtab

set shiftwidth=2

""" Leader
let g:mapleader = ','

""" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

""" Line numbering
set number
set cursorline

""" Sane buffer behaviour
set hidden
set noswapfile
set nobackup
set nowritebackup

""" Set colorscheme
set termguicolors
let g:two_firewatch_italics=1
let g:one_allow_italics = 1
syntax enable
set background=light
colorscheme one

""" Undo #undo
" undofile - This allows you to use undos after exiting and restarting
" This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
" :help undo-persistence
" This is only present in 7.3+
if isdirectory($HOME . '/.config/nvim/undo') == 0
  :silent !mkdir -p ~/.config/nvim/undo > /dev/null 2>&1
endif
set undodir=./.vim-undo//
set undodir+=~/.vim/undo//
set undofile

let g:indentLine_char = '┊'
let g:indentLine_setColors = 0
