scriptencoding utf-8

" Ramzi's Neovim configuration (heavily inspired by knweter's neovim
" configuration)
"
" Table of content
" 1. Basics #basics
" 2. Plugins #plugins
" 3. UI tweaks #ui-tweaks
" 4. Navigation #navigation

""" BASICS #basics ==============================================================
""" Tabs
" - Two space wide
set tabstop=2
set softtabstop=2
" - Expand them all
set expandtab
" - Indent by 2 spaces by default
set shiftwidth=2

""" Format Options
set formatoptions=tcrq
set textwidth=80

""" Leader
let g:mapleader=','

""" Search
" Highlight search results
set hlsearch
" Incremental search, search as you type
set incsearch
" Ignore case when searching
set ignorecase smartcase
" Ignore case when searching lowercase
set smartcase

" Set the title of the iterm tab
set title

" Line numbering
set number

""" Sane buffer behaviour
set hidden
set noswapfile
set nobackup
set nowritebackup

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

""" PLUGINS #plugins ============================================================
call plug#begin()

  """ Colorschemes and visual candy
  Plug '~/.workspaces/vim-colorschemes/vim-firewatch'
  Plug '~/.workspaces/vim-colorschemes/vim-one'
  Plug '~/.workspaces/vim-colorschemes/vim-two-firewatch'
  Plug '~/.workspaces/vim-colorschemes/vim-panda'
  Plug '~/.workspaces/vim-colorschemes/vim-candy'
  Plug '~/.workspaces/vim-colorschemes/vim-ink'
  Plug 'chriskempson/base16-vim'
  Plug 'w0ng/vim-hybrid'
  Plug 'jszakmeister/vim-togglecursor'

  """ Filetypes #filetypes
  " Polyglot loads language support on demand!
  Plug 'sheerun/vim-polyglot'
    let g:polyglot_disabled = ['elm']

  " Elixir
  Plug 'slashmili/alchemist.vim'
  Plug 'elixir-lang/vim-elixir'

  " Phoenix
  Plug 'c-brenn/phoenix.vim'
  Plug 'tpope/vim-projectionist' " required for some navigation features

  " Elm
  Plug 'ElmCast/elm-vim'
    let g:elm_format_autosave = 1

  """
  " Utilities #utilities ----------------------------------------------------
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    let g:deoplete#enable_at_startup = 1
    if !exists('g:deoplete#omni#input_patterns')
      let g:deoplete#omni#input_patterns = {}
    endif
    " use tab for completion
    inoremap <expr><Tab> pumvisible() ? "\<c-n>" : "\<Tab>"
    inoremap <expr><S-Tab> pumvisible() ? "\<c-p>" : "\<S-Tab>"

  " Add comment textobjects (I really want to reformat comments without affecting
  " the next line of code)
  Plug 'kana/vim-textobj-user' | Plug 'glts/vim-textobj-comment'
    " Example: Reformat a comment with `gqac` (ac is "a comment")

  " EditorConfig support
  Plug 'editorconfig/editorconfig-vim'

  " Jump between quicklist, location (syntastic, etc) items with ease, among other things
  Plug 'tpope/vim-unimpaired'

  """
  " Commenting --------------------------------------------------------------
  Plug 'scrooloose/nerdcommenter'
    " Add spaces after comment delimiters by default
  let g:NERDSpaceDelims = 1
  " Use compact syntax for prettified multi-line comments
  let g:NERDCompactSexyComs = 1
  " Align line-wise comment delimiters flush left instead of following code indentation
  let g:NERDDefaultAlign = 'left'
  " Set a language to use its alternate delimiters by default
  let g:NERDAltDelims_java = 1
  " Add your own custom formats or override the defaults
  let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
  " Allow commenting and inverting empty lines (useful when commenting a region)
  let g:NERDCommentEmptyLines = 1
  " Enable trimming of trailing whitespace when uncommenting
  let g:NERDTrimTrailingWhitespace = 1

  """
  " Session Management ------------------------------------------------------
  Plug 'xolox/vim-misc'  " Needed for vim-session
  Plug 'xolox/vim-session'
  let g:session_autoload = "no"
  let g:session_autosave = "no"
  let g:session_command_aliases = 1
  nnoremap <leader>so :OpenSession
  nnoremap <leader>ss :SaveSession
  nnoremap <leader>sd :DeleteSession<CR>
  nnoremap <leader>sc :CloseSession<CR>

  "
  " Always match HTML tags --------------------------------------------------
  Plug 'Valloric/MatchTagAlways'

  "
  " Generate fake text ------------------------------------------------------
  Plug 'tkhren/vim-fake'

  " Run tests with varying granularity --------------------------------------
  Plug 'janko-m/vim-test'
    nmap <silent> <leader>t :TestNearest<CR>
    nmap <silent> <leader>T :TestFile<CR>
    nmap <silent> <leader>a :TestSuite<CR>
    nmap <silent> <leader>l :TestLast<CR>
    nmap <silent> <leader>g :TestVisit<CR>
    " run tests in neovim strategy
    let g:test#strategy = 'neovim'
    " I use spinach, not cucumber!
    let g:test#ruby#cucumber#executable = 'spinach'

  " git support from dat tpope
  Plug 'tpope/vim-fugitive'

  " github support from dat tpope
  Plug 'tpope/vim-rhubarb'

  " vim interface to web apis.  Required for gist-vim
  Plug 'mattn/webapi-vim'

  " create gists trivially from buffer, selection, etc.
  Plug 'mattn/gist-vim'
    let g:gist_open_browser_after_post = 1
    let g:gist_detect_filetype = 2
    let g:gist_post_private = 1
    if has('macunix')
      let g:gist_clip_command = 'pbcopy'
    endif

  " visualize your undo tree
  Plug 'sjl/gundo.vim'
    nnoremap <F5> :GundoToggle<CR>

  """ UI Plugins #ui-plugins
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
    let g:airline_theme= 'one'
    let g:bufferline_echo = 0
    let g:airline_powerline_fonts=1
    " let g:airline_enable_branch=1
    " let g:airline_enable_syntastic=1
    " let g:airline_branch_prefix = '⎇ '
    " let g:airline_paste_symbol = '∥'
    " let g:airline#extensions#tabline#enabled = 0

  " let g:airline_left_alt_sep = '|'
  " let g:airline_left_sep = ''
  " let g:airline_right_alt_sep = '|'
  " let g:airline_right_sep = ''
  " if !exists('g:airline_symbols')
  "   let g:airline_symbols = {}
  " endif
  " let g:airline_symbols.crypt = '🔒'
  " let g:airline_symbols.linenr = '␊'
  " let g:airline_symbols.linenr = '␤'
  " let g:airline_symbols.linenr = '¶'
  " let g:airline_symbols.maxlinenr = '☰'
  " let g:airline_symbols.maxlinenr = ''
  " let g:airline_symbols.branch = '⎇'
  " let g:airline_symbols.paste = 'ρ'
  " let g:airline_symbols.paste = 'Þ'
  " let g:airline_symbols.paste = '∥'
  " let g:airline_symbols.spell = 'Ꞩ'
  " let g:airline_symbols.notexists = '∄'
  " let g:airline_symbols.whitespace = 'Ξ'

  """ Code Navigation #code-navigation
  " fzf fuzzy finder
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

    let g:fzf_layout = { 'window': 'enew' }
    " Custom search (include hidden files)
    nnoremap <silent> <leader>p :HFiles<cr>
    command! -bang -nargs=? -complete=dir HFiles
          \ call fzf#vim#files(<q-args>, {'source': 'ag --hidden --ignore .git -g ""'}, <bang>0)

    " Full text search
    nnoremap <silent> <leader>a :Ag<cr>

    " Search currently opened buffers
    nnoremap <silent> <leader>b :Buffers<cr>
    augroup localfzf
      autocmd!
      autocmd FileType fzf :tnoremap <buffer> <C-J> <C-J>
      autocmd FileType fzf :tnoremap <buffer> <C-K> <C-K>
    augroup END
    " let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }
    " Perform likewise completion
    imap <c-x><c-l> <plug>(fzf-complete-line)

  " NERDTree + Vinegar
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-vinegar'
  map <leader>n :NERDTreeToggle<cr>
  nnoremap \\ :NERDTreeToggle<cr>
  let g:NERDTreeShowHidden=1
  let g:NERDTreeWinSize=30
  let g:NERDTreeAutoDeleteBuffer=1
  let g:NERDTreeShowHidden=1
  let g:NERDTreeShowBookmarks=1

  Plug 'gcmt/taboo.vim'
  set sessionoptions+=tabpages,globals

  " Open files where you last left them
  Plug 'dietsche/vim-lastplace'

  " Execute code checks, find mistakes, in the background
  Plug 'neomake/neomake'
    " Run Neomake when I save any buffer
    augroup localneomake
      autocmd! BufWritePost * Neomake
    augroup END
    " Don't tell me to use smartquotes in markdown ok?
    let g:neomake_markdown_enabled_makers = []

    " Configure a nice credo setup, courtesy https://github.com/neomake/neomake/pull/300
    let g:neomake_elixir_enabled_makers = ['mix', 'mycredo']
    function! NeomakeCredoErrorType(entry)
      if a:entry.type ==# 'F'      " Refactoring opportunities
        let l:type = 'W'
      elseif a:entry.type ==# 'D'  " Software design suggestions
        let l:type = 'I'
      elseif a:entry.type ==# 'W'  " Warnings
        let l:type = 'W'
      elseif a:entry.type ==# 'R'  " Readability suggestions
        let l:type = 'I'
      elseif a:entry.type ==# 'C'  " Convention violation
        let l:type = 'W'
      else
        let l:type = 'M'           " Everything else is a message
      endif
      let a:entry.type = l:type
    endfunction

    let g:neomake_elixir_mycredo_maker = {
          \ 'exe': 'mix',
          \ 'args': ['credo', 'list', '%:p', '--format=oneline'],
          \ 'errorformat': '[%t] %. %f:%l:%c %m,[%t] %. %f:%l %m',
          \ 'postprocess': function('NeomakeCredoErrorType')
          \ }

  " Easily manage tags files
  Plug 'ludovicchabant/vim-gutentags'
    let g:gutentags_cache_dir = '~/.tags_cache'

  " navigate up a directory with '-' in netrw, among other things
  Plug 'tpope/vim-vinegar'
call plug#end()

""" UI TWEAKS #ui-tweaks ========================================================

" Set colorscheme
set termguicolors     " enable true colors support
let g:two_firewatch_italics=1
let g:one_allow_italics = 1
syntax enable
set background=light
colorscheme one

" Highlight current line and current column
set cursorline

""" Keyboard
" Remove highlights
" Clear the search buffer when hitting return
nnoremap <silent> <cr> :nohlsearch<cr>

" Custom behaviour
map <C-C> :q<CR>

" Custom tab opening behaviour
" map <leader>n :tabnew .<CR><C-P>

" reselect pasted content:
noremap gV `[v`]

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Split line (sister to [J]oin lines above)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Open the alternate file
map ,, <C-^>

" Makes foo-bar considered one word
set iskeyword+=-

set wildmode=longest:list,full
" make tab completion for files/buffers act like bash
set wildmenu

set splitright
set splitbelow

" Better editing experience
imap </ </<C-X><C-O>

" Fold Mapping
nnoremap <space> za
vnoremap <space> za

" Open file navigator in split or in the current buffer
nnoremap <leader>k :vs.<cr>
nnoremap <leader>l :sp.<cr>
nnoremap <leader>; :e.<cr>

" Shortcut to open split windows
nnoremap <C-P> :vsplit<cr>
nnoremap <C-S> :split<cr>

" Indentation in Visual Mode and keep lines selected
vmap < <gv
vmap > >gv

" Fold Mapping
nnoremap <space> za
vnoremap <space> za

""" NAVIGATION #navigation ======================================================
" Navigate terminal with C-h,j,k,l
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Navigate splits with C-h,j,k,l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" V Have to add this because hyperterm sends backspace for C-h
" nnoremap <silent> <BS> <C-w>h

nnoremap <a-h> <c-w><s-h>
nnoremap <a-j> <c-w><s-j>
nnoremap <a-k> <c-w><s-k>
nnoremap <a-l> <c-w><s-l>

" Navigate tabs with leader+h,l
" It's hard to hit space and h/l simultaneously so increase the timeout for
" space
nnoremap <leader><leader>[ :tabprev<cr>
nnoremap <leader><leader>] :tabnext<cr>

" Copy and paste using the system clipboard
nnoremap <leader>c "+y
nnoremap <leader>v "+p


""" MISC UTILITIES #misc-utilities ==============================================
" Display highlight information
nnoremap <leader>ii :echo synIDattr(synID(line('.'), col('.'), 1), 'name')<CR>

" Display highlighting groups
nnoremap <leader>hi :so $VIMRUNTIME/syntax/hitest.vim<cr>

""" AUTO COMMANDS #auto-cmd =====================================================
autocmd BufEnter * setlocal cursorline
autocmd BufLeave * setlocal nocursorline

augroup dotenv
  autocmd!
  autocmd BufNewFile,BufRead *.envrc setlocal filetype=sh
augroup END

augroup elixir
  autocmd!
  autocmd FileType eelixir setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
augroup END

augroup elm
  autocmd!
  autocmd BufNewFile,BufRead *.elm setlocal tabstop=4
  autocmd BufNewFile,BufRead *.elm setlocal shiftwidth=4
  autocmd BufNewFile,BufRead *.elm setlocal softtabstop=4
augroup END

augroup erlang
  autocmd!
  autocmd BufNewFile,BufRead *.erl setlocal tabstop=4
  autocmd BufNewFile,BufRead *.erl setlocal shiftwidth=4
  autocmd BufNewFile,BufRead *.erl setlocal softtabstop=4
  autocmd BufNewFile,BufRead relx.config setlocal filetype=erlang
augroup END

augroup es6
  autocmd!
  autocmd BufNewFile,BufRead *.es6 setlocal filetype=javascript
  autocmd BufNewFile,BufRead *.es6.erb setlocal filetype=javascript
augroup END

augroup markdown
  autocmd!
  autocmd FileType markdown setlocal textwidth=80
  autocmd FileType markdown setlocal formatoptions=tcrq
augroup END

augroup sass
  autocmd!
  autocmd FileType sass setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
augroup END

augroup viml
  autocmd!
  autocmd FileType vim setlocal textwidth=80
  autocmd FileType vim setlocal formatoptions=tcrq
augroup END
""" NORMALISATION #normalisation ================================================
" Delete trailing white space on save
func! DeleteTrailingWS()
  exe 'normal mz'
  %s/\s\+$//ge
  exe 'normal `z'
endfunc

augroup whitespace
  autocmd BufWrite * silent call DeleteTrailingWS()
augroup END
