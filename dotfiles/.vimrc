"set ignorecase -- turns out, I like case sensitivity
"autocmd GUIEnter * :simalt ~x 
"-- we're trying it out having it auto maximize the screen is annoying
"autocmd BufEnter * :lcd %:p:h -- switch to current dir (breaks some scripts)
" General
"
" remap leader key to comma
let mapleader = ","
filetype off
"press F5 to get a list of buffers and goto a the selected buffer
nnoremap <F5> :buffers<CR>:buffer<Space>

set t_Co=256
filetype on " detect the type of file
set nocompatible " get out of horrible vi-compatible mode
set history=1000 " How many lines of history to remember
set cf " enable error files and error jumping
set clipboard+=unnamed " turns out I do like is sharing windows clipboard
set ffs=dos,unix,mac " support all three, in this order
filetype plugin on " load filetype plugins
filetype plugin indent on
set viminfo+=! " make sure it can save viminfo
set isk+=_,$,@,%,#,- " none of these should be word dividers, so make them not be
" Theme/Colors
set background=dark " we are using a dark background
syntax on " syntax highlighting on
colorscheme torte " my theme
" Files/Backups
set backup " make backup file
set backupdir=~/.vim/backup " where to put backup file
set directory=~/.vim/temp " directory is the directory for temp file
let MRU_File='~/.vim/.mru_files'
let MRU_Max_Entries=1000
"let MRU_Exclude_Files='^c:\\temp\\.*'
"let MRU_Include_Files='\.c$\|\.h$'
"
set makeef=error.err " When using make, where should it dump the file
" Vim UI
behave mswin
"source $VIMRUNTIME/mswin.vim
set lsp=0 " space it out a little more (easier to read)
set wildmenu " turn on wild menu
set ruler " Always show current positions along the bottom
set cmdheight=2 " the command bar is 2 high
set number " turn on line numbers
set lz " do not redraw while running macros (much faster) (LazyRedraw)
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
set lines=80 " 80 lines tall
set columns=160 " 160 cols wide
set so=10 " Keep 10 lines (top/bottom) for scope
set novisualbell " don't blink
set noerrorbells " no noises
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
" Folding
"    Enable folding, but by default make it act like folding is off, because folding is annoying in anything but a few rare cases
set foldenable " Turn on folding
set foldmethod=marker
"set foldmethod=indent " Make folding indent sensitive
set foldlevel=100 " Don't autofold anything (but I can still fold manually)
set foldopen-=search " don't open folds when you search into them
set foldopen-=undo " don't open folds when you undo stuff
" CTags
"let Tlist_Ctags_Cmd = $VIM.'\ctags.exe' " Location of ctags
"let Tlist_Sort_Type = "name" " order by
"let Tlist_Use_Right_Window = 1 " split to the right side of the screen
"let Tlist_Compart_Format = 1 " show small meny
"let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself
"let Tlist_File_Fold_Auto_Close = 0 " Do not close tags for other files
"let Tlist_Enable_Fold_Column = 0 " Do not show folding tree
"Configure browser for haskell_doc.vim
"let g:haddock_browser = "open"
"let g_haddock_browser_callformat = "%s %s"

"options for session.vim
"don't reload help windows
set sessionoptions-=help 
let g:session_autoload='yes'
let g:session_autosave='yes'

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

"nmap <C-j> <C-W>j
"nmap <C-k> <C-W>k
"nmap <C-h> <c-w>h
"nmap <C-l> <c-w>l
" Mappings
map <right> <ESC>:MBEbn<RETURN> " right arrow (normal mode) switches buffers  (excluding minibuf)
map <left> <ESC>:MBEbp<RETURN> " left arrow (normal mode) switches buffers (excluding minibuf)
noremap <C-u> <up>
noremap <C-d> <down>
"map <up> <ESC>:Sex<RETURN><ESC><C-W><C-W> " up arrow (normal mode) brings up a file list
"map <down> <ESC>:Tlist<RETURN> " down arrow  (normal mode) brings up the tag list
map <A-i> i <ESC>r " alt-i (normal mode) inserts a single char, and then switches back to normal
map <F2> <ESC>ggVG:call SuperRetab(2)<left>
map <F8> ggVGg? " encypt the file (toggle)

"When I have all my tabs open for a project, I type :mksession. 
"Then, whenever I return to that dir, I just open vim and hit F3 to load my 'workspace'.

nmap <F3> <ESC>:call LoadSession()<CR>
let s:sessionloaded = 0
function LoadSession()
  source Session.vim
  let s:sessionloaded = 1
endfunction
function SaveSession()
  if s:sessionloaded == 1
    mksession!
  end
endfunction
autocmd VimLeave * call SaveSession()

nmap <A-r>  <ESC>:call RestartVim()<CR>

" Remove trailing whitespace from code files on save
function StripTrailingWhitespace()
  " store current cursor location
  silent exe "normal ma<CR>"
  " store the current search value
  let saved_search = @/
  " delete the whitespace (e means don't warn if pattern not found)
  %s/\s\+$//e
  " restore old cursor location
  silent exe "normal `a<CR>"
  " restore the search value
  let @/ = saved_search
endfunction

au BufWritePre *.c call StripTrailingWhitespace()
au BufWritePre *.cpp call StripTrailingWhitespace()
au BufWritePre *.h call StripTrailingWhitespace()
au BufWritePre *.py call StripTrailingWhitespace()

"add the lines below to your .vimrc file, go into visual mode w/ "v",
"and hit "c" to comment the lines or "u" to uncomment them, this is insanely useful.
"the lines below make this possible for C, C++, Perl, Python, and shell scripts, 
"but it's pretty easy to extend to other languages

" Perl, Python and shell scripts
autocmd BufNewFile,BufRead *.py,*.pl,*.sh vmap u :-1/^#/s///<CR>
autocmd BufNewFile,BufRead *.py,*.pl,*.sh vmap c :-1/^/s//#/<CR>
" C, C++
autocmd BufNewFile,BufRead *.h,*.c,*.cpp vmap u :-1/^\/\//s///<CR>
autocmd BufNewFile,BufRead *.h,*.c,*.cpp vmap s :-1/^/s//\/\//<CR>
" Autocommands
autocmd BufEnter * :syntax sync fromstart " ensure every file does syntax highlighting (full)
au BufNewFile,BufRead *.asp :set ft=aspjscript " all my .asp files ARE jscript
au BufNewFile,BufRead *.tpl :set ft=html " all my .tpl files ARE html
au BufNewFile,BufRead *.hta :set ft=html " all my .tpl files ARE html

"hi scalaNew gui=underline
"hi scalaMethodCall gui=italic
"hi scalaValName gui=underline
"hi scalaVarName gui=underline

