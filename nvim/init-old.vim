" Update remote plugins on demand {{{
function! DoRemote(arg)
  if (has("nvim"))
    UpdateRemotePlugins
    set inccommand=nosplit
  endif
endfunction
" }}}

" Plugins =========================================================== {{{

call plug#begin('~/.config/nvim/plugged')
  "Plug 'zeekay/vice-lightline'

  " Appearance
  Plug '~/.workspaces/vim-colorschemes/vim-firewatch'
  Plug '~/.workspaces/vim-colorschemes/vim-one'
  Plug '~/.workspaces/vim-colorschemes/vim-two-firewatch'
  Plug '~/.workspaces/vim-colorschemes/vim-panda'
  Plug '~/.workspaces/vim-colorschemes/vim-candy'
  Plug '~/.workspaces/vim-colorschemes/vim-ink'
  Plug 'whatyouhide/vim-gotham'
  Plug 'itchyny/lightline.vim'
  Plug 'itchyny/lightline-powerful'
  Plug 'jszakmeister/vim-togglecursor'
  Plug 'jacoborus/tender.vim'
  Plug 'nathanaelkane/vim-indent-guides'

  Plug 'w0rp/ale'

  " Auto completion
  Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
  Plug 'zchee/deoplete-jedi', { 'do': function('DoRemote') }
  Plug 'Shougo/neosnippet.vim', { 'do': function('DoRemote') }
  Plug 'Shougo/neosnippet-snippets'

  " Session management
  Plug 'tpope/vim-obsession'

  " Colorschemes and related
  Plug 'xolox/vim-colorscheme-switcher'
  Plug 'xolox/vim-misc' " vim-colorscheme-switcher dependency

  " Enhanced edit
  Plug 'junegunn/vim-easy-align'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-ragtag'
  Plug 'scrooloose/nerdcommenter'
  Plug 'easymotion/vim-easymotion'
  Plug 'Valloric/MatchTagAlways'

  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  " Navigation
  Plug 'rking/ag.vim'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'scrooloose/nerdtree'

  " Neomake
  Plug 'neomake/neomake'

  " Tags
  Plug 'majutsushi/tagbar', { 'on' : 'TagbarToggle' }
  Plug 'xolox/vim-easytags'

  """
  " Language plugins
  """

  " Apex & Visualforce
  Plug 'ejholmes/vim-forcedotcom', { 'for' : ['apex', 'visualforce'] }

  " elm
  Plug 'lambdatoast/elm.vim'

  " Elixir
  Plug 'elixir-lang/vim-elixir'
  Plug 'mmorearty/elixir-ctags'

  " Golang
  Plug 'fatih/vim-go', { 'for' : 'go', 'do': ':GoInstallBinaries' }

  " JavaScript, Coffeescript
  Plug 'pangloss/vim-javascript', { 'for' : 'javascript' }
  if executable('npm')
    Plug 'ternjs/tern_for_vim', { 'for' : 'javascript', 'do' : 'npm install' }
  endif

  Plug 'kchmck/vim-coffee-script'
  " Latest Sass/SCSS/HAML
  Plug 'tpope/vim-haml'

  " Pug (formerly Jade)
  Plug 'digitaltoad/vim-pug'

  " Tmux configuration file
  Plug 'tmux-plugins/vim-tmux'


  " Other utilities
  Plug 'guns/xterm-color-table.vim' " All 256 xterm colors with their RGB equivalents
  Plug 'edkolev/tmuxline.vim' " Create a tmux status line using lightline colors
call plug#end()

" }}}

" Global Configuration ============================================== {{{

if (has("termguicolors"))
  set termguicolors
endif

filetype off

let &runtimepath.=',~/.config/nvim/plugged/ale'

filetype plugin on
filetype on
filetype indent on
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

set nowrap
syntax on

set iskeyword+=\- " Hyphens are considered for autocompletion

"let &colorcolumn='78'
" Recommended: continuous vertical split line.
set fillchars=vert:\│
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum

set listchars=eol:¬,trail:·,tab:🢒·
let g:hydromel_italics=1
let g:two_firewatch_italics=1
let g:one_allow_italics = 1
let g:material_allow_italics = 1
set background=light
colorscheme one

" }}}

" Mappings ========================================================== {{{

let mapleader=','
let g:mapleader=','
imap jk <ESC>

" Better navigation between buffers and tabs
nnoremap <leader>] :bn<cr>
nnoremap <leader>[ :bp<cr>
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

" Better editing experience
imap </ </<C-X><C-O>

" }}}

" NerdTree ========================================================== {{{

map <leader>n :NERDTreeToggle<cr>
let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize=30
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeShowHidden=1
let g:NERDTreeShowBookmarks=1

" }}}

" CtrlP ============================================================= {{{

nnoremap <silent> ,p :CtrlP<CR>
nnoremap <silent> ,o :CtrlPTag<CR>

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = ''

"}}}

" Deoplete ========================================================== {{{

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_debug = 1
call deoplete#custom#set('_', 'min_pattern_length', 2)
"set completeopt+=noinsert

" Use auto delimiter
call deoplete#custom#set('_', 'converters',
  \ ['converter_auto_paren',
  \  'converter_auto_delimiter', 'remove_overlap'])

let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns._ = '[a-zA-Z_]\k*\(?'
" Movement within 'ins-completion-menu'
imap <expr><C-j>   pumvisible() ? "\<C-n>" : "\<C-j>"
imap <expr><C-k>   pumvisible() ? "\<C-p>" : "\<C-k>"

" Scroll pages in menu
inoremap <expr><C-f> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<Right>"
inoremap <expr><C-b> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<Left>"
imap     <expr><C-d> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
imap     <expr><C-u> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

" Undo completion
inoremap <expr><C-g> deoplete#mappings#undo_completion()

"}}}

" Go Support ======================================================== {{{

let g:go_bin_path = expand('~/.go/bin')
" use goimports for formatting
let g:go_fmt_command = "goimports"

" turn highlighting on
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" }}}

" LightLine ========================================================= {{{

set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'twofirewatch',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! LightLineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let branch = fugitive#head()
      return branch !=# '' ? mark.branch : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
" }}}

" Neosnippet ======================================================== {{{

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" <Tab> completion:
" 1. If popup menu is visible, select and insert next item
" 2. Otherwise, if within a snippet, jump to next input
" 3. Otherwise, if preceding chars are whitespace, insert tab char
" 4. Otherwise, start manual autocomplete
imap <silent><expr><Tab> pumvisible() ? "\<C-n>"
  \ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
  \ : (<SID>is_whitespace() ? "\<Tab>"
  \ : deoplete#mappings#manual_complete()))

smap <silent><expr><Tab> pumvisible() ? "\<C-n>"
  \ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
  \ : (<SID>is_whitespace() ? "\<Tab>"
  \ : deoplete#mappings#manual_complete()))

inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:is_whitespace()
  let l:col = col('.') - 1
  return !l:col || getline('.')[l:col - 1]  =~? '\s'
endfunction

"}}}

" Tagbar ============================================================ {{{

nmap <F12> :TagbarToggle<CR>

autocmd FileType tagbar setlocal nocursorline nocursorcolumn

let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records'
    \ ]
\ }

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" let g:autotagTagsFile = ".tags"

" }}}

" Neomake =========================================================== {{{
let g:test_strategy = "neovim"
let g:neomake_open_list = 0
let g:neomake_list_height = 5
let g:neomake_serialize = 1
let g:neomake_verbose = 0
let g:neomake_coffeescript_enabled_makers = ['coffeelint']
"let g:neomake_elixir_enabled_makers = ['elixir', 'credo']
let g:neomake_elixir_enabled_makers = ['elixir', 'mycredo']
"let g:neomake_scss_enabled_checkers = ['scsslint']
let g:neomake_go_enabled_checkers = ['golint']
let g:neomake_sass_enabled_checkers = ['scsslint']
"let g:neomake_javascript_enabled_checkers = ['eslint', 'jscs']
"let g:neomake_ruby_enabled_checkers = ['mri']
"let g:neomake_python_enabled_checkers = ['pyflakes', 'pylint', 'python', 'pep8', 'flake8']


let g:neomake_elixir_enabled_makers = ['mycredo']
function NeomakeCredoErrorType(entry)
    if a:entry.type ==# 'F'      " Refactoring opportunities
        let type = 'W'
    elseif a:entry.type ==# 'D'  " Software design suggestions
        let type = 'I'
    elseif a:entry.type ==# 'W'  " Warnings
        let type = 'W'
    elseif a:entry.type ==# 'R'  " Readability suggestions
        let type = 'I'
    elseif a:entry.type ==# 'C'  " Convention violation
        let type = 'W'
    else
        let type = 'M'           " Everything else is a message
    endif
    let a:entry.type = type
endfunction
let g:neomake_elixir_mycredo_maker = {
      \ 'exe': 'mix',
      \ 'args': ['credo', 'list', '%:p', '--format=oneline'],
      \ 'errorformat': '[%t] %. %f:%l:%c %m,[%t] %. %f:%l %m',
      \ 'postprocess': function('NeomakeCredoErrorType')
      \ }

let g:neomake_vim_checkers=['vimlint']
augroup run_neomake
  autocmd! BufWritePost * Neomake
augroup end

let g:neomake_error_sign   = {'text': '▶︎', 'texthl': 'ErrorMsg'}
let g:neomake_warning_sign = {'text': '▵', 'texthl': 'MoreMsg'}
let g:neomake_message_sign = {'text': '!', 'texthl': 'MoreMsg'}
let g:neomake_info_sign    = {'text': '●', 'texthl': 'MoreMsg'}

"}}}

"autocmd Filetype html setlocal tabstop=4 shiftwidth=4 expandtab
"autocmd Filetype eelixir setlocal tabstop=4 shiftwidth=4 expandtab

let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_guide_size = 1

let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = 'full'

let g:ale_sign_column_always = 1
let g:ale_sign_error = '⮾ '
let g:ale_sign_warning = '⌇ '

au FileType sass setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
au FileType eelixir setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:mta_use_matchparen_group = 0
"let g:tmuxline_preset = {
      "\'a'    : '#S',
      "\'c'    : ['#(whoami)', '#(uptime | cud -d " " -f 1,2,3)'],
      "\'win'  : ['#I', '#W'],
      "\'cwin' : ['#I', '#W', '#F'],
      "\'x'    : '#(date)',
      "\'y'    : ['%R', '%a', '%Y'],
      "\'z'    : '#H'}
" vim: fdm=marker: