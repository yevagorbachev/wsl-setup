all:
	latexmk -pdf -shell-escape -halt-on-error {name}.tex
clean:
	latexmk -c
	rm -f *eps-converted-to.pdf
	rm -f **/*eps-converted-to.pdf
