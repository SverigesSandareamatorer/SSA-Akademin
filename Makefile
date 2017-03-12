DOCKER_IMAGE_NAME=	ssa-koncept

all:	koncept.pdf
all:	matterep.pdf
#all:	koncept-alpha.pdf
all:	koncept-larobok.pdf
all:	koncept-refbok.pdf

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
KONCEPT_CH5_FILES = koncept/chapter5-1.tex koncept/chapter5-2.tex
KONCEPT_CH6_FILES = koncept/chapter6-1.tex koncept/chapter6-2.tex \
	koncept/chapter6-3.tex koncept/chapter6-4.tex \
	koncept/chapter6-5.tex koncept/chapter6-6.tex
KONCEPT_CH7_FILES = koncept/chapter7-1.tex koncept/chapter7-2.tex \
	koncept/chapter7-3.tex koncept/chapter7-4.tex \
	koncept/chapter7-5.tex
KONCEPT_CH8_FILES = koncept/chapter8-1.tex koncept/chapter8-2.tex
KONCEPT_CH9_FILES = koncept/chapter9-1.tex koncept/chapter9-2.tex \
	koncept/chapter9-3.tex koncept/chapter9-4.tex
KONCEPT_CH10_FILES = koncept/chapter10-1.tex koncept/chapter10-2.tex \
	koncept/chapter10-3.tex koncept/chapter10-4.tex
KONCEPT_CH11_FILES = koncept/chapter11-1.tex koncept/chapter11-2.tex \
	koncept/chapter11-3.tex koncept/chapter11-4.tex \
	koncept/chapter11-5.tex koncept/chapter11-6.tex
KONCEPT_CH12_FILES = koncept/chapter12-1.tex koncept/chapter12-2.tex \
	koncept/chapter12-3.tex
KONCEPT_CH13_FILES = koncept/chapter13-1.tex
KONCEPT_APDX_FILES = koncept/appendix-a.tex koncept/appendix-b.tex \
	koncept/appendix-c.tex koncept/appendix-d.tex \
	koncept/appendix-e.tex koncept/appendix-f.tex \
	koncept/appendix-g.tex koncept/appendix-h.tex \
	koncept/appendix-i.tex koncept/appendix-j.tex \
	koncept/appendix-l.tex
KONCEPT_OTHER_FILES = common.tex errata.tex foreword.tex introduction.tex \
	matte.tex koncept/morse.tex part3.tex preface.tex rest.tex koncept.bib \
	koncept.tex koncept/emf.tex koncept/chapter14-1.tex
KONCEPT_FILES = $(KONCEPT_CH1_FILES) $(KONCEPT_CH2_FILES) \
	$(KONCEPT_CH3_FILES) $(KONCEPT_CH4_FILES) $(KONCEPT_CH5_FILES) \
	$(KONCEPT_CH6_FILES) $(KONCEPT_CH7_FILES) $(KONCEPT_CH8_FILES) \
	$(KONCEPT_CH9_FILES) $(KONCEPT_CH10_FILES) $(KONCEPT_CH11_FILES) \
	$(KONCEPT_CH12_FILES) $(KONCEPT_CH13_FILES) \
	$(KONCEPT_APDX_FILES) $(KONCEPT_OTHER_FILES)

koncept.idx:
koncept.aux: koncept.tex $(KONCEPT_FILES)
	pdflatex koncept.tex

koncept.pdf: koncept.aux koncept.bbl koncept.ind koncept.tex $(KONCEPT_FILES)
	-pdflatex koncept.tex
	pdflatex koncept.tex

matterep.pdf: matte.tex matterep.tex
	-pdflatex matterep.tex
	pdflatex matterep.tex

koncept-alpha.pdf: koncept.bbl koncept-alpha.tex $(KONCEPT_FILES)
	-pdflatex koncept-alpha.tex
	pdflatex koncept-alpha.tex

koncept-larobok.pdf: koncept.bbl koncept-larobok.tex $(KONCEPT_FILES)
	-pdflatex koncept-larobok.tex
	pdflatex koncept-larobok.tex

koncept-refbok.pdf: koncept.bbl koncept-refbok.tex $(KONCEPT_FILES)
	-pdflatex koncept-refbok.tex
	pdflatex koncept-refbok.tex

koncept.bbl: koncept.aux koncept.bib
	bibtex koncept.aux

koncept.ind: koncept.idx
	makeindex koncept

emf-handout.ind: emf-handout.idx
	makeindex emf-handout

emf-handout.pdf: emf-handout.ind emf-handout.tex koncept/emf.tex common.tex
	pdflatex emf-handout.tex

koncept.tar.gz: Makefile $(KONCEPT_FILES) matterep.tex
	tar cvzf koncept.tar.gz Makefile $(KONCEPT_FILES) matterep.tex images/*

# TODOs
TODOs:  koncept.tex $(KONCEPT_FILES)
	grep -n TODO *.tex koncept/*.tex > TODOs
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
	pdflatex lectures/ac1.tex

ac2.pdf: lectures/ac2.tex
	pdflatex lectures/ac2.tex

# Web-generering
webb:	koncept.tex $(KONCEPT_FILES)
	./buildSingleTex.pl koncept.tex | pandoc -f latex -t html -sNm --css=style.css --toc | perl -ne 's/(?<=<img src=")(.*?)(?=")/..\/$$1.png/g; print;' > web/index.html


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
	-rm -f *.aux *.bbl *.idx *.ind *.lof *.log *.lot *.pdf *.toc *~ *.out !(koncept).png *.ilg *.upa koncept/*.aux

