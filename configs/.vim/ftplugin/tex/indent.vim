setlocal autoindent
setlocal indentexpr=TeXIndent(v:lnum)

function! TeXIndent(lnum)
	if a:lnum == 0
		return 0
	endif

	let prev = getline(a:lnum - 1)
	let line = getline(a:lnum)
	
	" sections have hardcoded indentation; environments are always subordinate to sections
	if prev =~ '{document}'
		return 0
	elseif prev =~ '^\s*\\section'
		return 1
	elseif prev =~ '^\s*\\subsection'
		return 2
	elseif prev =~ '^\s*\\subsubsection'
		return 3
	elseif prev =~ '^\s*\\paragraph'
		return 4
	" environment indentation
	elseif prev =~ '\\begin'
		return indent(a:lnum - 1) + 1 " increase indentation by 1 if previous line has \begin
	elseif line =~ '\\end'
		return indent(a:lnum - 1) - 1 " decrease indentation by 1 if line has \end
	else
		return indent(a:lnum - 1) " use previous indentation
	endif
endfunction
