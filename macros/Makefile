all:	bild_tx_heat.pdf

bild_tx_heat.pdf:	bild_tx_heat.tex
	pdflatex bild_tx_heat.tex

bild_tx_heat.tex:	bild_tx_heat.m
	octave bild_tx_heat.m

clean:
	rm -rf bild_tx_heat-inc.pdf bild_tx_heat.tex bild_tx_heat.aux bild_tx_heat.log

