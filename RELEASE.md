# Release

Release-anteckningar för **KonCEPT för Radioamatörcertifikat**. För att göra
release av tryckoriginal av KonCEPT ska följande steg göras:

## Beslut om release

För att besluta om release ska man i gruppen vara överens om att inga akuta
brister i format och innehåll återstår.

## Beslut om versionsnummer

Normalt skall trycknings-versionen uppdateras, så att t.ex. stegningen från
andra upplagan tredje tryckningen (v2.2.0) till andra upplagan fjärde
tryckningen ger v2.3.0.

## Uppdatering av tryckort-sidan

Uppdatera [`koncept/tryckort.tex`](koncept/tryckort.tex) att beskriva t.ex. `Andra upplagan, fjärde tryckningen`.

## Uppdatering av version

Uppdatera [`VERSION.txt`](VERSION.txt) till att innehålla den numeriska versionen, t.ex. `2.3.0`.

## Uppdatering av CHANGELOG

Uppdatera [`CHANGELOG.md`](CHANGELOG.md) till att innehålla alla större förändringar sedan förra
tryckningen.

## Gör commit av förändringarna

Gör en `git commit` av alla förändringar med versionsnumret, dvs. `v2.3.0` som
git-meddelande.

## Tagga i Git

Versionen ska sedan [taggas](https://github.com/SverigesSandareamatorer/SSA-Akademin/tags) i Git.

## Spara release på GitHub

Versionen ska sedan [sparas som en release](https://github.com/SverigesSandareamatorer/SSA-Akademin/releases/new) i GitHub.

## Ändra versionsnumret

Ändra [`VERSION.txt`](VERSION.txt) till att innehålla den gissade nästa versionen med tillägget "-pre", t.ex. `2.5.0-pre`.
Skapa en [milestone](https://github.com/SverigesSandareamatorer/SSA-Akademin/milestones) för versionsnumret (utan -pre).
