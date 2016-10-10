# Builds the LaTeX project as a PDF document

TEXFILE=main.tex
PDFFILE=$(TEXFILE:%.tex=%.pdf)

%.pdf: %.tex 
	@if [ ! -e $(@:%.pdf=%.aux) ]; then \
	 pdflatex $(@:%.pdf=%.tex); \
	 fi
	@if [ -e references.bib ]; then \
	 bibtex $(@:%.pdf=%); \
	 pdflatex $(@:%.pdf=%.tex); \
	fi
	pdflatex $(@:%.pdf=%.tex)
	pdflatex $(@:%.pdf=%.tex)
	pdflatex $(@:%.pdf=%.tex)

all: $(PDFFILE)

.PHONY: clean

clean:
	@rm -vf $(shell find . -name "*~")
	@rm -vf *.log *.lot *.lof *.loa *.toc *.idx *.inc *.ilg *.ind *.bbl *.blg
	@rm -vf *.aux *.glo *.dvi *.ps *.out *.brf
	@rm -vf *.nav *.snm
	@rm -vf main.pdf
