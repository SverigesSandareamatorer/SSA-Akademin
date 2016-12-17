DOCKER_IMAGE_NAME=	ssa-koncept

all:	koncept.pdf
all:	matterep.pdf
all:	koncept-alpha.pdf

.PHONY:	*.pdf

KONCEPT_CH1_FILES = chapter1-1.tex chapter1-2.tex chapter1-3.tex \
	chapter1-4.tex chapter1-5.tex chapter1-6.tex chapter1-7.tex \
	chapter1-8.tex chapter1-9.tex
KONCEPT_CH2_FILES = chapter2-1.tex chapter2-2.tex chapter2-3.tex \
	chapter2-4.tex chapter2-5.tex chapter2-6.tex chapter2-7.tex \
	chapter2-8.tex chapter2-9.tex
KONCEPT_CH3_FILES = chapter3-1.tex chapter3-2.tex chapter3-3.tex \
	chapter3-4.tex chapter3-5.tex chapter3-6.tex chapter3-7.tex \
	chapter3-8.tex chapter3-9.tex
KONCEPT_CH4_FILES = chapter4-1.tex chapter4-2.tex chapter4-3.tex \
	chapter4-4.tex chapter4-5.tex chapter4-6.tex chapter4-7.tex \
	chapter4-8.tex chapter4-9.tex
KONCEPT_CH5_FILES = chapter5-1.tex chapter5-2.tex
KONCEPT_CH6_FILES = chapter6-1.tex chapter6-2.tex chapter6-3.tex \
	chapter6-4.tex chapter6-5.tex chapter6-6.tex
KONCEPT_CH7_FILES = chapter7-1.tex chapter7-2.tex chapter7-3.tex \
	chapter7-4.tex chapter7-5.tex
KONCEPT_CH8_FILES = chapter8-1.tex chapter8-2.tex
KONCEPT_CH9_FILES = chapter9-1.tex chapter9-2.tex chapter9-3.tex \
	chapter9-4.tex
KONCEPT_CH10_FILES = chapter10-1.tex chapter10-2.tex chapter10-3.tex \
	chapter10-4.tex
KONCEPT_CH11_FILES = chapter11-1.tex chapter11-2.tex chapter11-3.tex \
	chapter11-4.tex chapter11-5.tex chapter11-6.tex
KONCEPT_CH12_FILES = chapter12-1.tex chapter12-2.tex chapter12-3.tex
KONCEPT_CH13_FILES = chapter13-1.tex
KONCEPT_APDX_FILES = appendix-a.tex appendix-b.tex appendix-c.tex \
	appendix-d.tex appendix-e.tex appendix-f.tex appendix-g.tex \
	appendix-h.tex appendix-i.tex appendix-j.tex appendix-l.tex
KONCEPT_OTHER_FILES = common.tex errata.tex foreword.tex introduction.tex \
	matte.tex morse.tex part3.tex preface.tex rest.tex
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
	pdflatex koncept.tex

matterep.pdf: matte.tex matterep.tex
	-pdflatex matterep.tex
	pdflatex matterep.tex

koncept-alpha.pdf: koncept.bbl koncept-alpha.tex $(KONCEPT_FILES)
	-pdflatex koncept-alpha.tex
	pdflatex koncept-alpha.tex

koncept.bbl: koncept.aux koncept.bib
	bibtex koncept.aux

koncept.ind: koncept.idx
	makeindex koncept

# Optionally build using docker, currently only tested with MacOS and Docker 1.12.3, but
# should work anywhere you can run Docker.
# To build using Docker, run 'make docker-image' first which will take quite some time,
# then run 'make docker-build' which will 'run make' all inside the Docker container.
docker-image:
	docker build -t ${DOCKER_IMAGE_NAME} .

docker-build:
	docker run -ti --rm -v $(shell pwd):/work -w /work ${DOCKER_IMAGE_NAME} make all

clean:
	-rm -f *.aux *.idx *.lof *.log *.lot *.pdf *.toc *~ *.out
