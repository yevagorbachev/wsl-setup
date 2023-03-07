setlocal foldmethod=expr
setlocal foldexpr=MatlabFold(v:lnum)
setlocal foldtext=MatlabFoldText()
setlocal foldcolumn=4

function! MatlabFold(lnum)
	let line = getline(a:lnum)
	let start_r = "^\s*\(function\|if\|for\|else\)"
	let end_r = "^\s*end"

	if (line =~ start_r)
		return "a1"
	elseif (line =~ end_r)
		return "s1"
	else
		return "="
	endif
endfunction

function! MatlabFoldText()
	let snum = v:foldstart
	let enum = v:foldend

	return repeat("\t", indent(snum)) . trim(getline(snum)) . printf(" (%d lines) ", enum - snum + 1) . trim(getline(enum))
endfunction
