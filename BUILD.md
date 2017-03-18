![KonCEPT för radioamatörcertifikat](koncept.png)

Installera och bygg
===================

Här förklaras vilka verktyg som behövs, hur man använder dom och
vilka filer som kan byggas. Det här repot innehåller mestadels
*TeX*-relaterade filer som kan användas för att bygga/generera
PDF-filer.

I det här dokumentet finns instruktioner om hur du kan hämta hem
projektet och köra den på din egen dator. Den går igenom steg för
steg och beskriver de verktyg som används för att köra koden.

> :bulb: Kom ihåg att om du har
problem kan du [skapa ett nytt ärende (new
issue)](https://github.com/SverigesSandareamatorer/SSA-Akademin/issues)
eller använda kontaktuppgifterna som finns i [README.md](README.md).

> :warning: Dessa instruktioner är inte fullständiga men kan
ändå hjälpa fram för allt de som kör Linux eller UNIX-liknande
operativsystem. Just nu är den här guiden mest inriktad på
[Linux/Debian-derivat](https://www.debian.org/misc/children-distros)
men paketnamnen bör heta likadant i andra distributioners pakethanterare.

-   [Kom igång](#kom-igång)
-   [Git](#git)
-   [Make](#make)
    -   [Byggberoenden](#byggberoenden)
-   [Installera beroenden](#installera-beroenden)
    -   [TeX/LaTeX](#texlatex)
    -   [LaTeXML](#latexml)
    -   [Docker](#docker)

Kom igång
---------

Börja med att följa instruktionerna nedan för att installera verktygen
*Make* och *Git*.

För att kunna hämta hem, arbeta med och köra projektet behöver du
använda dig av versionshanteringssystemet Git och verktyget Make.

**Linux/Debian**

    sudo apt-get install git make

Git
---

Git är ett versionshanteringsverktyg som håller reda på historiken av
kodutveckling. Den hjälper en kodare med arbetet genom smarta verktyg
och möjligheten att utveckla kollaborativt.

Navigera till den mapp du vill ladda ner SSA-Akademin repot i. De som
kör Git med grafiskt användargränssnitt (GUI) kan välja Clone och
sedan URL:en i argumentet nedan. För de som kör med kommandotolken:

    git clone https://github.com/SverigesSandareamatorer/SSA-Akademin.git
    cd SSA-Akademin/

Make
----

[Make](https://www.gnu.org/software/make/) är ett program som används
för att förenkla källkodsfiler till körbara filer och i det här
fallet, till bl.a. PDF:er. Det gör att användaren av Make inte behöver
veta *hur* genereringen går till utan bara vilket kommando som ska
köras. Make används genom att köra kommandot `make` följt av ett
mål. Till exempel:

    make <mål>

Dessa Make "mål" kräver vissa verktyg för att kunna köras och dessa
kallas för beroenden. Dessa beroenden måste installeras innan Make
"mål:et" kan köras och instruktioner för vilka beroenden ett mål
har hittar du under [Byggberoenden](#byggberoenden).

För att få en översikt över vilka mål som finns listas dom här i
tabellen med en beskrivning om vad dom gör.

| Mål                   | Bygger/Genererar...                       |
|-----------------------|-------------------------------------------|
| `all`                 | alla mål                                  |
| `clean`               | Tar bort alla genererade filer            |
| `koncept.pdf`         | PDF av KonCEPT referensbok                |
| `koncept-refbok.pdf`  | PDF av KonCEPT referensbok                |
| `koncept-larobok.pdf` | PDF av KonCEPT lärobok                    |
| `matterep.pdf`        | PDF av Matterepetitionsboken              |
| `emf-handout.pdf`     | PDF av Utbildningsmaterial EMF            |
| `webb`                | Bygger en HTML fil av KonCEPT referensbok |
| `docker-image`        | Bygg en Docker *image*                    |
| `docker-build`        | Kör Docker *image* i en *container*       |

### Byggberoenden

I den här tabellen listas Make "mål:en" tillsammans med de verktyg
som de är beroende utav. För att köra ett Make mål, se till att du
har installerat beroendet som det behöver.

| Mål                   | Beroende...             |
|-----------------------|-------------------------|
| `clean`               | -                       |
| `koncept.pdf`         | [TeX/LaTeX](#texlatex) |
| `koncept-refbok.pdf`  | [TeX/LaTeX](#texlatex) |
| `koncept-larobok.pdf` | [TeX/LaTeX](#texlatex) |
| `matterep.pdf`        | [TeX/LaTeX](#texlatex) |
| `emf-handout.pdf`     | [TeX/LaTeX](#texlatex) |
| `webb`                | [LaTeXML](#latexml)     |
| `docker-image`        | [Docker](#docker)       |
| `docker-build`        | [Docker](#docker)       |

Installera beroenden
--------------------

### TeX/LaTeX

TeX är ett typsättningssystem där ett dokument, en bok eller en artikel
kan beskrivas i ren text (filer med filändelsen `.tex`) för att sedan
med hjälp av programvara generera texten för att få formatering.

**Linux/Debian**

    sudo apt-get update
    sudo apt-get install texlive texlive-lang-european \
        texlive-latex-extra texlive-pictures texlive-math-extra

### LaTeXML

[LaTeXML](http://dlmf.nist.gov/LaTeXML/) är ett verktyg för att konvertera TeX-dokument till
XML-filer. Den kan sedan konvertera dessa XML-filer till bland annat
HTML. Verktyget är bra till att skapa en version av ett skrivet dokument
som är läsbart på webben.

För att få den senaste versionen av LaTeXML måste projektet laddas
ner och beroenden måste hämtas.

**Linux/Debian**  
Hämta LaTeXML:

     git clone https://github.com/brucemiller/LaTeXML.git
     cd LaTeXML/

Installera [LaTeXML
beroenden](http://dlmf.nist.gov/LaTeXML/get.html#SS2.SSS0.Px2):

     sudo apt-get install   \
       libarchive-zip-perl libfile-which-perl libimage-size-perl  \
       libio-string-perl libjson-xs-perl libtext-unidecode-perl \
       libparse-recdescent-perl liburi-perl libuuid-tiny-perl
       libwww-perl \
       libxml2 libxml-libxml-perl libxslt1.1 libxml-libxslt-perl  \
       texlive-latex-base imagemagick libimage-magick-perl perl


Följ sedan
[bygginstruktioerna](http://dlmf.nist.gov/LaTeXML/get.html#SS6.SSS0.Px2)
och kör följande:

    perl Makefile.PL
    make
    make test

[Installera LaTeXML](http://dlmf.nist.gov/LaTeXML/get.html#SS6.SSS0.Px3)
(detta måste göras som *sudo*):

     sudo make install

### Docker
