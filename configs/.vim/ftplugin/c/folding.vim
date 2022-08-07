setlocal foldmethod=expr
setlocal foldexpr=SectionFold(v:lnum)
setlocal foldtext=SectionText()
setlocal foldcolumn=4

function! SectionFold(lnum)
	let line = getline(a:lnum)
	if line =~ '{.*}'
		return "="
	elseif line =~ '{'
		return "a1"
	elseif line =~ '}'
		return "s1"
	else
		return "="
	endif
endfunction

function! SectionText()
	let snum = v:foldstart
	let enum = v:foldend
	return repeat("\t", indent(snum)) . trim(getline(snum)) . printf(" (%d) ", enum - snum + 1) . trim(getline(enum))
endfunction

