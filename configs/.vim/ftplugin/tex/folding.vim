setlocal foldmethod=expr
setlocal foldexpr=SectionFold(v:lnum)
setlocal foldtext=SectionText()
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
	elseif (line =~ '\\begin' && line !~ '\\end')
	   return "a1"	
	elseif (line =~ '\\end' && line !~ '\\begin')
		return "s1"
	else
		return "="
	endif
endfunction

function! CountOccurences(line, char)
	return count(str2list(a:line), char2nr(a:char))
endfunction

function! SectionText()
	let snum = v:foldstart
	let enum = v:foldend
	return repeat("\t", indent(snum)) . trim(getline(snum)) . printf(" (%d lines) ", enum - snum + 1) . trim(getline(enum))
endfunction

