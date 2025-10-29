Installera och bygg
===================

Här förklaras vilka verktyg som behövs, hur man använder dem och
vilka filer som kan byggas. Det här repot innehåller mestadels
*TeX*-relaterade filer som kan användas för att bygga/generera
PDF-filer.

I det här dokumentet finns instruktioner om hur du kan hämta hem
projektet och köra den på din egen dator. Den går igenom steg för
steg och beskriver de verktyg som används för att köra koden.

| :bulb: **Tips** |
|:----------------|
| Kom ihåg att om du har problem kan du skapa ett nytt [ärende på GitHub](https://github.com/SverigesSandareamatorer/SSA-Akademin/issues) eller använda kontaktuppgifterna som finns i [README.md](README.md). |

| :warning: **Observera** |
|:------------------------|
| Dessa instruktioner är inte fullständiga men kan ändå hjälpa framför allt de som kör Linux eller UNIX-liknande operativsystem. Just nu är den här guiden mest inriktad på [Linux/Debian-derivat](https://www.debian.org/misc/children-distros) men paketnamnen bör heta likadant i andra distributioners pakethanterare. |

# Kom igång

Börja med att följa instruktionerna nedan för att installera verktygen
*Make* och *Git*.

För att kunna hämta hem, arbeta med och köra projektet behöver du
använda dig av versionshanteringssystemet Git och verktyget Make.

**Linux/Debian**

<kbd>sudo apt-get install git make</kbd>

# Git

[Git](https://git-scm.com) är ett versionshanteringsverktyg som håller reda på
historiken av kodutveckling. Den hjälper en kodare med arbetet genom smarta
verktyg och möjligheten att utveckla kollaborativt.

Navigera till den mapp du vill ladda ner SSA-Akademin repot i. De som
kör Git med grafiskt användargränssnitt (GUI) kan välja Clone och
sedan URL:en i argumentet nedan. För de som kör med kommandotolken:

<kbd>git clone https://github.com/SverigesSandareamatorer/SSA-Akademin.git</kbd>

<kbd>cd SSA-Akademin/</kbd>

# Make

[Make](https://www.gnu.org/software/make/) är ett program som används
för att förenkla källkodsfiler till körbara filer och i det här
fallet, till bl.a. PDF:er. Det gör att användaren av Make inte behöver
veta *hur* genereringen går till utan bara vilket kommando som ska
köras. Make används genom att köra kommandot ”make” följt av ett
mål. Till exempel:

<kbd>make koncept.pdf</kbd>

Dessa Make ”mål” kräver vissa verktyg för att kunna köras och dessa
kallas för beroenden. Dessa beroenden måste installeras innan Make
”mål:et” kan köras och instruktioner för vilka beroenden ett mål
har hittar du under [Make mål och Byggberoenden](#make-mÅl-och-byggberoenden).

## Make-mål och byggberoenden

För att få en översikt över vilka mål som finns listas de här i
tabellen med en beskrivning om vad de gör och vilka verktyg som de är
beroende av. För att köra ett Make-mål, se till att du
har installerat beroendet som det behöver.

| Mål | Bygger/Genererar | Beroende |
| --- | --- | --- |
| `all`                |alla mål                           |alla beroenden nedan  |
| `clean`              |Tar bort alla genererade filer     |-                     |
| `koncept.pdf` | PDF av KonCEPT | [TeX/LaTeX](#texlatex) |
| `koncept.epub` | EPUB av KonCEPT (experimentell) | [TeX/LaTeX](#texlatex) |
| `docker-image`       |Bygg en Docker *image*             |Docker                |
| `docker-build`       |Kör Docker *image* i en *container*|Docker                |

# Installera beroenden

## Tex/LaTeX

TeX är ett typsättningssystem där ett dokument, en bok eller en artikel
kan beskrivas i ren text (filer med filändelsen `.tex`) för att sedan
med hjälp av programvara generera texten för att få formatering. För att
generera PDF-filer av vår kod behövs TeX och vissa extra komponenter
installeras.

**Linux/Debian**

<kbd>sudo apt update</kbd>

<kbd>sudo apt install texlive texlive-extra-utils texlive-lang-european
	texlive-science texlive-fonts-recommended texlive-fonts-extra latexmk</kbd>

# Använda GitHub Codespaces

För att komma igång med utveckling med hjälp av GitHub Codespaces, följ dessa steg:

1. **Öppna projektet i GitHub**:
   Gå till projektets GitHub-sida: [SSA-Akademin](https://github.com/SverigesSandareamatorer/SSA-Akademin).

2. **Starta en Codespace**:
   Klicka på den gröna knappen `Code` och välj `Open with Codespaces`. Om du inte ser alternativet, se till att du har tillgång till GitHub Codespaces.

3. **Skapa en ny Codespace**:
   Klicka på `New codespace` för att skapa en ny utvecklingsmiljö. Detta kan ta några minuter första gången.

4. **Använda Codespace**:
   När Codespace är startad, kommer den att använda konfigurationen från `.devcontainer/devcontainer.json` för att ställa in utvecklingsmiljön. Detta inkluderar att installera nödvändiga verktyg och tillägg.

5. **Kör postAttachCommand**:
   Efter att Codespace har startat, kommer kommandot `make help` att köras automatiskt, vilket visar tillgängliga make-kommandon.

6. **Börja utveckla**:
   Du kan nu börja utveckla direkt i din webbläsare eller i Visual Studio Code om du föredrar det. Alla ändringar du gör kommer att synkroniseras med ditt GitHub-repo.

För mer information om hur du använder GitHub Codespaces, besök [GitHub Codespaces documentation](https://docs.github.com/en/codespaces).

Lycka till med din utveckling!
