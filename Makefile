DOCKER_IMAGE_NAME=	ssa-koncept

help:
	@echo 'Makefile för SSA-Akademin                                             '
	@echo '                                                                      '
	@echo 'Användning:                                                           '
	@echo '   make all                    kör alla make mål                      '
	@echo '   make koncept.pdf            bygg PDF av KonCEPT                    '
	@echo '   make koncept.epub           bygg EPUB av KonCEPT                   '
	@echo '   make clean                  rensa alla byggfiler                   '
	@echo '   make help                   visa den här informationen             '

all:	koncept.pdf koncept.epub

.PHONY: all koncept.pdf koncept.epub clean help

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
KONCEPT_APDX_FILES = koncept/appendix-bandplaner.tex koncept/appendix-beskrivningskoder.tex \
	koncept/appendix-decibel.tex koncept/appendix-frekvensplan.tex \
	koncept/appendix-iaru-bandplan.tex koncept/appendix-iaru-bandplan2.tex  \
	koncept/appendix-kunskapskrav.tex koncept/appendix-lashanvisningar.tex \
	koncept/appendix-litteratur.tex koncept/appendix-matematik.tex \
	koncept/appendix-mattenheter.tex koncept/appendix-prefixomvandling.tex \
	koncept/appendix-rapportkoder.tex koncept/appendix-repeatrar.tex \
	koncept/appendix-s-enheter.tex
KONCEPT_OTHER_FILES = koncept/foreword.tex koncept/introduction.tex \
	koncept/frontpage.tex koncept/tryckort.tex koncept/backpage.tex \
	koncept/matte.tex koncept.bib \
	koncept/inkludera-kapitel.tex koncept/inkludera-appendix.tex \
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

branch.tmp:
	touch branch.tmp

SHA.tmp:
	touch SHA.tmp

koncept.log:
koncept.pdf: $(REPO_FILES) koncept.tex $(KONCEPT_FILES)
	latexmk -pdf koncept.tex

koncept.epub: $(REPO_FILES) koncept.tex $(KONCEPT_FILES)
	ebb -x images/**/*
	tex4ebook --loglevel debug --format epub3 --tidy koncept.tex "mathml"

koncept.tar.gz: Makefile $(KONCEPT_FILES)
	tar cvzf koncept.tar.gz Makefile $(KONCEPT_FILES) images/*

TODOs:  koncept.tex $(KONCEPT_FILES) koncept.log
	rm -f TODOs.txt
	- grep -Fn TODO *.tex koncept/*.tex > TODOs.txt
	- grep -F HAREC koncept.log >> TODOs.txt
	- grep -F {rev koncept/*.tex >> TODOs.txt
	- grep -F Missing koncept.log >> TODOs.txt
	- grep -F LaTeX koncept.log | grep -F Warning >> TODOs.txt

# Skapar en rapport med länkade bilder.
images_linked: koncept.tex $(KONCEPT_FILES)
	grep -F images ./**/*.tex | sed -e s/.*images/images/ | sed -e s/\}// | sort -u > images_linked.txt

images_available:
	ls images/**/*.pdf | sed -e s/\.pdf// | sort -u > images_available.txt

images_unlinked: images_available images_linked
	diff images_available.txt images_linked.txt | grep \< | sed -e s/\<\ // > images_unlinked.txt

# Skapar en rapport med kodrader som är längre än 80 tecken.
long_lines: $(KONCEPT_FILES)
	grep '.\{81\}' koncept/*.tex > long_lines.txt

# Skapar en rapport med kodrader som bara är kommentar.
comment_lines: $(KONCEPT_FILES)
	grep '^ *%' koncept/*.tex > comment_lines.txt

# Genererade bilder
macros/bild_tx_heat.eps: macros/bild_tx_heat.m
	octave macros/bild_tx_heat.m

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
