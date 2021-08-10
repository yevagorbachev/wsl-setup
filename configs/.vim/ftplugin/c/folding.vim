setlocal foldmethod=expr
setlocal foldexpr=SectionFold(v:lnum)
setlocal foldtext=SectionText(v:foldstart)
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

function! SectionText(lnum)
	return repeat("\t", indent(a:lnum)) . trim(getline(a:lnum))
endfunction

