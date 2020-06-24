setlocal foldmethod=expr
setlocal foldexpr=SectionFold(v:lnum)
setlocal foldtext=SectionText(v:foldstart)
setlocal foldcolumn=4

function! SectionFold(lnum)
	let line = getline(a:lnum)
	
	if line =~ '\{document\}|\\pagebreak'
		return 0
	elseif line =~ '^\s*\\section'
		return ">1"
	elseif line =~ '^\s*\\subsection'
		return ">2"
	elseif line =~ '^\s*\\subsubsection'
		return ">3"
	elseif line =~ '^\s*\\paragraph'
		return ">4"
	else
		return "="
	endif

endfunction

function! Tab()
	return "\t"
endfunction


function! SectionText(lnum)
	return repeat("\t", indent(a:lnum)) . getline(a:lnum)
endfunction

