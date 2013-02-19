" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:		Srivatsan Raghavan - vat.raghavan@gmail.com
" Last Change:	12/24/2012

set background=light
hi clear
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
	hi Normal guifg=black guibg=white
	hi Comment term=standout ctermfg=gray gui=bold guifg=gray
	hi Constant term=underline ctermfg=Magenta guifg=Magenta
	hi String  gui=NONE   guifg=#ffcd8b   guibg=#404040
	hi Character gui=NONE   guifg=#ffcd8b   guibg=#404040
	hi Special term=bold ctermfg=Magenta guifg=Magenta
	hi Identifier guifg=Red
	"hi Conditional gui=none guifg= guifg=
	hi Statement term=none ctermfg=131 gui=bold guifg=#ff0000
	hi PreProc gui=NONE   guifg=#409090   guibg=NONE
	"hi Type           gui=NONE   guifg=#ff8bff   guibg=NONE
	hi Type gui=NONE guifg=Blue
	hi Visual term=reverse ctermfg=Yellow ctermbg=Red gui=NONE guifg=Black guibg=Yellow
	hi Search term=reverse ctermfg=Black ctermbg=Cyan gui=NONE guifg   = Black guibg = Cyan
	hi Tag term=bold ctermfg=DarkGreen guifg=DarkGreen
	hi Error term=reverse guibg=Red guifg=White
	hi Todo term=standout ctermbg=Yellow ctermfg=Black guifg=Blue guibg=Yellow
	hi StatusLine term=bold,reverse cterm=NONE ctermfg=Yellow ctermbg=DarkGray gui=NONE guifg=Yellow guibg=DarkGray
	hi Pmenu ctermfg=DarkGreen ctermbg=Black
	hi PmenuSel ctermfg=Red ctermbg=White
	hi PmenuSbar ctermfg=White ctermbg=DarkBlue
	hi PmenuThumb ctermfg=LightGray ctermbg=Black
	hi CursorLine ctermbg=red ctermfg=white cterm=undercurl,bold
	hi CursorColumn ctermbg=red ctermfg=yellow
	hi ColorColumn ctermbg=red ctermfg=yellow
	hi Folded ctermfg=Yellow ctermbg=Black cterm=bold,undercurl
	hi MatchParen   gui=NONE      guifg=#cfbfad   guibg=#4e4e8f
	"hi Conditional gui= guifg= guibg=
else
	hi Comment term=standout ctermfg=gray gui=bold guifg=gray
	hi Constant term=underline ctermfg=Magenta guifg=Magenta
	exec "hi String cterm=NONE   ctermfg=" . <SID>X(73) . " ctermbg=" . <SID>X(81)
	exec "hi PreProc cterm=NONE   ctermfg=" . <SID>X(127) . " ctermbg=" . <SID>X(0)
	"exec "hi Conditional cterm=NONE ctermbg=" . <SID>X(40) . "ctermfg=" . <SID>X(0)
	exec "hi Character  cterm=NONE   ctermfg=" . <SID>X(73) . " ctermbg=" . <SID>X(81)
	call s:hibg("Visual"    ,"#555577","LightBlue",83)
	call s:hibg("VisualNOS" ,"#444444","DarkBlue",81)
	call s:hibg("MatchParen","#1100AA","DarkBlue",18)

	hi Special term=bold ctermfg=Magenta guifg=Magenta
	call s:hifg("Identifier"     ,"#FFCC00","Yellow",72) " 220
	"hi Identifier ctermfg=Red
	"hi Type term=None ctermfg=Blue gui=NONE guifg=Blue
	"exec "hi Type cterm=NONE ctermfg=" . <SID>X(250) . " ctermbg=" . <SID>X(81)
	call s:hifg("Type"           ,"#AAAA77","Grey",57) " 101

	call s:hifg("Statement"      ,"#FF6600","Brown",68) " 202
"	hi Statement term=none ctermfg=131 ctermbg=NONE
	hi Visual term=reverse ctermfg=Yellow ctermbg=Red 
	hi Search term=reverse ctermfg=Black ctermbg=Cyan 
	hi Tag term=bold ctermfg=DarkGreen 
	"hi Error term=none ctermfg=215 ctermbg=9 
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

