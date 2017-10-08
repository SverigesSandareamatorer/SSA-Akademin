DOCKER_IMAGE_NAME=	ssa-koncept

all:	koncept.pdf TODOs
#all:	matterep.pdf
#all:	koncept-alpha.pdf
#all:	koncept-larobok.pdf
#all:	koncept-refbok.pdf

.PHONY:	*.pdf

KONCEPT_CH1_FILES = koncept/chapter1-1.tex koncept/chapter1-2.tex \
	koncept/chapter1-3.tex koncept/chapter1-4.tex \
	koncept/chapter1-5.tex koncept/chapter1-6.tex \
	koncept/chapter1-7.tex koncept/chapter1-8.tex \
	koncept/chapter1-9.tex
KONCEPT_CH2_FILES = koncept/chapter2-1.tex koncept/chapter2-2.tex \
	koncept/chapter2-3.tex koncept/chapter2-4.tex \
	koncept/chapter2-5.tex koncept/chapter2-6.tex \
	koncept/chapter2-7.tex koncept/chapter2-8.tex \
	koncept/chapter2-9.tex koncept/chapter2-10.tex \
	images/power1.pdf
KONCEPT_CH3_FILES = koncept/chapter3-1.tex koncept/chapter3-2.tex \
	koncept/chapter3-3.tex koncept/chapter3-4.tex \
	koncept/chapter3-5.tex koncept/chapter3-6.tex \
	koncept/chapter3-7.tex koncept/chapter3-8.tex \
	koncept/chapter3-9.tex
KONCEPT_CH4_FILES = koncept/chapter4-1.tex koncept/chapter4-2.tex \
	koncept/chapter4-3.tex koncept/chapter4-4.tex \
	koncept/chapter4-5.tex koncept/chapter4-6.tex \
	koncept/chapter4-7.tex koncept/chapter4-8.tex \
	koncept/chapter4-9.tex
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
KONCEPT_APDX_FILES = koncept/appendix-a.tex koncept/appendix-b.tex \
	koncept/appendix-c.tex koncept/appendix-d.tex \
	koncept/appendix-e.tex koncept/appendix-f.tex \
	koncept/appendix-g.tex koncept/appendix-h.tex \
	koncept/appendix-i.tex koncept/appendix-j.tex \
	koncept/appendix-l.tex
KONCEPT_OTHER_FILES = koncept/common.tex koncept/errata.tex \
	koncept/foreword.tex koncept/introduction.tex \
	koncept/frontpage.tex koncept/tryckkort.tex koncept/backpage.tex \
	koncept/matte.tex koncept/part3.tex \
	koncept/preface.tex koncept.bib \
	koncept/koncept-core.tex \
	koncept.tex koncept/chapter17-1.tex
KONCEPT_FILES = $(KONCEPT_CH1_FILES) $(KONCEPT_CH2_FILES) \
	$(KONCEPT_CH3_FILES) $(KONCEPT_CH4_FILES) $(KONCEPT_CH06_FILES) \
	$(KONCEPT_CH07_FILES) $(KONCEPT_CH08_FILES) $(KONCEPT_CH09_FILES) \
	$(KONCEPT_CH10_FILES) $(KONCEPT_CH11_FILES) \
	$(KONCEPT_CH12_FILES) $(KONCEPT_CH13_FILES) \
	$(KONCEPT_CH14_FILES) $(KONCEPT_CH15_FILES) $(KONCEPT_CH16_FILES) \
	$(KONCEPT_APDX_FILES) $(KONCEPT_OTHER_FILES)

koncept.aux: koncept.tex $(KONCEPT_FILES)
	- xelatex koncept.tex

koncept.idx: koncept.tex koncept.aux $(KONCEPT_FILES)
	- xelatex koncept.tex

koncept.bbl: koncept.aux koncept.bib
	bibtex koncept.aux

koncept.ind: koncept.idx
	makeindex koncept.idx

koncept.log:
koncept.pdf: koncept.aux koncept.bbl koncept.ind koncept.tex $(KONCEPT_FILES)
	-xelatex koncept.tex
	-xelatex koncept.tex
	makeindex koncept.idx
	xelatex koncept.tex

matterep.pdf: koncept/matte.tex handouts/matterep.tex
	-xelatex handouts/matterep.tex
	xelatex handouts/matterep.tex

koncept-alpha.pdf: koncept.bbl koncept-alpha.tex $(KONCEPT_FILES)
	-xelatex koncept-alpha.tex
	-xelatex koncept-alpha.tex
	xelatex koncept-alpha.tex

koncept-larobok.pdf: koncept.bbl koncept-larobok.tex $(KONCEPT_FILES)
	-xelatex koncept-larobok.tex
	-xelatex koncept-larobok.tex
	xelatex koncept-larobok.tex

koncept-refbok.pdf: koncept.bbl koncept-refbok.tex $(KONCEPT_FILES)
	-xelatex koncept-refbok.tex
	-xelatex koncept-refbok.tex
	xelatex koncept-refbok.tex

koncept-tryck.pdf: koncept.bbl koncept-tryck.tex $(KONCEPT_FILES)
	-xelatex koncept-tryck.tex
	-xelatex koncept-tryck.tex
	xelatex koncept-tryck.tex

koncept-online.pdf: koncept.bbl koncept-online.tex $(KONCEPT_FILES)
	-xelatex koncept-online.tex
	-xelatex koncept-online.tex
	xelatex koncept-online.tex

emf-handout.idx:
	xelatex handouts/emf-handout.tex

emf-handout.ind: emf-handout.idx
	makeindex emf-handout

emf-handout.pdf: emf-handout.ind handouts/emf-handout.tex koncept/chapter11-1.tex koncept/common.tex
	xelatex handouts/emf-handout.tex

iso-jordning.pdf: koncept.bbl handouts/iso-jordning.tex $(KONCEPT_FILES)
	-xelatex handouts/iso-jordning.tex
	xelatex handouts/iso-jordning.tex

koncept.tar.gz: Makefile $(KONCEPT_FILES) matterep.tex
	tar cvzf koncept.tar.gz Makefile $(KONCEPT_FILES) matterep.tex images/*

# TODOs
TODOs:  koncept.tex $(KONCEPT_FILES) koncept.log
	grep -n TODO *.tex koncept/*.tex > TODOs
#	grep HAREC koncept.log >> TODOs
#	grep --exclude=koncept/common.tex {rev koncept/*.tex >> TODOs
#	grep Missing koncept.log >> TODOs
	grep LaTeX koncept.log | grep Warning >> TODOs
	wc -l TODOs

# Länkade bilder
images.linked: koncept.tex $(KONCEPT_FILES)
	grep images *.tex | sed -e s/.*images/images/ | sed -e s/\}// | sort -u > images.linked

images.avail:
	ls images/*.pdf | sed -e s/\.pdf// | sort -u > images.avail

images.unlinked: images.avail images.linked
	diff images.avail images.linked | grep \< | sed -e s/\<\ // > images.unlinked

# Genererade bilder
images/power1.pdf: images/power1.mac
	maxima -b images/power1.mac

# Genererade presentationer
ac1.pdf: lectures/ac1.tex
	xelatex lectures/ac1.tex

ac2.pdf: lectures/ac2.tex
	xelatex lectures/ac2.tex

# Web-generering
koncept.xml:	koncept.tex $(KONCEPT_FILES)
	latexml koncept.tex > koncept.xml
koncept.webb:	koncept.xml
	latexmlpost --dest=web/koncept.html --split --splitat=section --navigationtoc=context --css=web/style.css koncept.xml


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
	-rm -f *.aux *.bbl *.idx *.ind *.lof *.log *.lot *.pdf *.toc *~ *.out !(koncept|ssa-akademin).png *.ilg *.upa koncept/*.aux koncept/*~ TODOs 

