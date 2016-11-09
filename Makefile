
all:
	-pdflatex koncept.tex
	pdflatex koncept.tex

clean:
	-rm *.aux *.idx *.lof *.log *.lot *.pdf *.toc *~
