set nocompatible
scriptencoding utf-8
filetype off
filetype plugin off
filetype plugin indent off
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
Bundle 'xolox/vim-notes'
Bundle 'scrooloose/nerdtree'
Bundle 'spiiph/vim-space'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-commentary'
Bundle 'tsaleh/vim-align'
Bundle 'scrooloose/nerdcommenter'
Bundle 'sjl/splice.vim'
Bundle 'scrooloose/syntastic'
Bundle 'Shougo/vimproc'
"neocomplecache should use 'master' snipmate :/ 
Bundle 'Shougo/neocomplcache-snippets-complete'
Bundle 'Shougo/neocomplcache'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/snipmate-snippets'
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
Bundle 'Rip-Rip/clang_complete'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tehmaze/profont-powerline'
Bundle 'tmhedberg/matchit'
Bundle 'vim-scripts/python_match.vim'
Bundle 'semmons99/vim-ruby-matchit'
Bundle 'tysontate/HTML-AutoCloseTag'

"##############################################################
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_fuzzy_completion=1
let g:neocomplcache_enable_underbar_completion=1
let g:neocomplcache_max_menu_width=25
let g:neocomplcache_temporary_dir='~/.vim/neocon/'
let g:neocomplcache_enable_auto_select=1
filetype on " detect the type of file
filetype plugin on " load filetype plugins
filetype plugin indent on
"syntax on " syntax highlighting on
syntax off" syntax highlighting on
"colorscheme machinshin " my theme
let g:Powerline_symbols='fancy'
"show the current command in progress
set showcmd
" set to autoread when a file is changed from teh outside
set autoread
set t_Co=256
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' } 
set history=5000 " How many lines of history to remember
set cf " enable error files and error jumping
set clipboard+=unnamed "turns out I do like is sharing windows clipboard
set ffs=unix,mac,dos "support all three, in this order

" Files/Backups
set backup " make backup file
set backupdir=~/.vim/backup " where to put backup file
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

set updatetime=180 "save to swap file after 3 minutes
set directory=~/.vim/temp " directory is the directory for temp file
set makeef=error.err " When using make, where should it dump the file
set lsp=0 " space it out a little more (easier to read)
"first tab: longest match. list in the statusbar, follow tabs: cycle through matches
set wildmenu
set wildmode=longest:full,full
set ruler " Always show current positions along the bottom
"set cmdheight=2 " the command bar is 2 high
set number " turn on line numbers
set hid " you can change buffer without saving
set backspace=2 " make backspace work normal
set whichwrap+=<,>,h,l,b,s,[,]  " backspace and cursor keys wrap to
set mouse=a " use mouse everywhere
"set shortmess=atI 
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
"only show listchars in insert mode
"if has("multi_byte")
"	set listchars=tab:▻\ ,eol:⌙,trail:⦁,extends:⧽,precedes:⧼,nbsp:. " what to show when I hit :set listchars
"else 
	set listchars=tab:\|\ ,eol:$,trail:.,extends:>,precedes:<" what to show when I hit :set list
"end 

set list " turns out, I like listchars -- show chars on end of line, whitespace, etc
"set lines=80 " 80 lines tall
"set columns=160 " 160 cols wide
"set so=10 " Keep 10 lines (top/bottom) for scope
set novisualbell " don't blink
"set statusline=%F%m%r%h%w\ [FM=%{&ff}]\ [TYPE=%Y]\ [ASC=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
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
set noexpandtab " real tabs please!
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
map <F8> ggVGg? " encypt the file (toggle)
nmap <A-r>  <ESC>:call RestartVim()<CR>

"press F5 to get a list of buffers and goto a the selected buffer
nnoremap <F5> :buffers<CR>:sbuffer<Space>
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
let g:snips_author = 'Srivatsan (Vat) Raghavan ( srivatsan.raghavan@etrade.com ) '

let g:notes_directory='~/.notes/'
let g:notes_suffix='.txt'
"disable autoindent before pasting. 
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

function! PasterToggle()
	let w:check_paste_status =exists('w:check_paste_status') ? !w:check_paste_status : 1
	"echo "paster toggle " &w:check_paste_status
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
colorscheme machinshin
nnoremap <silent><Leader>3 :call DoChighlight()<CR>
"change leader
"quicksave
nmap <Leader>s :w!<cr>
"fast edit of vimrc
map <silent> <Leader><F2> :e! ~/.vimrc<cr>
map <silent> <Leader>cc :set cursorcolumn!<cr> :set cursorline!<cr>

function! g:ToggleColorColumn()
	if &colorcolumn != ''
		setlocal colorcolumn&
	else
		setlocal colorcolumn=80
	endif
endfunction
noremap <silent><Leader>co :call g:ToggleColorColumn()<CR>


" Window resizing mappings /*{{{*/
nnoremap <silent> <S-Up> :normal <c-r>=Resize('+')<CR><CR>
nnoremap <silent> <S-Down> :normal <c-r>=Resize('-')<CR><CR>
nnoremap <silent> <S-Left> :normal <c-r>=Resize('>')<CR><CR>
nnoremap <silent> <S-Right> :normal <c-r>=Resize('<')<CR><CR>
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

let NERDTreeDirArrows=0
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
let NERDTreeShowBookmarks=1

"toggle open nerdtree
nnoremap <silent> <Leader><Leader>n :NERDTreeToggle<CR>

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
set foldlevelstart=20
set foldlevel=20
"maps for foldng
" close all open folds
map <Leader>f <cr>zM<cr>
" open all closed folds
map <Leader>F <cr>zR<cr>

" remember folding state
au BufWinLeave * silent mkview
au BufWinEnter * silent loadview
"indent xml properly
function! DoPrettyXML()
		1,$!xmllint --format --recover -
endfunction
command! PrettyXML call DoPrettyXML()
"clear hlsearch results by typing ,,c
nnoremap <silent> <Leader><Leader>c :nohlsearch<CR>

" append newline in insert mode
"imap <f3> <esc>o
" prepend newline in insert mode
"imap <f4> <esc>O
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
nnoremap <Leader>p do<CR>
nnoremap <Leader>P dp<CR>

" Show syntax highlighting groups for word under cursor

nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

let g:AutoClosePairs_add="<> | '"
let java_highlight_debug=1
let java_highlight_all=1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
" jump to start & end of line using home-row keys
map H ^
map L $
" tabbing selected section
vmap <Tab> >gv
vmap <Tab> >gv
"map Q to last recorded macro
map Q @@
nnoremap <silent>.n :n<cr>
nnoremap <silent>.p :N<cr>
nnoremap <silent><Leader><Leader>q :qa<CR>
nnoremap / /\v
vnoremap / /\v
set gdefault
"traverse help docs easier
nnoremap <buffer> <CR> <C-]>
nnoremap <buffer> <BS> <C-T>
nnoremap <buffer> o /'\l\{2,\}'<CR>
nnoremap <buffer> O ?'\l\{2,\}'<CR>
nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>
nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>
"run maven
function! RunMavenInSrcDir()
	let src_dir = finddir('src', ';')
	src_dir = fnamemodify(src_dir, ':p:h')
	exec 'cd' fnameescape(src_dir)
	!mvn clean install -Dmaven.test.skip=true
	cd -
endfunction
map <F6> :call RunMavenInSrcDir()<CR>
"save on focuslost
"au FocusLost * :wa
" visually select everything between 2 %'s'
noremap <Leader>% v%
"scroll screen on brace highlight
inoremap } }<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
inoremap ] ]<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
inoremap ) )<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a

" Tabularize {
if exists(":Tabularize")
	nmap <Leader>a= :Tabularize /=<CR>
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
" Y to end of line 
nnoremap Y y$

imap ,, <C-X><CR>
imap .. <C-X><Space>
let g:ragtag_global_maps = 1
" both syntax-based folds & manual folds on top
" this isn't currently working?!?
augroup vimrc
  au BufReadPre * setlocal foldmethod=syntax
  au BufWinEnter * if &fdm == 'syntax' | setlocal foldmethod=manual | endif
augroup END

