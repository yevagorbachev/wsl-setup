setlocal foldmethod=expr
setlocal foldexpr=MatlabFold(v:lnum)
setlocal foldtext=MatlabFoldText()
setlocal foldcolumn=4

function! MatlabFold(lnum)
	let line = getline(a:lnum)

	if (line =~ "^%{")
		return 1
	elseif (line =~ "^%}")
		return 0
	if (line =~ "^function")
		return "1"
	elseif (line =~ "^end")
		return "0"
	else
		return "="
	endif
endfunction

function! MatlabFoldText()
	let snum = v:foldstart
	let enum = v:foldend

	return repeat("\t", indent(snum)) . trim(getline(snum)) . printf(" (%d lines) ", enum - snum + 1) . trim(getline(enum))
endfunction
