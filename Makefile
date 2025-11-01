DOCKER_IMAGE_NAME=	ssa-koncept

help:
	@echo 'Makefile för SSA-Akademin                                             '
	@echo '                                                                      '
	@echo 'Användning:                                                           '
	@echo '   make all                    kör alla make mål                      '
	@echo '   make koncept.pdf            bygg PDF av KonCEPT                    '
	@echo '   make koncept.epub           bygg EPUB av KonCEPT (experimentell)   '
	@echo '   make clean                  rensa alla byggfiler                   '
	@echo '   make help                   visa den här informationen             '

all:	koncept.pdf koncept.epub

.PHONY: all koncept.pdf koncept.epub clean help

KONCEPT_CH01_FILES = koncept/ellaera.tex \
	koncept/ellaera-elektriska-grundbegrepp.tex koncept/ellaera-elektriska-kraftkallor.tex \
	koncept/ellaera-elektriskt-faelt.tex koncept/ellaera-magnetiskt-faelt.tex \
	koncept/ellaera-elektromagnetiska-vaagor.tex koncept/ellaera-sinusformade-signaler.tex \
	koncept/ellaera-icke-sinusformade-signaler.tex koncept/ellaera-effekt-och-energi.tex
KONCEPT_KOMPONENTER_FILES = koncept/komponenter.tex \
	koncept/komponenter-resistorn.tex koncept/komponenter-kondensatorn.tex \
	koncept/komponenter-induktorn.tex koncept/komponenter-transformatorn.tex \
	koncept/komponenter-halvledardioden.tex koncept/komponenter-transistorn.tex \
	koncept/komponenter-ic.tex \
	koncept/komponenter-elektronroer.tex koncept/komponenter-digitala-kretsar.tex \
	koncept/komponenter-operationsfoerstarkare.tex koncept/komponenter-vaermeutveckling.tex
KONCEPT_KRETSAR_FILES = koncept/kretsar.tex \
	koncept/kretsar-serie-och-parallellt.tex koncept/kretsar-filter.tex \
	koncept/kretsar-kraftfoersorjning.tex koncept/kretsar-foerstarkare.tex \
	koncept/kretsar-detektorer-demodulatorer.tex koncept/kretsar-oscillatorer.tex \
	koncept/kretsar-kristalloscillatorer.tex koncept/kretsar-frekvensblandare.tex \
	koncept/kretsar-modulatorer.tex koncept/kretsar-digital-signalbehandling.tex
KONCEPT_CH04_FILES = koncept/ioj.tex koncept/ioj-isolation.tex
KONCEPT_MODULATION_FILES = koncept/modulation.tex \
	koncept/modulation-modulationssystem.tex \
	koncept/modulation-saendningsslag.tex \
	koncept/modulation-kaennetecken.tex \
	koncept/modulation-bandbredd.tex \
	koncept/modulation-beskrivningskod.tex \
	koncept/modulation-modulerande.tex \
	koncept/modulation-amplitudmodulation.tex \
	koncept/modulation-cw.tex \
	koncept/modulation-ssb.tex \
	koncept/modulation-vinkelmodulation.tex \
	koncept/modulation-frekvensmodulation.tex \
	koncept/modulation-fasmodulation.tex \
	koncept/modulation-fm-pm-jmf.tex \
	koncept/modulation-pulsmodulation.tex \
	koncept/modulation-digital-modulation.tex \
	koncept/modulation-digitala-begrepp.tex \
	koncept/modulation-bitfel.tex \
	koncept/modulation-digitala-saendningsslag.tex
KONCEPT_CH05_FILES = koncept/mottagare.tex \
	koncept/mottagare-raka-mottagare.tex \
	koncept/mottagare-superheterodynmottagare.tex koncept/mottagare-jaemfoerrelse-superheterodyn.tex \
	koncept/mottagare-panoramamottagare.tex koncept/mottagare-mottagningskonvertern.tex \
	koncept/mottagare-transvertern.tex koncept/mottagare-agc.tex \
	koncept/mottagare-egenskaper-i-mottagare.tex
KONCEPT_CH06_FILES = koncept/saendare.tex \
	koncept/saendare-egenskaper-i-saendare.tex koncept/saendare-transceiver.tex
KONCEPT_CH07_FILES = koncept/antennsystem.tex \
	koncept/antennsystem-allmant.tex koncept/antennsystem-polarisation.tex \
	koncept/antennsystem-antenner-foer-kortvag.tex koncept/antennsystem-riktantenner-foer-kortvag.tex \
	koncept/antennsystem-antenner-foer-vhf-uhf-shf.tex koncept/antennsystem-transmissionsledningar.tex
KONCEPT_CH08_FILES = koncept/vaagutbredning.tex \
	koncept/vaagutbredning-kraftfaelt-antenner.tex koncept/vaagutbredning-radiovaagornas-egenskaper.tex \
	koncept/vaagutbredning-jonosfaerskikten.tex koncept/vaagutbredning-solens-inverkan.tex \
	koncept/vaagutbredning-vaagutbredning-paa-kortvag.tex koncept/vaagutbredning-vaagutbredning-paa-vhf-ehf.tex \
	koncept/vaagutbredning-brus-och-laenkbudget.tex
KONCEPT_CH09_FILES = koncept/maetteknik.tex \
	koncept/maetteknik-att-maeta.tex koncept/maetteknik-maetinstrument.tex
KONCEPT_CH10_FILES = koncept/emc.tex \
	koncept/emc-stoerningar-och-stoerkanslihet.tex koncept/emc-stoerningar-i-elektronik.tex \
	koncept/emc-stoerningsorsaker.tex koncept/emc-avstoerningsmetoder.tex
KONCEPT_CH11_FILES = koncept/emf.tex koncept/chapter11-1.tex \
	koncept/emf-egenkontroll.tex koncept/emf-sammanfattning.tex
KONCEPT_CH12_FILES = koncept/elsaekerhet.tex \
	koncept/elsaekerhet-maenniskokroppen.tex koncept/elsaekerhet-allmaenna-elnaetet.tex \
	koncept/elsaekerhet-faror.tex koncept/elsaekerhet-aaska.tex
KONCEPT_TRAFIKREGLEMENTE_FILES = koncept/trafikreglemente.tex \
	koncept/trafikreglemente-fonetiska-alfabet.tex koncept/trafikreglemente-q-koden.tex \
	koncept/trafikreglemente-trafikfoerkortningar.tex koncept/trafikreglemente-internationell-noedtrafik.tex \
	koncept/trafikreglemente-exempel-kontakt.tex \
	koncept/trafikreglemente-innehaall-i-foerbindelse.tex \
	koncept/trafikreglemente-anropssignaler.tex \
	koncept/trafikreglemente-loggbok.tex \
	koncept/trafikreglemente-hederskod.tex \
	koncept/trafikreglemente-ordningsregler.tex koncept/trafikreglemente-bandplaner.tex
KONCEPT_CH14_FILES = koncept/bestaemmelser.tex \
	koncept/bestaemmelser-itu-rr.tex koncept/bestaemmelser-cept.tex \
	koncept/bestaemmelser-svensk-lag-och-foereskrift.tex
KONCEPT_APDX_FILES = koncept/appendix-bandplaner.tex koncept/appendix-beskrivningskoder.tex \
	koncept/appendix-decibel.tex koncept/appendix-frekvensplan.tex \
	koncept/appendix-kunskapskrav.tex koncept/appendix-lashanvisningar.tex \
	koncept/appendix-matematik.tex \
	koncept/appendix-mattenheter.tex \
	koncept/appendix-rapportkoder.tex koncept/appendix-repeatrar.tex \
	koncept/appendix-s-enheter.tex koncept/appendix-morsesignalering.tex \
	koncept/appendix-aaskskydd.tex
KONCEPT_OTHER_FILES = koncept/foerord.tex koncept/inledning.tex \
	koncept/frontpage.tex koncept/tryckort.tex koncept/backpage.tex \
	koncept/litteratur.tex koncept.bib \
	koncept/inkludera-kapitel.tex koncept/inkludera-appendix.tex \
	koncept.tex
KONCEPT_FILES = $(KONCEPT_CH01_FILES) $(KONCEPT_KOMPONENTER_FILES) \
	$(KONCEPT_KRETSAR_FILES) $(KONCEPT_CH04_FILES) \
	$(KONCEPT_MODULATION_FILES) \
	$(KONCEPT_CH05_FILES) $(KONCEPT_CH06_FILES) \
	$(KONCEPT_CH07_FILES) $(KONCEPT_CH08_FILES) \
	$(KONCEPT_CH09_FILES) $(KONCEPT_CH10_FILES) \
	$(KONCEPT_CH11_FILES) $(KONCEPT_CH12_FILES) \
	$(KONCEPT_TRAFIKREGLEMENTE_FILES) $(KONCEPT_CH14_FILES) \
	$(KONCEPT_APDX_FILES) $(KONCEPT_OTHER_FILES)

REPO_FILES = SHA.tmp branch.tmp

branch.tmp:
	touch branch.tmp

SHA.tmp:
	touch SHA.tmp

koncept.log:
koncept.pdf: $(REPO_FILES) koncept.tex $(KONCEPT_FILES)
	latexmk -pdf koncept.tex

%.xbb: %.png
	ebb -x $<

%.xbb: %.pdf
	ebb -x $<

IMAGE_PNGS := $(shell find images -name "*.png")
IMAGE_PDFS := $(shell find images -name "*.pdf")
IMAGE_XBBS := $(IMAGE_PNGS:.png=.xbb) $(IMAGE_PDFS:.pdf=.xbb)

koncept.epub: $(REPO_FILES) koncept.tex $(KONCEPT_FILES) $(IMAGE_XBBS)
	tex4ebook --format epub3 --tidy koncept.tex

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
images_linked.txt: koncept.tex $(KONCEPT_FILES)
	grep -F images ./**/*.tex | sed -e s/.*images/images/ | sed -e s/\}// | sort -u > images_linked.txt

# Skapar filen images_available.txt som innehåller en sorterad lista över alla
# PDF-filer i katalogen images och dess undermappar. Använder wildcard för att
# hitta PDF-filer och sort -u för att ta bort eventuella dubbletter.
images_available.txt: $(wildcard images/**/*.pdf)
	ls images/**/*.pdf | sed -e s/\.pdf// | sort -u > images_available.txt

images_unlinked.txt: images_available.txt images_linked.txt
	diff images_available.txt images_linked.txt | grep \< | sed -e s/\<\ // > images_unlinked.txt

# Skapar en rapport med kodrader som är längre än 80 tecken.
long_lines.txt: $(KONCEPT_FILES)
	grep '.\{81\}' koncept/*.tex > long_lines.txt

# Skapar en rapport med kodrader som bara är kommentar.
comment_lines.txt: $(KONCEPT_FILES)
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
	-find images -name "*.xbb" -delete
