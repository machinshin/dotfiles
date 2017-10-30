" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:       Vat Raghavan - vat.raghavan@gmail.com
" Last Change:      Sept 28, 2016

set background=dark
highlight clear
if exists("syntax_on")
	syntax reset
endif

let g:colors_name       = "machinshin"

" map a urxvt cube number to an xterm-256 cube number
fun! <SID>M(a)
	return strpart("0135", a:a, 1) + 0
endfun

" map a urxvt colour to an xterm-256 colour
fun! <SID>X(a)
	if &t_Co == 88
		return a:a
	else
		if a:a == 8
			return 237
		elseif a:a < 16
			return a:a
		elseif a:a > 79
			return 232 + (3 * (a:a - 80))
		else
			let l:b = a:a - 16
			let l:x = l:b % 4
			let l:y = (l:b / 4) % 4
			let l:z = (l:b / 16)
			return 16 + <SID>M(l:x) + (6 * <SID>M(l:y)) + (36 * <SID>M(l:z))
		endif
	endif
endfun

function! E2T(a)
	return s:X(a:a)
endfunction

function! s:choose(mediocre,good)
	if &t_Co != 88 && &t_Co != 256
		return a:mediocre
	else
		return s:X(a:good)
	endif
endfunction

function! s:hifg(group,guifg,first,second,...)
	if a:0 && &t_Co == 256
		let ctermfg = a:1
	else
		let ctermfg = s:choose(a:first,a:second)
	endif
	exe "highlight ".a:group." guifg=".a:guifg." ctermfg=".ctermfg
endfunction

function! s:hibg(group,guibg,first,second)
	let ctermbg = s:choose(a:first,a:second)
	exe "highlight ".a:group." guibg=".a:guibg." ctermbg=".ctermbg
endfunction

if has("gui_running")
	hi Normal guifg=#17e600 guibg=Black
	hi Comment term=standout ctermfg=gray guifg=gray
	hi Constant term=underline ctermfg=Magenta guifg=Magenta
	hi Pmenu guifg=DarkGreen guibg=Black ctermfg=DarkGreen ctermbg=Black
	hi PmenuSel guifg=Red guibg=White ctermfg=Red ctermbg=White
	hi PmenuSbar guifg=White guibg=DarkBlue ctermfg=White ctermbg=DarkBlue
	hi PmenuThumb guifg=LightGray guibg=Black ctermfg=LightGray ctermbg=Black
	hi Tag guifg=DarkGreen term=bold ctermfg=DarkGreen
	hi Todo guifg=Black guibg=Yellow term=standout ctermbg=Yellow ctermfg=Black
	hi Visual guifg=Yellow guibg=Red term=reverse ctermfg=Yellow ctermbg=Red
	hi Search guifg=Black guibg=Cyan term=reverse ctermfg=Black ctermbg=Cyan
	hi StatusLine gui=reverse guifg=Yellow guibg=DarkGray term=reverse cterm=NONE ctermfg=Yellow ctermbg=DarkGray
	hi Folded  gui=undercurl guifg=Yellow guibg=Black  ctermfg=Yellow ctermbg=Black cterm=bold,undercurl
	hi Character guifg=#FEAE5E guibg=#262626
	hi String guifg=#FEAE5E guibg=#262626
	hi PreProc guifg=#c0e8fc
	hi Special term=bold ctermfg=Magenta guifg=Magenta
	hi VisualNOS guifg=#444444
	hi MatchParen guifg=#1100AA
	hi ColorColumn guibg=#333333
	hi CursorLine guibg=#333333
	hi CursorColumn guibg=#333333
	hi Identifier guifg=#87d7d8
	hi Type guifg=#f5f52c gui=NONE
	hi Statement guifg=#FF8636 gui=NONE
	hi DiffAdd gui=bold guifg=Black  guibg=#262626
	hi DiffChange gui=bold guifg=Yellow guibg=#262626
	hi DiffText gui=undercurl guifg=#FEAE5E guibg=#262626
	hi DiffDelete guifg=Black  guibg=#262626
	hi NonText guifg=#353E3F
	hi SpecialKey guifg=#353E3F
else
	hi Comment term=standout ctermfg=gray gui=bold guifg=gray
	hi Constant term=underline ctermfg=Magenta guifg=Magenta
	exec "hi String cterm=NONE   ctermfg=" . <SID>X(73) . " ctermbg=" . <SID>X(81)
	exec "hi PreProc cterm=NONE   ctermfg=" . <SID>X(127) . " ctermbg=" . <SID>X(0)
	exec "hi Character  cterm=NONE   ctermfg=" . <SID>X(73) . " ctermbg=" . <SID>X(81)
	call s:hibg("Visual"    ,"#555577","LightBlue",83)
	call s:hibg("VisualNOS" ,"#444444","DarkBlue",81)
	call s:hibg("MatchParen","#1100AA","DarkBlue",18)
	hi Special term=bold ctermfg=Magenta guifg=Magenta
	call s:hifg("Identifier"     ,"#FFCC00","Yellow",72) " 220
	call s:hifg("Type"           ,"#AAAA77","Grey",57) " 101
	call s:hifg("Statement"      ,"#FF6600","Brown",68) " 202
	hi Visual term=reverse ctermfg=Yellow ctermbg=Red
	hi Search term=reverse ctermfg=Black ctermbg=Cyan
	hi Tag term=bold ctermfg=DarkGreen
	hi Todo term=standout ctermbg=Yellow ctermfg=Black
	hi StatusLine term=bold,reverse cterm=NONE ctermfg=Yellow ctermbg=DarkGray
	hi Pmenu ctermfg=DarkGreen ctermbg=Black
	hi PmenuSel ctermfg=Red ctermbg=White
	hi PmenuSbar ctermfg=White ctermbg=DarkBlue
	hi PmenuThumb ctermfg=LightGray ctermbg=Black
	call s:hibg("ColorColumn","#333333","DarkGrey",81)
	call s:hibg("CursorLine","#333333","DarkGrey",81)
	call s:hibg("CursorColumn","#333333","DarkGrey",81)
	hi Folded ctermfg=Yellow ctermbg=Black cterm=bold,undercurl
	hi DiffAdd ctermfg=Black ctermbg=Yellow cterm=bold,undercurl
	exec "hi DiffAdd cterm=bold   ctermfg=" . <SID>X(127) . " ctermbg=" . <SID>X(81)
	exec "hi DiffChange cterm=bold   ctermfg=Yellow  ctermbg=" . <SID>X(81)
	exec "hi DiffText cterm=undercurl ctermfg=" . <SID>X(73) . " ctermbg=" . <SID>X(81)
	exec "hi DiffDelete cterm=none ctermfg=Black ctermbg=" . <SID>X(81)
	"highlight for whitespace chars
	exec "hi NonText ctermfg=" . <SID>X(80)
	exec "hi SpecialKey ctermfg=" . <SID>X(80)
endif

hi! link MoreMsg Comment
hi! link ErrorMsg Visual
hi! link WarningMsg ErrorMsg
hi! link Question Comment
hi link String	Constant
hi link Character Constant
hi link Number	Constant
hi link Boolean	Constant
hi link Float		Number
hi link Function	Identifier
hi link Conditional	Statement
hi link Repeat	Statement
hi link Label		Statement
hi link Operator	Statement
hi link Keyword	Statement
hi link Exception	Statement
hi link Include	PreProc
hi link Define	PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef	Type
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment Special
hi link Debug		Special
hi IndentGuidesOdd ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
" vertical line indentation
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'
