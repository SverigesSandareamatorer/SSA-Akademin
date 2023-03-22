# Ändringslogg
Alla nämnvärda ändringar i projektet dokumenteras här.

Det här projektet [för en ändringslogg](https://keepachangelog.com/sv/1.0.0/)
och följer [semantisk versionshantering](https://semver.org/lang/sv/spec/v2.0.0.html).

## [Osläppt]
### Tillagt
- Nytt byggmål för ebok i EPUB-format.

## [2.6.0] – 2023-03-22
### Fixat
- En felkodad länk har rättats.
- Rättat skrivfel i bilaga med bandplaner.
- Lagt till saknad bandplan för 60-metersbandet i appendix.

### Ändrat
- Makron ändrade till de för siunitx 3.0.
- Releaseinstruktionen flyttad till wikin på GitHub.
- Fört in ändringar p.g.a nya lagar och föreskrifter:
  - Lag (2022:482) om elektronisk kommunikation
  - Förordning (2022:511) om elektronisk kommunikation
  - PTSFS 2022:19 föreskrifter om undantag från tillståndsplikt för användning av vissa radiosändare
  - PTSFS 2019:1 Post- och telestyrelsens allmänna råd om den svenska frekvensplanen

### Borttaget
- Filer med ofärdiga lektioner borttagna.
- Filer med ofärdiga lösblad borttagna.

## [2.5.0] – 2022-01-27
### Tillagt
 - Ny beskrivning av glimmer.

### Ändrat
- Bilaga A Måttenheter har gjorts om.
- Innehållsförteckningen har två istället för tre nivåer.
- Förbättrad placering av ett stort antal figurer.
- Boken byggs med GitHub Actions, istället för Travis CI.

### Fixat
- Ett stort antal skrivfel har rättats.
- Figur 2.51 har gjorts svartvit.
- Texten återspeglar att solfläckscykel 25 är den nuvarande.
- Rätt telefonnummer till SSA:s kansli.

### Borttaget
- Appendix med litteraturförteckningen från första upplagan har raderats.

## [2.4.0] – 2021-03-31
### Ändrat
- Liten uppdatering med läsanvisningar för teknikdelen
- Liten uppdatering med läsanvisningar för reglementesdelen
- Tillagt ett litet nytt appendix med bandplaner
- Städat upp HAREC-referenser som var lite yviga i kapitel 13 (28 stycken på rad)
- Lite annan småfix

## [2.3.0] – 2019-10-06
### Ändrat
- Gått över till siunitx.
- Anpassat länkar till HTTPS.
- Referenser åtgärdade.
- Index genereras.
- Elsäkerhets-slides tillagda.
- Uppdatering av bygg-miljön.

### Fixat
- TOODs generering återställd.

## [2.2.0] – 2019-01-27
### Ändrat
- Justerat permeabilitet.
- Justerat med avseende på nya PTS föreskrift.

## [2.1.0] – 2018-10-24
### Fixat
- Appendix med HAREC-referenserna hade försvunnit. Återställt.

## [2.0.0] – 2018-08-18
### Ändrat
- Bytt felaktig användning av ordet ”decimal” till ”siffra”.
- Förtydligar vad oktal och hexadecimal form är för något.
- Ändrar till utskrivna siffor istället för siffror, i enlighet med texifiering.md #31
- Extra radbrytning i enlighet med texifiering.md #5
- Förtydligande av prefixs syfte.
- Ändrar rubrik till ”Ekvation med en obekant” från ”Exempel med ..”
- Ändrar 1/2 till en/två i rubrik i Bilaga B, matematik.
- Ändrar förkortningen s.k. till så kallad(e) i Bilaga B, matematik.

### Fixat
- Formel rättad i avsnittet ”Exempel med 2 obekanta” i kapitlet ”Matematik”.
- Ändrat O till Q i rapportkoder för kommersiell sjö- och luftradiotrafik.

## [2.0.0-RC.1] – 2017-09-10
### Tillagt
- Första version 2.0.0-RC.1 och `git tag` v2.0.0-RC.1 satt.
- CEPT HAREC finns som detaljerat appendix med länkning till de textdelar som
  uppfyller dem.
- Alla HAREC-krav har tillgodosets.
- EMF-materialet inkluderat.
- _Isolation och jordning_ tillagd.

### Ändrat
- Elsäkerhetskapitlet uppdaterat.
- Hela materialet är överfört till LaTeX och [GitHub](https://github.com/SverigesSandareamatorer/SSA-Akademin).
- Stort antal putsningar av text.
- Anpassning till nu gällande certklasser och krav.
- Anpassning till nu gällande lag och PTS undantagsföreskrift.
- Anpassning till nu gällande ITU Radioreglemente.

### Borttaget
- Bilagan med uträkning av dB borttagen.

[Osläppt]: https://github.com/SverigesSandareamatorer/SSA-Akademin/compare/v2.6.0...HEAD
[2.6.0]: https://github.com/SverigesSandareamatorer/SSA-Akademin/compare/v2.5.0...v2.6.0
[2.5.0]: https://github.com/SverigesSandareamatorer/SSA-Akademin/compare/v2.4.0...v2.5.0
[2.4.0]: https://github.com/SverigesSandareamatorer/SSA-Akademin/compare/v2.3.0...v2.4.0
[2.3.0]: https://github.com/SverigesSandareamatorer/SSA-Akademin/compare/v2.2.0...v2.3.0
[2.2.0]: https://github.com/SverigesSandareamatorer/SSA-Akademin/compare/v2.1.0...v2.2.0
[2.1.0]: https://github.com/SverigesSandareamatorer/SSA-Akademin/compare/v2.0.0...v2.1.0
[2.0.0]: https://github.com/SverigesSandareamatorer/SSA-Akademin/compare/v2.0.0-RC.1...v2.0.0
[2.0.0-RC.1]: https://github.com/SverigesSandareamatorer/SSA-Akademin/compare/8141940...v2.0.0-RC.1
