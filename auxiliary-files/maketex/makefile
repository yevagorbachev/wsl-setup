ifndef $(target)
        target = {name}
endif

all:
	latexmk -pdf -halt-on-error {name}.tex
	cp {name}.pdf $(target).pdf
clean:
	rm -f *.aux
	rm -f *.dvi
	rm -f *.fdb_latexmk
	rm -f *.fls
	rm -f *.log
	rm -f *.toc
