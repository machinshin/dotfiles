set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8
scriptencoding utf-8
set ambiwidth=double
set spell spelllang=en_us
set nospell
syntax on
set foldcolumn=1
set noscrollbind
set nocursorbind
set background=dark
packadd! matchit

let s:running_windows = has('was16') || has('win32') || has('win64')
let s:colorful_term=(&term =~? 'xterm' ) || (&term =~? 'screen')
set cpoptions=aABceFsmq
            " ||||||||+-- When joining lines, leave the cursor between joined lines
            " |||||||+-- When a new match is created (showmatch) pause for .5
            " ||||||+-- Set buffer options when entering the buffer
            " |||||+-- :write command updates current file name automatically add <CR> to the last line when using :@r
            " |||+-- Searching continues at the end of the match at the cursor position
            " ||+-- A backslash has no special meaning in mappings
            " |+-- :write updates alternative file name
            " +-- :read updates alternative file name

set viminfo+=! " make sure it can save viminfo
set iskeyword+=_,$,@,%,#,- " none of these should be word dividers, so make them not be

call plug#begin('~/.vim/bundle') " {{{
	"Plug 'idanarye/vim-merginal'
	"Plug 'scrooloose/syntastic'
	Plug 'AndrewRadev/splitjoin.vim'
	Plug 'Kuniwak/vint'
	Plug 'Shougo/vimproc', 				{ 'do': 'make' }
	"Plug 'Valloric/MatchTagAlways', 	{ 'for': ['html', 'xml', 'xhtml'] }
	Plug 'airblade/vim-gitgutter'
	Plug 'bling/vim-airline'
	Plug 'bling/vim-bufferline'
	Plug 'c9s/perlomni.vim',            { 'for': 'perl' }
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'derekwyatt/vim-scala',        { 'for': 'scala' }
	Plug 'edkolev/erlang-motions.vim',  { 'for': 'erlang' }
	Plug 'elzr/vim-json', 				{ 'for': 'json' }
	Plug 'fatih/vim-go',  				{ 'for': 'go'   }
	"Plug 'flazz/vim-colorschemes'
	Plug 'godlygeek/tabular'
	Plug 'hcs42/vim-erlang-compiler',   { 'for': 'erlang' }
	Plug 'hcs42/vim-erlang-runtime',    { 'for': 'erlang' }
	Plug 'jiangmiao/auto-pairs'
	Plug 'junegunn/fzf', 				{ 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	Plug 'junegunn/vim-emoji'
	Plug 'ludovicchabant/vim-gutentags'
	Plug 'mxw/vim-jsx', 				{ 'for': ['javascript', 'javascript.jsx'] }
	Plug 'pangloss/vim-javascript', 	{ 'for': ['javascript', 'javascript.jsx'] }
	Plug 'powerline/fonts'
	Plug 'scrooloose/nerdcommenter'
	Plug 'semmons99/vim-ruby-matchit',  { 'for': 'ruby' }
	Plug 'tpope/vim-abolish'
	Plug 'tpope/vim-characterize'
	Plug 'tpope/vim-ragtag'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-speeddating'
	Plug 'tpope/vim-surround'
	Plug 'tysontate/HTML-AutoCloseTag', { 'for': ['html', 'xml', 'xhtml'] }
	Plug 'vim-airline/vim-airline-themes'
	Plug 'vim-perl/vim-perl',           { 'for': 'perl' }
	Plug 'vim-scripts/javacomplete',    { 'for': 'java' }
	"Plug 'Yggdroot/indentLine', { 'for': 'java' }
	Plug 'vim-scripts/python_match.vim',{ 'for': 'python' }
    Plug 'junegunn/rainbow_parentheses.vim'
    Plug 'junegunn/vim-peekaboo'  		"shows register contents
    Plug 'mbbill/undotree',             { 'on': 'UndoTreeToggle' }
    Plug 'tmux-plugins/vim-tmux-focus-events'
	Plug '907th/vim-auto-save'
	Plug 'ervandew/supertab'
	Plug 'metakirby5/codi.vim' ", { 'for': ['python', 'javascript', 'haskell', 'ruby', 'ocaml'] }
	Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh', 'for': 'go'}

call plug#end() "}}}
" %%%% CUSTOM FUNCTIONs %%%% "
" HL | Find out syntax group
function! s:hl()
    echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), '/')
endfunction
command! HL call <SID>hl()

" Delete all trailing spaces from lines but keep search buffer in place
function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line('.')
    let c = col('.')
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

function! g:ToggleColorColumn()
    if &colorcolumn != ''
        setlocal colorcolumn&
    else
        setlocal colorcolumn=100
    endif
endfunction

"</ %%%% CUSTOM FUNCTIONs %%%% >"

" Matchparen is confusing in normal mode
augroup insertMatch
    autocmd!
    autocmd BufReadPost * NoMatchParen
    autocmd InsertEnter * DoMatchParen
    autocmd InsertLeave * NoMatchParen
augroup END

let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}'], ['<', '>']]
filetype on " detect the type of file
filetype plugin on " load filetype plugins
filetype plugin indent on
colorscheme machinshin " my theme
let g:rainbow#blacklist = [ 16, 17, 18, 19, 20, 21, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243 ]
"colorscheme dracula
let g:YUNOcommit_after = 30
"show the current command in progress
set showcmd
"automatically save before commands like :next and :make
set autowrite
" set to autoread when a file is changed from teh outside
set autoread
set t_Co=256
"let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
set history=5000 " How many lines of history to remember
set cf " enable error files and error jumping
set clipboard+=unnamed "share windows clipboard
set ffs=unix,mac,dos "support all three, in this order

" Files/Backups
set backup " make backup file
if s:running_windows
	set backupdir=$HOME/_vim/backup " where to put backup file
	set undodir=$HOME/_vim/undo
	set directory=$HOME/_vim/temp " directory is the directory for temp file
	set verbosefile=$HOME/_vim/verbose
	set spellfile=$HOME/_vim/spellfile
else
	set backupdir=$HOME/.vim/backup " where to put backup file
	set undodir=$HOME/.vim/undo
	set directory=$HOME/.vim/temp " directory is the directory for temp file
	set verbosefile=$HOME/.vim/verbose
	set spellfile="$HOME/.vim/spellfile"
endif
set undofile

set updatetime=60000 "save to swap file after 1 minute
set makeef=error.err " When using make, where should it dump the file
set linespace=0 " space it out a little more (easier to read)
"first tab: longest match. list in the statusbar, follow tabs: cycle through matches
set wildmenu
set wildmode=longest:full,full
set wildignore=*/.git,*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.so.*,*.jpg,*.gif,*.png
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.DS_Store,*.tgz,*.gz
set ruler " Always show current positions along the bottom
set matchpairs+=<:>
"set cmdheight=2 " the command bar is 2 high
set relativenumber
set number " turn on line numbers
set hidden " you can change buffer without saving
set backspace=indent,eol,start
set whichwrap+=<,>,h,l,b,s,[,],~  " backspace and cursor keys wrap to
            "  | | | | | | | | +-- "~" Normal
            "  | | | | | | | +-- "]" Insert and Replace
            "  | | | | | | +-- "[" Insert and Replace
            "  | | | | | +-- <Space> Normal and Visual
            "  | | | | +-- <BS> Normal and Visual
            "  | | | +-- "l" Normal and Visual (not recommended)
            "  | | +-- "h" Normal and Visual (not recommended)
            "  | +--  <Right> Normal and Visual
            "  +--  <Left> Normal and Visual
set mouse=a " use mouse everywhere

set linespace=0
set sidescroll=10
set sidescrolloff=10
set shortmess=filmnrwxsWIA
            " |||||||||||+-- don't give the "ATTENTION" message when an existing swap file is found
            " ||||||||||+-- I don't give the intro message when starting Vim |:intro|.
            " |||||||||+-- W don't give "written" or "[w]" when writing a file
            " ||||||||+-- s don't give "search hit BOTTOM, continuing at TOP" or "search hit TOP, continuing at BOTTOM" messages
            " |||||||+-- x use "[dos]" instead of "[dos format]", etc..
            " ||||||+-- w use "[w]" instead of "written" for file write message, etc..
            " |||||+-- r use "[RO]" instead of "[readonly]"
            " ||||+-- n use "[New]" instead of "[New File]"
            " |||+-- m  use "[+]" instead of "[Modified]"
            " ||+-- l use "999L, 888C" instead of "999 lines, 888 characters"
            " |+-- i use "[noeol]" instead of "[Incomplete last line]"
            " +-- f use "(3 of 5)" instead of "(file 3 of 5)"

set report=0 " tell us when anything is changed via :...
set noerrorbells " don't make noise
" make the splitters between windows be blank
set fillchars=vert:\ ,stl:\ ,stlnc:\
" Visual Cues
set showmatch " show matching brackets
set matchtime=7 " how many tenths of a second to blink matching brackets for
set hlsearch " do not highlight searched for phrases
set incsearch " BUT do highlight as you type you search phrase
set formatoptions=rq
" only show listchars in insert mode
if has('multi_byte')
    set listchars=tab:⋯\ ,eol:⋮,trail:⋅,extends:⧽,precedes:⧼ " what to show when I hit :set listchars
else
    set listchars=tab:\|\ ,eol:$,trail:.,extends:>,precedes:< " what to show when I hit :set list
end

set list " turns out, I like listchars -- show chars on end of line, whitespace, etc
set novisualbell " don't blink
set laststatus=2 " always show the status line
" Text Formatting/Layout
set fo=tcrqn " See Help (complex)
set autoindent
set smartindent
set cindent " do c-style indenting
set tabstop=4 " tab spacing (settings below are just to unify it)
set softtabstop=4 " unify
set shiftwidth=4 " unify
set expandtab " real tabs please!
set nowrap " do not wrap lines
set smarttab " use tabs at the start of a line, spaces elsewhere

" Mappings
"turn off *ALL* bells
set vb t_vb=
set ofu=syntaxcomplete#Complete
augroup completions
	autocmd!
    autocmd FileType vim           setlocal keywordprg=:help
    autocmd FileType go            setlocal noexpandtab
    autocmd FileType java          setlocal omnifunc=javacomplete#Complete
    autocmd FileType java          setlocal completefunc=javacomplete#CompleteParamsInfo
    autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python        setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags
	" Restore cursor position
	"autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line('$') | exe 'normal! g`\"' | endif
augroup END

set showmode
set colorcolumn=100

"show at top
let g:ctrlp_match_window_bottom=0
" Tell Ctrl-P to keep the current VIM working directory when starting a
" search, another really stupid non default
"let g:ctrlp_working_path_mode = 0
" Ctrl-P ignore target dirs so VIM doesn't have to!
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/](\.git|log(s)*|node_modules|build|ebin)',
      \ 'file': '\v\.(exe|so|dll|tgz|gz|beam)$',
\ }

let g:ctrlp_cache_dir='$HOME/.vim/ctrlp_cache'
let g:ctrlp_match_window_reverse=0
let g:ctrlp_open_multi = 'i'
let g:ctrlp_match_window_reverse=0
let g:ctrlp_clear_cache_on_exit=1
let g:ctrlp_switch_buffer='Et'
let g:ctrlp_extensions=['mixed']
"Ignore files in .gitignore
let g:ctrlp_user_command = [ '.git', 'cd %s && git ls-files -co --exclude-standard' ]

set foldenable
set foldopen=block,hor,mark,percent,quickfix ",tag "what movements open folds"

augroup sessionstate
	autocmd!
	autocmd BufWinLeave ?* silent mkview
	autocmd BufWinEnter ?* silent loadview
augroup END
" appends /g to all :s//
set gdefault

if $TMUX == ''
    set clipboard+=unnamed
endif
set tags=./tags,~/tags,tags

" highlight trailing whitespace in vim on non empty lines,
" but not while typing in insert mode!
augroup foldstate
	autocmd!
	highlight ExtraWhitespace ctermbg=red guibg=Brown
	autocmd ColorScheme * highlight ExtraWhitespace guibg=red
	autocmd BufEnter * match ExtraWhitespace /\S\zs\s\+$/
	autocmd BufNewFile,BufRead *.yml set filetype=yaml
augroup END
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" {{{
  let g:gutentags_exclude = [
      \ '*.min.js',
      \ '*html*',
      \ 'jquery*.js',
      \ '*/vendor/*',
      \ '*/node_modules/*',
      \ '*/python2.7/*',
      \ '*/migrate/*.rb'
      \ ]
" }}}
set statusline+=%{gutentags#statusline('[Generating...]')}

let g:gutentags_ctags_executable_erlang='vim-erlang-tags/bin/vim-erlang-tags.erl'
let g:airline#extensions#ctrlp#color_template = 'insert' "(default)
"let g:airline#extensions#ctrlp#color_template = 'normal'
"let g:airline#extensions#ctrlp#color_template = 'visual'
"let g:airline#extensions#ctrlp#color_template = 'replace'

let g:airline#extensions#ctrlp#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline#extensions#branch#format = 2
"let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
"* configure the title text for location list buffers
"let g:airline#extensions#quickfix#location_text = 'Location'
" * configure whether to show the previous and next modes (mru, buffer, etc...)
let g:airline#extensions#ctrlp#show_adjacent_modes = 1

let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#bufferline#overwrite_variables = 1
let g:airline_detect_crypt=1
let g:airline_detect_iminsert=1
let g:airline_detect_paste=1
let g:airline_exclude_preview = 1
let g:airline_inactive_collapse=1
let g:airline_theme='distinguished'
"let g:airline_theme='dracula'
"enable/disable showing a summary of changed hunks under source control.
let g:airline#extensions#hunks#enabled = 0
" enable/disable showing only non-zero hunks.
let g:airline#extensions#hunks#non_zero_only = 0
" set hunk count symbols.
"let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']
" configure whether to show the previous and next modes (mru, buffer, etc...)
let g:airline#extensions#ctrlp#show_adjacent_modes = 1

" configure the title text for quickfix buffers >
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'

" configure the title text for location list buffers
let g:airline#extensions#quickfix#location_text = 'Location'

let g:bufferline_show_bufnr = 1
let g:bufferline_echo=0
let g:bufferline_pathshorten=1
let g:bufferline_rotate = 1
let g:bufferline_fixed_index =  0 "always first


" set a nicer cursor in insert mode (from terryma on github)
" Tmux will only forward escape sequences to the terminal if surrounded by
" a DCS sequence
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"""" KEYBOARD SHORTCUTS
let g:maplocalleader='\'
let g:mapleader=','
set pastetoggle=<F2>


noremap <Leader><Leader>cc :set cursorcolumn!<CR> :set cursorline!<CR>
"fast edit of vimrc
noremap <silent> <Leader>v :e! ~/.vimrc<CR>
"quicksave
nmap <silent><Leader>s :w!<cr>
noremap <silent><Leader><Leader>l :call g:ToggleColorColumn()<CR>
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
nnoremap <silent><Leader><Leader>q <ESC>:xa<CR>
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

" align j & k to word-wrapping
nnoremap j gj
nnoremap k gk
let g:ctrlp_map='<Leader><Leader>'
nnoremap <F3> :UndotreeToggle<cr>

" Window resizing mappings
nnoremap <silent> <S-Up> :<c-u>exe "resize " . (winheight(0) + 10)<cr>
nnoremap <silent> <S-Down> :<c-u>exe "resize " . (winheight(0) - 10)<cr>
nnoremap <silent> <S-Left> :<c-u>exe "vertical resize " . (winwidth(0) - 10)<cr>
nnoremap <silent> <S-Right> :<c-u>exe "vertical resize " . (winwidth(0) + 10)<cr>

"maps for foldng
" close all open folds
nnoremap <Leader>f zM<cr>
" open all closed folds
nnoremap <Leader>F zR<cr>
"clear hlsearch results by
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>
" Keep search matches in the middle of the window and pulse the line when moving to them.
nnoremap <Space> ]czzzv
nnoremap <S-Space> [czzzv
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap m ]czzzv
nnoremap M [czzzv
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz
" diff ops, copy to left & copy to right, iirc
nnoremap <Leader>o do<CR>
nnoremap <Leader>P dp<CR>

" no F1 is disabled, screw this going to help shit
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"map Q to last recorded macro
map Q @@
"buffer advance
nnoremap <silent>.n :n<cr>
nnoremap <silent>.p :N<cr>
"really quit vim
nnoremap <silent><Leader><Leader>q :qa<CR>
nnoremap / /\v
vnoremap / /\v

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

" Y to end of line
nnoremap Y y$

nnoremap <silent><Leader>~ :set tildeop!<CR>
if &diff
else
    nnoremap <silent><Leader>of :.Gbrowse! @upstream<CR>
endif

" lets you do ,w! to sudo write the file
nnoremap <Leader>w! :w !sudo tee % >/dev/null<cr>

"delete whitespace
nnoremap <Leader><Leader>dw :call Preserve("%s/\\s\\+$//e")<CR>
"autoindent whole
nnoremap <Leader><Leader>i  :call Preserve("normal gg=G")<CR>

function! s:colors(...)
    return filter(map(filter(split(globpath(&rtp, 'colors/*.vim'), "\n"),
                \ 'v:val !~ "^/usr/"'),
                \ 'fnamemodify(v:val, ":t:r")'),
                \ '!a:0 || stridx(v:val, a:1) >= 0')
endfunction
" ----------------------------------------------------------------------------
" <F5> | Color scheme selector
" ----------------------------------------------------------------------------
function! s:rotate_colors()
    if !exists('s:colors')
        let s:colors = s:colors()
    endif
    let name = remove(s:colors, 0)
    call add(s:colors, name)
    execute 'colorscheme' name
    redraw
    echo name
endfunction
nnoremap <silent><F5> :call <SID>rotate_colors()<cr>

" make space execute the 'q' macro (press qr to start recording, q to stop,
" then [space] to execute.  super convenient)
noremap <C-Space> @q

" Yank text to the OS X clipboard
noremap <Leader>y "*y
noremap <Leader>yy "*Y

" keep selection on indenting in visual mode
vnoremap < <gv
vnoremap > >gv
" map page-up and page-down to ctrl-k & ctrl-j respectively
noremap <S-k> <C-u>
noremap <S-j> <C-d>
"map <silent> <F9> :make %<CR>:copen<CR>

augroup golang
	autocmd!
	let g:go_textobj_enabled=0
	"By default syntax-highlighting for Functions, Methods and Structs is disabled
	" to change it:
	let g:go_highlight_functions = 1
	let g:go_highlight_methods = 1
	let g:go_highlight_structs = 1
	let g:go_highlight_interfaces = 1
	let g:go_highlight_operators = 1
	let g:go_highlight_build_constraints = 1
	" Enable goimports to automatically insert import paths instead of gofmt:
	"let g:go_fmt_command = 'goimports'
	"By default vim-go shows errors for the fmt command, to disable it:
	let g:go_fmt_fail_silently = 1
	"Disable auto fmt on save:
	"let g:go_fmt_autosave = 0
	"Disable opening browser after posting your snippet to play.golang.org:
	let g:go_play_open_browser = 0

	"map <silent> <F9> :make %<CR>:copen<CR>

	autocmd Filetype go noremap <silent><F9> <Plug>(go-run)
	" go specific
	autocmd FileType go nmap <LocalLeader>r <Plug>(go-run)
	"autocmd FileType go nmap <LocalLeader>b <Plug>(go-build)
	autocmd FileType go nmap <LocalLeader>t <Plug>(go-test)
	autocmd FileType go nmap <LocalLeader>c <Plug>(go-coverage)

	"By default the mapping gd is enabled, which opens the target identifier
	"in current buffer. You can also open the definition/declaration, in a
	"new vertical, horizontal, or tab, for the word under your cursor:

	autocmd FileType go nmap <LocalLeader>ds <Plug>(go-def-split)
	autocmd FileType go nmap <LocalLeader>dv <Plug>(go-def-vertical)
	autocmd FileType go nmap <LocalLeader>dt <Plug>(go-def-tab)

	"Open the relevant Godoc for the word under the cursor with
	"<LocalLeader>gd or open it vertically with <LocalLeader>gv

	autocmd FileType go nmap <LocalLeader>gd <Plug>(go-doc)
	autocmd FileType go nmap <LocalLeader>gv <Plug>(go-doc-vertical)
	autocmd FileType go nmap <LocalLeader>gb <Plug>(go-doc-browser)

	"Or open the Godoc in browser
	autocmd FileType go nmap <LocalLeader>gb <Plug>(go-doc-browser)
	"Show a list of interfaces which is implemented by the type under your cursor with <LocalLeader>s
	autocmd FileType go nmap <LocalLeader>s <Plug>(go-implements)

	"Show type info for the word under your cursor
	"with <LocalLeader>i
	"(useful if you have disabled auto showing type info via g:go_auto_type_info)

	autocmd FileType go nmap <LocalLeader>i <Plug>(go-info)
	"Rename the identifier under the cursor to a new name

	autocmd FileType go nmap <LocalLeader>e <Plug>(go-rename)
	"Below are some settings you might find useful.
	"For the full list see :he go-settings.

augroup END

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit'
\ }

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" Default fzf layout
" - down / up / left / right - window (nvim only)
let g:fzf_layout = { 'down': '~30%' }

" git-gutter
" -w => igore whitespace in diff
let g:gitgutter_diff_args = '-w'
" No git Gutter mapppings
let g:gitgutter_map_keys = 0
silent! if emoji#available()
let g:gitgutter_sign_added = emoji#for('white_check_mark')
let g:gitgutter_sign_modified = emoji#for('bangbang')
let g:gitgutter_sign_removed = emoji#for('x')
let g:gitgutter_sign_modified_removed = emoji#for('no_entry')
endif

" Airline
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#symbol = '!'
let g:airline#extensions#whitespace#show_message = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#csv#enabled = 1
" change how columns are displayed.
let g:airline#extensions#csv#column_display = 'Name'
" Note: You must define the dictionary first before setting values. Also, it's a
"good idea to check whether it exists as to avoid accidentally overwriting
"its contents.

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

"The following are some unicode symbols for customizing the left/right
" separators, as well as the powerline font glyphs.
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

augroup javascript
    let g:javascript_conceal_function       = "ƒ"
    let g:javascript_conceal_null           = "ø"
    let g:javascript_conceal_this           = "@"
    let g:javascript_conceal_return         = "⇚"
    let g:javascript_conceal_undefined      = "¿"
    let g:javascript_conceal_NaN            = "ℕ"
    let g:javascript_conceal_prototype      = "¶"
    let g:javascript_conceal_static         = "•"
    let g:javascript_conceal_super          = "Ω"
    let g:javascript_conceal_arrow_function = "⇒"
augroup END

