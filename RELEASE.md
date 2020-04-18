# Release

Release-anteckningar för **KonCEPT för Radioamatörcertifikat**. För att göra
release och tryck-original av KonCEPT skall följande steg göras:

## Beslut om release

För att besluta om release skall man i gruppen vara överens om att inga akuta
brister i format och innehåll återstår.

## Beslut om versionsnummer

Normalt skall trycknings-versionen uppdateras, så att t.ex. stegningen från
andra upplagan tredje tryckningen (v2.2.0) till andra upplagan fjärde
tryckningen ger v2.3.0.
Skapa en [milestone](https://github.com/SverigesSandareamatorer/SSA-Akademin/milestones)
för versionsnumret.

## Uppdatering av tryckort-sidan

Uppdatera `koncept/tryckort.tex` att beskriva `Andra upplagan, fjärde tryckningen`.

## Uppdatering av version

Uppdatera `VERSION.txt` till att innehålla den numeriska versionen, t.ex. `2.3.0`.

## Uppdatering av CHANGELOG

Uppdatera CHANGELOG.md till att innehålla alla större förändringar sedan förra
tryckningen.

## Gör git commit av förändringarna

Gör en `git commit` av alla förändringar med versionsnumret, dvs. `v2.3.0` som
git-meddelande.

## Tagga i git

Versionen ska sedan [taggas](https://github.com/SverigesSandareamatorer/SSA-Akademin/tags) i git.

## Bygg tryck-original

Bygg tryck-original med `make koncept-tryck.pdf` och skicka till HQ för tryckning.
