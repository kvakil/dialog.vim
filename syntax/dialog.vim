" Vim syntax file
" " Language: Dialog Interactive Fiction
" " Maintainer: Keyhan Vakil
" " Latest Revision: 27 June 2021
"
if exists("b:current_syntax")
  finish
endif
let b:current_syntax = "dialog"

syn match dialogId '\v#\w+'
syn match dialogVar '\v\$\w*'
syn keyword dialogTodo contained TODO FIXME XXX NOTE
syn match dialogComment "\v\%\%.*$" contains=dialogTodo
syn match dialogIf '(if)'
syn match dialogElseIf '(elseif)'
syn match dialogElse '(else)'
syn match dialogEndIf '(endif)'
syn match dialogThen '(then)'
syn match dialogSelect '(select)'
syn match dialogOr '(or)'
syn match dialogStopping '(stopping)'

syn match dialogCycling '(cycling)'
syn match dialogAtRandom '(at random)'
syn match dialogPurelyAtRandom '(purely at random)'
syn match dialogThenAtRandom '(then at random)'
syn match dialogThenPurelyAtRandom '(then purely at random)'

setlocal foldmethod=expr
setlocal foldexpr=GetDialogFold(v:lnum)
function! GetDialogFold(lnum)
	if getline(v:lnum)[0] == "#"
		return '>2'
	endif
	let h = matchstr(getline(v:lnum), '^%%%\+')
	if empty(h)
		return "="
	else
		return ">1"
	endif
endfunction

hi def link dialogTodo Todo
hi def link dialogComment Comment
hi def link dialogId Tag
hi def link dialogVar Identifier
hi def link dialogIf Conditional
hi def link dialogElseIf Conditional
hi def link dialogElse Conditional
hi def link dialogEndIf Conditional
hi def link dialogThen Conditional
hi def link dialogSelect Conditional
hi def link dialogOr Label
hi def link dialogStopping Conditional
hi def link dialogCycling Conditional
hi def link dialogAtRandom Conditional
hi def link dialogPurelyAtRandom Conditional
hi def link dialogThenAtRandom Conditional
hi def link dialogThenPurelyAtRandom Conditional

