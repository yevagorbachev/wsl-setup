setlocal foldmethod=expr
setlocal foldexpr=SectionFold(v:lnum)
setlocal foldtext=SectionText(v:foldstart)
setlocal foldcolumn=4

function! SectionFold(lnum)
	let line = getline(a:lnum)
	
	if match(line, '\\section') > -1
		return ">1"
	elseif match(line, '\\subsection') > -1
		return ">2"
	elseif match(line, '\\subsubsection') > -1
		return ">3"
	elseif match(line, '\\\(pagebreak\|appendix\)') > -1
		return "0"
	elseif match(line, '{\(document\|equation\|split\)}') > -1
		return "="
	elseif match(line, '\\begin{\w\+}') > -1
		return "a1"
	elseif match(line, '\\end{\w\+}') > -1
		return "s1"
	else
		return "="
	endif
endfunction

function! SectionText(lnum)
	return repeat("\t", indent(a:lnum)) . trim(getline(a:lnum))
endfunction

