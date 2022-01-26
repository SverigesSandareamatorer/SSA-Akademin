DOCKER_IMAGE_NAME=	ssa-koncept

help:
	@echo 'Makefile för SSA-Akademin                                             '
	@echo '                                                                      '
	@echo 'Användning:                                                           '
	@echo '   make all                    kör alla make mål                      '
	@echo '   make koncept.pdf            bygg koncept.pdf                       '
	@echo '   make koncept.ind            bygg index till koncept                '
	@echo '   make prefix.pdf             bygg prefix.pdf                        '
	@echo '   make clean                  rensa alla byggfiler                   '
	@echo '   make help                   visa den här informationen             '

all:	koncept.pdf
all:	matterep.pdf
all:	emf-handout.pdf
all:	prefix.pdf
all:	ac1.pdf
all:	ac2.pdf

.PHONY:	*.pdf

KONCEPT_CH01_FILES = koncept/chapter1-1.tex koncept/chapter1-2.tex \
	koncept/chapter1-3.tex koncept/chapter1-4.tex \
	koncept/chapter1-5.tex koncept/chapter1-6.tex \
	koncept/chapter1-7.tex koncept/chapter1-8.tex \
	koncept/chapter1-9.tex
KONCEPT_CH02_FILES = koncept/chapter2-1.tex koncept/chapter2-2.tex \
	koncept/chapter2-3.tex koncept/chapter2-4.tex \
	koncept/chapter2-5.tex koncept/chapter2-6.tex \
	koncept/chapter2-7.tex koncept/chapter2-8.tex \
	koncept/chapter2-9.tex koncept/chapter2-10.tex

KONCEPT_CH03_FILES = koncept/chapter3-1.tex koncept/chapter3-2.tex \
	koncept/chapter3-3.tex koncept/chapter3-4.tex \
	koncept/chapter3-5.tex koncept/chapter3-6.tex \
	koncept/chapter3-7.tex koncept/chapter3-8.tex \
	koncept/chapter3-9.tex
KONCEPT_CH04_FILES = koncept/chapter4-1.tex
KONCEPT_CH05_FILES = koncept/chapter5-1.tex koncept/chapter5-2.tex \
	koncept/chapter5-3.tex koncept/chapter5-4.tex \
	koncept/chapter5-5.tex koncept/chapter5-6.tex \
	koncept/chapter5-7.tex koncept/chapter5-8.tex \
	koncept/chapter5-9.tex
KONCEPT_CH06_FILES = koncept/chapter6-1.tex koncept/chapter6-2.tex
KONCEPT_CH07_FILES = koncept/chapter7-1.tex koncept/chapter7-2.tex \
	koncept/chapter7-3.tex koncept/chapter7-4.tex \
	koncept/chapter7-5.tex koncept/chapter7-6.tex
KONCEPT_CH08_FILES = koncept/chapter8-1.tex koncept/chapter8-2.tex \
	koncept/chapter8-3.tex koncept/chapter8-4.tex \
	koncept/chapter8-5.tex koncept/chapter8-6.tex \
	koncept/chapter8-7.tex
KONCEPT_CH09_FILES = koncept/chapter9-1.tex koncept/chapter9-2.tex
KONCEPT_CH10_FILES = koncept/chapter10-1.tex koncept/chapter10-2.tex \
	koncept/chapter10-3.tex koncept/chapter10-4.tex
KONCEPT_CH11_FILES = koncept/chapter11-1.tex
KONCEPT_CH12_FILES = koncept/chapter12-1.tex koncept/chapter12-2.tex \
	koncept/chapter12-3.tex koncept/chapter12-4.tex
KONCEPT_CH13_FILES = koncept/chapter13-1.tex koncept/chapter13-2.tex \
	koncept/chapter13-3.tex koncept/chapter13-4.tex \
	koncept/chapter13-5.tex koncept/chapter13-6.tex
KONCEPT_CH14_FILES = koncept/chapter14-1.tex koncept/chapter14-2.tex \
	koncept/chapter14-3.tex
KONCEPT_CH15_FILES = koncept/chapter15-1.tex
KONCEPT_CH16_FILES = koncept/chapter16-1.tex
KONCEPT_APDX_FILES = koncept/appendix-mattenheter.tex koncept/appendix-matematik.tex \
	koncept/appendix-decibel.tex koncept/appendix-s-enheter.tex \
	koncept/appendix-beskrivningskoder.tex koncept/appendix-iaru-bandplan.tex \
	koncept/appendix-iaru-bandplan2.tex koncept/appendix-frekvensplan.tex \
	koncept/appendix-repeatrar.tex koncept/appendix-rapportkoder.tex \
	koncept/appendix-kunskapskrav.tex
KONCEPT_OTHER_FILES = koncept/common.tex \
	koncept/foreword.tex koncept/introduction.tex \
	koncept/frontpage.tex koncept/tryckort.tex koncept/backpage.tex \
	koncept/matte.tex koncept.bib \
	koncept/koncept-core.tex \
	koncept.tex
KONCEPT_FILES = $(KONCEPT_CH01_FILES) $(KONCEPT_CH02_FILES) \
	$(KONCEPT_CH03_FILES) $(KONCEPT_CH04_FILES) \
	$(KONCEPT_CH05_FILES) $(KONCEPT_CH06_FILES) \
	$(KONCEPT_CH07_FILES) $(KONCEPT_CH08_FILES) \
	$(KONCEPT_CH09_FILES) $(KONCEPT_CH10_FILES) \
	$(KONCEPT_CH11_FILES) $(KONCEPT_CH12_FILES) \
	$(KONCEPT_CH13_FILES) $(KONCEPT_CH14_FILES) \
	$(KONCEPT_CH15_FILES) $(KONCEPT_CH16_FILES) \
	$(KONCEPT_APDX_FILES) $(KONCEPT_OTHER_FILES)

REPO_FILES = SHA.tmp branch.tmp

koncept.aux: koncept.tex $(KONCEPT_FILES)
	- pdflatex koncept.tex
#	- xelatex koncept.tex

koncept.idx: koncept.tex koncept.aux $(KONCEPT_FILES)
	- xelatex koncept.tex

koncept.bbl: koncept.aux koncept.bib
	pdflatex koncept.tex
	bibtex koncept.aux
#	bibtex koncept.aux

koncept.ind: koncept.idx
	makeindex koncept.idx

branch.tmp:
	touch branch.tmp

SHA.tmp:
	touch SHA.tmp

koncept.log:
koncept.pdf: $(REPO_FILES) koncept.aux koncept.bbl koncept.ind koncept.tex $(KONCEPT_FILES)
	pdflatex koncept.tex
	pdflatex koncept.tex
	makeindex koncept.idx
	pdflatex koncept.tex

matterep.pdf: koncept/matte.tex handouts/matterep.tex
	-xelatex handouts/matterep.tex
	xelatex handouts/matterep.tex

emf-handout.idx:
	xelatex handouts/emf-handout.tex

emf-handout.ind: emf-handout.idx
	makeindex emf-handout

emf-handout.pdf: emf-handout.ind handouts/emf-handout.tex koncept/chapter11-1.tex koncept/common.tex
	xelatex handouts/emf-handout.tex

prefix.pdf: handouts/prefix.tex koncept/appendix-n.tex
	xelatex handouts/prefix.tex

iso-jordning.pdf: koncept.bbl handouts/iso-jordning.tex $(KONCEPT_FILES)
	-xelatex handouts/iso-jordning.tex
	xelatex handouts/iso-jordning.tex

koncept.tar.gz: Makefile $(KONCEPT_FILES) matterep.tex
	tar cvzf koncept.tar.gz Makefile $(KONCEPT_FILES) matterep.tex images/*

TODOs:  koncept.tex $(KONCEPT_FILES) koncept.log
	rm -f TODOs.txt
	- grep -n TODO *.tex koncept/*.tex > TODOs.txt
	- grep HAREC koncept.log >> TODOs.txt
	- grep --exclude=koncept/common.tex {rev koncept/*.tex >> TODOs.txt
	- grep Missing koncept.log >> TODOs.txt
	- grep LaTeX koncept.log | grep Warning >> TODOs.txt
	wc -l TODOs.txt

# Länkade bilder
images_linked: koncept.tex $(KONCEPT_FILES)
	grep images ./**/*.tex | sed -e s/.*images/images/ | sed -e s/\}// | sort -u > images_linked.txt

images_available:
	ls images/**/*.pdf | sed -e s/\.pdf// | sort -u > images_available.txt

images_unlinked: images_available images_linked
	diff images_available.txt images_linked.txt | grep \< | sed -e s/\<\ // > images_unlinked.txt

# Genererade bilder
macros/bild_tx_heat.eps: macros/bild_tx_heat.m
	octave macros/bild_tx_heat.m

# Genererade presentationer
ac1.pdf: lectures/ac1.tex
	xelatex lectures/ac1.tex

ac2.pdf: lectures/ac2.tex
	xelatex lectures/ac2.tex

# Optionally build using docker, currently only tested with MacOS and Docker 1.12.3, but
# should work anywhere you can run Docker.
# To build using Docker, run 'make docker-image' first which will take quite some time,
# then run 'make docker-build' which will 'run make' all inside the Docker container.
docker-image:
	docker build -t ${DOCKER_IMAGE_NAME} .

docker-build:
	docker run -ti --rm -v $(shell pwd):/work -w /work ${DOCKER_IMAGE_NAME} make all

clean: SHELL=/bin/bash -O extglob -c
clean:
	-rm -f *.aux *.bbl *.idx *.ind *.lof *.log *.lot *.pdf *.toc *~ *.out !(koncept|ssa-akademin|versionsnummer).png *.ilg *.upa koncept/*.aux koncept/*~ TODOs.txt *.xml
