" General
set nocompatible " get out of horrible vi-compatible mode
" show the current command in progress
set showcmd
" set to autoread when a file is changed from teh outside
set autoread
set t_Co=256
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' } 
filetype on " detect the type of file
set history=1000 " How many lines of history to remember
set cf " enable error files and error jumping
set clipboard+=unnamed "turns out I do like is sharing windows clipboard
set ffs=unix,mac,dos "support all three, in this order
filetype plugin on " load filetype plugins
filetype plugin indent on
set viminfo+=! " make sure it can save viminfo
set isk+=_,$,@,%,#,- " none of these should be word dividers, so make them not be
" Theme/Colors
"set background=light " we are using a dark background
syntax on " syntax highlighting on

"let g:inkpot_black_background=1
"colorscheme inkpot "my theme
colorscheme machinshin " my theme

" Files/Backups
set backup " make backup file
set backupdir=~/.vim/backup " where to put backup file
set directory=~/.vim/temp " directory is the directory for temp file
set makeef=error.err " When using make, where should it dump the file
set lsp=0 " space it out a little more (easier to read)
"first tab: longest match. list in the statusbar, follow tabs: cycle through matches
set wildmenu wildmode=longest:full,full
"set wildmenu " turn on wild menu
set ruler " Always show current positions along the bottom
"set cmdheight=2 " the command bar is 2 high
set number " turn on line numbers
set hid " you can change buffer without saving
set backspace=2 " make backspace work normal
set whichwrap+=<,>,h,l  " backspace and cursor keys wrap to
set mouse=a " use mouse everywhere
set shortmess=atI " shortens messages to avoid 'press a key' prompt
set report=0 " tell us when anything is changed via :...
set noerrorbells " don't make noise
" make the splitters between windows be blank
set fillchars=vert:\ ,stl:\ ,stlnc:\
" Visual Cues
set showmatch " show matching brackets
set mat=5 " how many tenths of a second to blink matching brackets for
set hlsearch " do not highlight searched for phrases
set incsearch " BUT do highlight as you type you search phrase
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$ " what to show when I hit :set list
set list " turns out, I like listchars -- show chars on end of line, whitespace, etc
"set lines=80 " 80 lines tall
"set columns=160 " 160 cols wide
"set so=10 " Keep 10 lines (top/bottom) for scope
set novisualbell " don't blink
set statusline=%F%m%r%h%w\ [FM=%{&ff}]\ [TYPE=%Y]\ [ASC=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2 " always show the status line
" Text Formatting/Layout
set fo=tcrqn " See Help (complex)
set ai " autoindent
set si " smartindent
set cindent " do c-style indenting
set tabstop=2 " tab spacing (settings below are just to unify it)
set softtabstop=2 " unify
set shiftwidth=2 " unify
"set expandtab " real tabs please!
set nowrap " do not wrap lines 
set smarttab " use tabs at the start of a line, spaces elsewhere
"map <Esc> to jj,thus easy to switch to cmd mod
imap jj <ESC>
" remap leader key to comma
let mapleader=","
let maplocalleader="<"
let g:mapleader=","
" keep selection on indenting in visual mode
vmap <Leader>> :><cr>gv
vmap <Leader>< :<<cr>gv

" Custom Functions
" Select range, then hit :SuperRetab($width) - by p0g and FallingCow
function! SuperRetab(width) range
silent! exe a:firstline . ',' . a:lastline . 's/\v%(^ *)@<= {'. a:width .'}/\t/g'
endfunction
"Keyboard mapping
noremap <F6> :GundoToggle<CR>
" map page-up and page-down to ctrl-k & ctrl-j respectively
noremap <S-k> <C-u>
noremap <S-j> <C-d>

" Mappings
"map <right> <ESC>:MBEbn<RETURN> " right arrow (normal mode) switches buffers  (excluding minibuf)
"map <left> <ESC>:MBEbp<RETURN> " left arrow (normal mode) switches buffers (excluding minibuf)
"noremap <C-u> <up>
"noremap <C-d> <down>
"map <F3> <ESC>ggVG:call SuperRetab(2)<left>
map <F8> ggVGg? " encypt the file (toggle)
nmap <A-r>  <ESC>:call RestartVim()<CR>
set makeprg=mvn\ clean\ install\ -Dmaven.test.skip=true

"press F5 to get a list of buffers and goto a the selected buffer
nnoremap <F5> :buffers<CR>:buffer<Space>
"nmap <F3> :TagbarToggle<CR>
"turn off *ALL* bells
set vb t_vb=
set ofu=syntaxcomplete#Complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java setlocal completefunc=javacomplete#CompleteParamsInfo
" Restore cursor position
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

"inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
"inoremap <buffer> <C-S-Space> <C-X><C-U><C-P>

let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
let g:snips_author = 'Srivatsan (Vat) Raghavan ( srivatsan.raghavan@etrade.com ) '

"disable autoindent before pasting. 
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
"change leader
"quicksave
nmap <Leader>s :w!<cr>
"fast edit of vimrc
map <Leader><F2> :e! ~/.vimrc<cr>
map <Leader>cc :set cursorcolumn!<cr> :set cursorline!<cr>
" Window resizing mappings /*{{{*/
nnoremap <S-Up> :normal <c-r>=Resize('+')<CR><CR>
nnoremap <S-Down> :normal <c-r>=Resize('-')<CR><CR>
nnoremap <S-Left> :normal <c-r>=Resize('>')<CR><CR>
nnoremap <S-Right> :normal <c-r>=Resize('<')<CR><CR>
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

let NERDTreeDirArrows=1
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
let NERDTreeShowBookmarks=1

"toggle open nerdtree
nnoremap <Leader><Leader>n :NERDTreeToggle<CR>

function! Resize(dir)
  let this = winnr()
  if '+' == a:dir || '-' == a:dir
    execute "normal \<c-w>k"
    let up = winnr()
    if up != this
      execute "normal \<c-w>j"
      let x = 'bottom'
    else
      let x = 'top'
    endif
  elseif '>' == a:dir || '<' == a:dir
    execute "normal \<c-w>h"
    let left = winnr()
    if left != this
      execute "normal \<c-w>l"
      let x = 'right'
    else
      let x = 'left'
    endif
  endif
  if ('+' == a:dir && 'bottom' == x) || ('-' == a:dir && 'top' == x)
    return "5\<c-v>\<c-w>+"
  elseif ('-' == a:dir && 'bottom' == x) || ('+' == a:dir && 'top' == x)
    return "5\<c-v>\<c-w>-"
  elseif ('<' == a:dir && 'left' == x) || ('>' == a:dir && 'right' == x)
    return "5\<c-v>\<c-w><"
  elseif ('>' == a:dir && 'left' == x) || ('<' == a:dir && 'right' == x)
    return "5\<c-v>\<c-w>>"
  else
    echo "oops. check your ~/.vimrc"
    return ""
  endif
endfunction

set foldenable
set foldmethod=manual
set foldcolumn=1
"maps for foldng
" close all open folds
map <Leader>f <cr>zM<cr>
" open all closed folds
map <Leader>F <cr>zR<cr>

" remember folding state
au BufWinLeave * mkview
au BufWinEnter * silent loadview
"indent xml properly
function! DoPrettyXML()
		1,$!xmllint --format --recover -
endfunction
command! PrettyXML call DoPrettyXML()
"clear hlsearch results by typing ,,
map <Leader><Leader> <C-N> :let @/=""<CR>

" append newline in insert mode
imap <f3> <esc>o
" prepend newline in insert mode
imap <f4> <esc>O
" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
" Keep search matches in the middle of the window and pulse the line when moving
" " to them.
nnoremap n nzzzv
nnoremap N Nzzzv
" Show syntax highlighting groups for word under cursor

nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

