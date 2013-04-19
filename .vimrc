set fenc=utf-8 "utf-8
set termencoding=utf-8
scriptencoding utf-8
set ambiwidth=double
set nocompatible
let s:running_windows = has("was16") || has("win32") || has("win64")
let s:colorful_term= (&term =~ "xterm" ) || (&term =~ "screen")
let g:erlangHighlightBif=1
let g:erlangHighLightOperators=1
filetype off
filetype plugin off
filetype plugin indent off
set cpoptions=aABceFsmq
              " |||||||||
              " ||||||||+-- When joining lines, leave the cursor between joined lines
              " |||||||+-- When a new match is created (showmatch) pause for .5
              " ||||||+-- Set buffer options when entering the buffer
              " |||||+-- :write command updates current file name automatically add <CR> to the last line when using :@r
              " |||+-- Searching continues at the end of the match at the cursor position
              " ||+-- A backslash has no special meaning in mappings
              " |+-- :write updates alternative file name
              " +-- :read updates alternative file name
"TODO
syntax off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
set viminfo+=! " make sure it can save viminfo
set isk+=_,$,@,%,#,- " none of these should be word dividers, so make them not be
" Theme/Colors
"#################################################################
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused
"bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"let vundle manage vundle
Bundle 'gmarik/vundle'
Bundle 'spiiph/vim-space'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'tsaleh/vim-align'
Bundle 'scrooloose/nerdcommenter'
Bundle 'sjl/splice.vim'
Bundle 'scrooloose/syntastic'
Bundle 'Shougo/vimproc'
"neocomplecache should use 'master' snipmate :/ 
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'
Bundle 'vim-scripts/javacomplete'
Bundle 'Townk/vim-autoclose'
Bundle 'tomtom/quickfixsigns_vim'
Bundle 'tomtom/checksyntax_vim'
Bundle 'vim-scripts/taglist.vim'
Bundle 'FSwitch'
Bundle 'godlygeek/tabular'
Bundle 'ervandew/supertab'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'c9s/perlomni.vim'
Bundle 'vim-perl/vim-perl'
Bundle 'Rip-Rip/clang_complete'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tehmaze/profont-powerline'
Bundle 'tmhedberg/matchit'
Bundle 'vim-scripts/python_match.vim'
Bundle 'semmons99/vim-ruby-matchit'
Bundle 'tysontate/HTML-AutoCloseTag'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'chreekat/vim-paren-crosshairs'
Bundle 'derekwyatt/vim-scala'
Bundle 'kana/vim-fakeclip'
Bundle 'kien/ctrlp.vim'
Bundle 'sjl/gundo.vim'
Bundle 'terryma/vim-multiple-cursors'
"##############################################################
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_fuzzy_completion=1
let g:neocomplcache_enable_underbar_completion=1
let g:neocomplcache_enable_camel_case_completion=1
let g:neocomplcache_enable_underbar_completion=1
let g:neocomplcache_max_menu_width=25
let g:neocomplcache_temporary_dir='~/.vim/neocon/'
let g:neocomplcache_enable_auto_select=1
let g:multi_cursor_quit_key='C-q'
"Plugin key mappings
"imap <C-k> <Plug>(neocomplcache_snippets_expand)
"smap <C-k> <Plug>(neocomplcache_snippets_expand)
"imap <C-k> <Plug>(neosnippet_expand_or_jump)
"smap <C-k> <Plug>(neosnippet_expand_or_jump)
inoremap <expr><C-g>  neocomplcache#undo_completion()
inoremap <expr><C-l>  neocomplcache#complete_common_string()

"Recommended key mappings
"<CR>: close popup and save indent
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion
"inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>" 
"inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <C-j>     pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k>       pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <expr> <C-d> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
inoremap <expr> <C-u>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()"

filetype on " detect the type of file
filetype plugin on " load filetype plugins
filetype plugin indent on
colorscheme machinshin " my theme
let g:Powerline_symbols='fancy'
"show the current command in progress
set showcmd
"automatically save before commands like :next and :make 
set autowrite
" set to autoread when a file is changed from teh outside
set autoread
set t_Co=256
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' } 
set history=5000 " How many lines of history to remember
set cf " enable error files and error jumping
set clipboard+=unnamed "share windows clipboard
set ffs=unix,mac,dos "support all three, in this order

" Files/Backups
set backup " make backup file
if s:running_windows
  set backupdir=~/vimfiles/backup " where to put backup file
  set undodir=~/vimfiles/undo
  set directory=~/vimfiles/temp " directory is the directory for temp file
else
  set backupdir=~/.vim/backup " where to put backup file
  set undodir=~/.vim/undo
  set directory=~/.vim/temp " directory is the directory for temp file
endif
set undolevels=1000
set undoreload=10000

set updatetime=180 "save to swap file after 3 minutes
set makeef=error.err " When using make, where should it dump the file
set lsp=0 " space it out a little more (easier to read)
"first tab: longest match. list in the statusbar, follow tabs: cycle through matches
set wildmenu
set wildmode=longest:full,full
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.so.*,*.jpg,*.gif,*.png
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.DS_Store,*.tgz,*.gz
set ruler " Always show current positions along the bottom
"set cmdheight=2 " the command bar is 2 high
set number " turn on line numbers
set hid " you can change buffer without saving
set backspace=indent,eol,start
set whichwrap+=<,>,h,l,b,s,[,],~  " backspace and cursor keys wrap to
" | | | | | | | | |
" | | | | | | | | +-- "]" Insert and Replace
" | | | | | | | +-- "[" Insert and Replace
" | | | | | | +-- "~" Normal
" | | | | | +-- <Right> Normal and Visual
" | | | | +-- <Left> Normal and Visual
" | | | +-- "l" Normal and Visual (not recommended)
" | | +-- "h" Normal and Visual (not recommended)
" | +-- <Space> Normal and Visual
" +-- <BS> Normal and Visual
set mouse=a " use mouse everywhere
set linespace=0
set sidescroll=10
set sidescrolloff=10
set shortmess=filmnrwxsWI " shortens messages to avoid 'press a key' prompt
set report=0 " tell us when anything is changed via :...
set noerrorbells " don't make noise
" make the splitters between windows be blank
set fillchars=vert:\ ,stl:\ ,stlnc:\
" Visual Cues 
set showmatch " show matching brackets
set mat=5 " how many tenths of a second to blink matching brackets for
set hlsearch " do not highlight searched for phrases
set incsearch " BUT do highlight as you type you search phrase
set formatoptions=rq
"only show listchars in insert mode
if has("multi_byte")
  set listchars=tab:⋯\ ,eol:⋮,trail:⋅,extends:⧽,precedes:⧼" what to show when I hit :set listchars
  let g:tagbar_iconchars = ['▾', '▸']
else 
  set listchars=tab:\|\ ,eol:$,trail:.,extends:>,precedes:<" what to show when I hit :set list
  let g:tagbar_iconchars = ['+', '-']  (default on Windows)
end 

set list " turns out, I like listchars -- show chars on end of line, whitespace, etc
"set lines=80 " 80 lines tall
"set columns=160 " 160 cols wide
"set so=10 " Keep 10 lines (top/bottom) for scope
set novisualbell " don't blink
set laststatus=2 " always show the status line
" Text Formatting/Layout
set fo=tcrqn " See Help (complex)
set ai " autoindent
set si " smartindent
set cindent " do c-style indenting
set tabstop=4 " tab spacing (settings below are just to unify it)
set softtabstop=4 " unify
set shiftwidth=4 " unify
set expandtab " real tabs please!
set nowrap " do not wrap lines 
set smarttab " use tabs at the start of a line, spaces elsewhere
"map <Esc> to jj,thus easy to switch to cmd mod
imap jj <ESC>
" remap leader key to comma
let mapleader=","
let maplocalleader="<"
let g:mapleader=","
" keep selection on indenting in visual mode
vnoremap < <gv 
vnoremap > >gv 

" Custom Functions
" Select range, then hit :SuperRetab($width) - by p0g and FallingCow
function! SuperRetab(width) range
  silent! exe a:firstline . ',' . a:lastline . 's/\v%(^ *)@<= {'. a:width .'}/\t/g'
endfunction
" map page-up and page-down to ctrl-k & ctrl-j respectively
noremap <S-k> <C-u>
noremap <S-j> <C-d>

" Mappings

"press F5 to get a list of buffers and goto a the selected buffer
nnoremap <F5> :buffers<CR>:b<Space>
"turn off *ALL* bells
set vb t_vb=
set ofu=syntaxcomplete#Complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java setlocal completefunc=javacomplete#CompleteParamsInfo
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Restore cursor position
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
let g:snips_author = 'Vat Raghavan ( machinshin@gmail.com ) '

"disable autoindent before pasting. 
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

function! PasterToggle()
  let w:check_paste_status =exists('w:check_paste_status') ? !w:check_paste_status : 1
  call QuickfixsignsToggle()
  if( w:check_paste_status)
    execute "set mouse="
    execute "set foldcolumn=0"
    execute "set nolist"
    execute "set nonumber"
  else 
    execute "set mouse=a"
    execute "set foldcolumn=1"
    execute "set list"
    execute "set number"
  endif
endfunction
nnoremap <silent><Leader>2 :call PasterToggle()<CR>

function! DoChighlight()
  let w:check_highlight_status =exists('w:check_highlight_status ') ? !w:check_highlight_status : 1
  if( w:check_highlight_status )
    execute "syntax on"
    execute "colorscheme machinshin"
  else 
    execute "syntax off"
  endif
endfunc
syntax on 
nnoremap <silent><Leader>3 :call DoChighlight()<CR>
"quicksave
nmap <Leader>s :w!<cr>
"fast edit of vimrc
map <silent> <Leader><v> :e! ~/.vimrc<cr>
map <silent> <Leader><Leader>c :set cursorcolumn!<cr> :set cursorline!<cr>

function! g:ToggleColorColumn()
  if &colorcolumn != ''
    setlocal colorcolumn&
  else
    setlocal colorcolumn=80
  endif
endfunction
noremap <silent><Leader><Leader>l :call g:ToggleColorColumn()<CR>
set colorcolumn=80

"Window movement/management
" go up a window
nnoremap <Leader>t <C-w>k
" go down a window
nnoremap <Leader>b <C-w>j
" go left a window 
nnoremap <Leader>h <C-w>h
" go right a window
nnoremap <Leader>l <C-w>l
" new window on top
nnoremap <Leader>n <C-w>n
" quit window
nnoremap <Leader>q <C-w>q
" quit all windows & shutdown vim
nnoremap <silent><Leader><Leader>q <ESC>:qa<CR>
"rotate windows to the bottom/right 
nnoremap <Leader><Leader>r <C-w>r
"rotate windows to the top/left 
nnoremap <Leader><Leader>R <C-w>r
"make only window
nnoremap <Leader><Leader>o <C-w>o
" move current window to far left
nnoremap <Leader><Leader>h <C-W>H
" move current window to far right 
nnoremap <Leader><Leader>l <C-W>L
" move current window to top, not j/k cause i hit ,, (then j/k) too often, and fuck things up
nnoremap <Leader><Leader>t <C-W>K
" move current window to bottom 
nnoremap <Leader><Leader>b <C-W>J
"remap j to next row, not next line
nnoremap j gj
nnoremap k gk
"show at top
let g:ctrlp_match_window_bottom=0
" Tell Ctrl-P to keep the current VIM working directory when starting a
" search, another really stupid non default
"let g:ctrlp_working_path_mode = 0
" Ctrl-P ignore target dirs so VIM doesn't have to! Yay!
let g:ctrlp_custom_ignore = { 
      \ 'dir':  '\v[\/]\.(git|hg|svn|local|locallib)$', 
      \ 'file': '\v\.(exe|so|dll|tgz|gz)$', 
      \ }
" Open a new file in a tab by default
let g:ctrlp_open_multi = 'i'
let g:ctrlp_match_window_reverse=0
let g:ctrlp_clear_cache_on_exit=1
nnoremap <F3> :GundoToggle<CR>

" Window resizing mappings
nnoremap <silent> <S-Up> :<c-u>exe "resize " . (winheight(0) + 5)<cr>
nnoremap <silent> <S-Down> :<c-u>exe "resize " . (winheight(0) - 5)<cr>
nnoremap <silent> <S-Left> :<c-u>exe "vertical resize " . (winwidth(0) - 5)<cr>
nnoremap <silent> <S-Right> :<c-u>exe "vertical resize " . (winwidth(0) + 5)<cr>

set foldenable
set foldmethod=manual
set foldcolumn=1
set foldlevelstart=20
set foldlevel=10
set foldopen=block,hor,mark,percent,quickfix,tag "what movements open folds"
function! NeatFoldText()
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = split(filter(split(&fillchars, ','), 'v:val =~# "fold"')[0], ':')[-1]
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let length = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g'))
  return foldtextstart . repeat(foldchar, winwidth(0)-length) . foldtextend
endfunction
set foldtext=NeatFoldText()

"maps for foldng
" close all open folds
nnoremap <Leader>f zM<cr>
" open all closed folds
nnoremap <Leader>F zR<cr>

" remember folding state
au BufWinLeave * silent mkview
au BufWinEnter * silent loadview

"clear hlsearch results by typing ,,c
nnoremap <silent> <Leader><Leader>c :nohlsearch<CR>

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
" Keep search matches in the middle of the window and pulse the line when moving
" to them.
nnoremap <Space> ]czzzv
nnoremap <S-Space> [czzzv
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap m ]czzzv
nnoremap M [czzzv
nnoremap <Leader>o do<CR>
nnoremap <Leader>P dp<CR>

let g:AutoClosePairs_add="<> | ' []"
let java_highlight_debug=1
let java_highlight_all=1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
" jump to start & end of line using home-row keys
map H ^
map L $
" tabbing selected section
"map Q to last recorded macro
map Q @@
nnoremap <silent>.n :n<cr>
nnoremap <silent>.p :N<cr>
nnoremap <silent><Leader><Leader>q :qa<CR>
nnoremap / /\v
vnoremap / /\v
set gdefault
"make traversing help docs easier
nnoremap <buffer> <CR> <C-]>
nnoremap <buffer> <BS> <C-T>
nnoremap <buffer> o /'\l\{2,\}'<CR>
nnoremap <buffer> O ?'\l\{2,\}'<CR>
nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>
nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>
inoremap nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>
inoremap nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>

" visually select everything between 2 %'s'
noremap <Leader>% v%
"scroll screen on brace highlight

" Tabularize {
if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a> :Tabularize /=><CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:<CR>
    vmap <Leader>a: :Tabularize /:<CR>
    nmap <Leader>a:: :Tabularize /:\zs<CR>
    vmap <Leader>a:: :Tabularize /:\zs<CR>
    nmap <Leader>a, :Tabularize /,<CR>
    vmap <Leader>a, :Tabularize /,<CR>
    nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
endif
" }Tabularize 
" Y to end of line 
nnoremap Y y$

nnoremap <silent><Leader>~ :set tildeop!<CR>
let g:ragtag_global_maps = 1
nnoremap <silent> <F8> :TagbarToggle<CR>
"Tagbar options
let g:tagbar_compact=1
if &diff 
else
    autocmd VimEnter * nested :call tagbar#autoopen(1)
endif
set shell=zsh 

au BufNewFile,BufRead *.tt setf tt2
au BufNewFile,BufRead *.tt2 setf tt2
if $TMUX == ''
  set clipboard+=unnamed
endif
set tags=tags;
