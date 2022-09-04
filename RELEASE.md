# Release

Release-anteckningar för **KonCEPT för Radioamatörcertifikat**. För att göra
release av tryckoriginal av KonCEPT ska följande steg göras:

## Beslut om release
För att besluta om release ska man i gruppen vara överens om att inga akuta
brister i format och innehåll återstår.

## Beslut om versionsnummer
Normalt ska trycknings-versionen uppdateras, så att t.ex. stegningen från
andra upplagan tredje tryckningen (v2.2.0) till andra upplagan fjärde
tryckningen ger v2.3.0.

## Uppdatering av tryckort-sidan
Uppdatera [`koncept/tryckort.tex`](koncept/tryckort.tex) att beskriva t.ex. ”Andra upplagan, fjärde tryckningen”.

## Uppdatering av version
Uppdatera [`VERSION.txt`](VERSION.txt) till att innehålla den numeriska versionen, t.ex. ”2.3.0”.

## Uppdatering av CHANGELOG
Lägg till viktiga förändringar sedan förra tryckningen i [CHANGELOG.md](CHANGELOG.md).

## Gör commit av förändringarna
Gör en <kbd>git commit</kbd> av alla förändringar med versionsnumret, dvs. t.ex. ”v2.3.0” som
commit-meddelande.

## Tagga i Git
Versionen ska sedan [taggas](https://github.com/SverigesSandareamatorer/SSA-Akademin/tags)
genom att [spara en ny release](https://github.com/SverigesSandareamatorer/SSA-Akademin/releases/new)
i GitHub. Bifoga PDF-filen från rätt Actions-körning.

## Tryckning
Skicka PDF-fil för tryckning.

## Förbered för fortsatt utveckling
Ändra [`VERSION.txt`](VERSION.txt) till att innehålla den gissade nästa versionen med tillägget ”-pre”, t.ex. ”2.4.0-pre”.
Skapa en [milestone](https://github.com/SverigesSandareamatorer/SSA-Akademin/milestones) för versionsnumret (utan -pre).
