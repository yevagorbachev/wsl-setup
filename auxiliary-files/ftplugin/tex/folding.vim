setlocal foldmethod=expr
setlocal foldexpr=SectionFold(v:lnum)
setlocal foldtext=SectionText(v:foldstart)
setlocal foldcolumn=4

function! SectionFold(lnum)
	let line = getline(a:lnum)
	
	if line =~ '{document}'
		return "0"
	elseif line =~ '\\section'
		return ">1"
	elseif line =~ '\\subsection'
		return ">2"
	elseif line =~ '\\subsubsection'
		return ">3"
	elseif line =~ '\\\(pagebreak\|appendix\)'
		return "0"
	elseif line =~ '{\(equation\|split\)}'
		return "="
	elseif line =~ '\\begin{\w\+}'
	   return "a1"	
	elseif line =~ '\\end{\w\+}'
		return "s1"
	else
		return "="
	endif
endfunction

function! SectionText(lnum)
	return repeat("\t", indent(a:lnum)) . trim(getline(a:lnum))
endfunction

