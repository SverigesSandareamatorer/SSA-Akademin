
all:
	-pdflatex koncept.tex
	pdflatex koncept.tex

clean:
	-rm -f *.aux *.idx *.lof *.log *.lot *.pdf *.toc *~
