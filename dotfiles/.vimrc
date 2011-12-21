" General
"
" remap leader key to comma
set nocompatible " get out of horrible vi-compatible mode

set t_Co=256
filetype on " detect the type of file
set history=1000 " How many lines of history to remember
set cf " enable error files and error jumping
set clipboard+=unnamed " turns out I do like is sharing windows clipboard
set ffs=unix,mac,dos" support all three, in this order
filetype plugin on " load filetype plugins
filetype plugin indent on
set viminfo+=! " make sure it can save viminfo
set isk+=_,$,@,%,#,- " none of these should be word dividers, so make them not be
" Theme/Colors
set background=light " we are using a dark background
syntax on " syntax highlighting on
colorscheme zellner " my theme
" Files/Backups
set backup " make backup file
set backupdir=~/.vim/backup " where to put backup file
set directory=~/.vim/temp " directory is the directory for temp file
set makeef=error.err " When using make, where should it dump the file
"source $VIMRUNTIME/mswin.vim
set lsp=0 " space it out a little more (easier to read)
set wildmenu " turn on wild menu
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
set nohlsearch " do not highlight searched for phrases
set incsearch " BUT do highlight as you type you search phrase
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$ " what to show when I hit :set list
"set list " turns out, I don't like listchars -- show chars on end of line, whitespace, etc
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
set expandtab " real tabs please!
set nowrap " do not wrap lines 
set smarttab " use tabs at the start of a line, spaces elsewhere
"map <Esc> to jj, thus easy to switch to cmd mod
imap jj <esc>
" keep selection on indenting in visual mode
vmap > :><cr>gv
vmap < :<<cr>gv

" Custom Functions
" Select range, then hit :SuperRetab($width) - by p0g and FallingCow
function! SuperRetab(width) range
  silent! exe a:firstline . ',' . a:lastline . 's/\v%(^ *)@<= {'. a:width .'}/\t/g'
endfunction
"Keyboard mapping
noremap <F6> :GundoToggle<CR>
" map page-up and page-down to ctrl-k & ctrl-j respectively
noremap <C-k> <C-u>
noremap <C-j> <C-d>

" Mappings
map <right> <ESC>:MBEbn<RETURN> " right arrow (normal mode) switches buffers  (excluding minibuf)
map <left> <ESC>:MBEbp<RETURN> " left arrow (normal mode) switches buffers (excluding minibuf)
noremap <C-u> <up>
noremap <C-d> <down>
map <A-i> i <ESC>r " alt-i (normal mode) inserts a single char, and then switches back to normal
map <F2> <ESC>ggVG:call SuperRetab(2)<left>
map <F8> ggVGg? " encypt the file (toggle)
nmap <A-r>  <ESC>:call RestartVim()<CR>
set makeprg=mvn\ clean\ install\ -Dmaven.test.skip=true

"press F5 to get a list of buffers and goto a the selected buffer
nnoremap <F5> :buffers<CR>:buffer<Space>




