# Ändringslogg
Alla nämnvärda ändringar i projektet dokumenteras här.

Det här projektet [för en ändringslogg](https://keepachangelog.com/sv/1.1.0/)
och följer [semantisk versionshantering](https://semver.org/lang/sv/spec/v2.0.0.html).

## [Osläppt] – 2025
### Tillagt
- Ny figur för schemasymbolen lysdiod.
- Nya introduktioner till kapitlen Ellära, Komponenter, Kretsar, Sändare och Trafikreglemente.
- Ny figur för ICNIRPcalc.
- Nya QR-koder för att lämna återkoppling på boken.
- Nytt appendix om åskskydd.
- Hänvisningar till andra kapitel i varje kapitelinledning.

### Ändrat
- Nya avsnittsnivåer i kapitel Ellära.
- Nya delavsnittsnivåer i _Effekt och energi_.
- Nya delavsnittsnivåer i _Internationell nödtrafik_.
- Ett räkneexempel om frekvens i 1.6 gjort tydligare.
- Flyttat Morsesignalering till en bilaga.
- Flytta in bilaga Prefixomvandlingstabell i bilaga Måttenheter.
- Nytt format för engelska förkortningar så dubbelparentes och kursiverade parenteser undviks.
- Ersatt Ursigram med Vågutbredningsprognoser.
- Flyttat litteraturförteckningen till mellan kapitel och bilagor.
- Flyttat skrivningen om hembyggd radiosändare till avsnittet om EMC.
- Exempel och historiska tillbakablickar markeras tydligare med textrutor.
- Modulation är ett eget kapitel istället för ett avsnitt i Ellära.
- Tydligare tabell om högeffekttillstånd.
- Slagit ihop de två appendixen med bandplaner till en.
- Nya avsnittsnivåer i kapitel Trafikreglemente.
- Loggbok flyttat in i Trafikreglemente.
- Modernisering av radioamatörens hederskod.
- Många illustrationer har omarbetats till vektorformat.
- Moderniserat text om QAM.
- Konsekvent användning av SVF istället för SWR i svenskspråkig text.
- Ersatt "SVF-meter" med "SVF-mätare" genomgående.
- Kapitlet om elektromagnetiska fält har omarbetats.
- ISBN-nummer uppdaterat för tredje upplagan.
- Uppdaterat referenser från PTSFS 2022:19 till PTSFS 2025:1 (träder i kraft 17 mars 2025).

### Fixat
- Ordet _mod_ har lagts till i sakregistret.
- Litteraturlistan följer praxis bättre vad gäller format.
- Två utspridda delar om DSP sammanslagna.
- Delar av inledningen utflyttade från förordet.
- Bytt ut "vetenskaplig notation" till "grundpotensform".
- Några bråktal i appendix Matematik får plats utan att påverka radhöjden.
- Rätt namn på broschyr om elolyckor i litteraturlistan.
- Primär och sekundär status borttaget från bilaga svensk frekvensplan.
- Rättat enstaka tecken på flera ställen.
- Moderniserat texten om WSJT(-X).
- Kapiteltitel för Sändare ändrad till "Sändare och transceivrar" både i innehållsförteckningen och på kapitelsidan.
- Avsnittsrubrik ändrad från "Transceiver" till "Transceivrar".
- Grammatikfel: tagit bort dubblering av ord "att att", "till till", "kan kan", "ett ett" och "olika olika" (7 förekomster).
- Rättat stavnings- och grammatikfel i ett stort antal kapitel- och bilagsfiler.

### Borttaget
- Text om integrationsgrad borttagen.
- Avsnittssammanfattning om PLL-styrd kortvågstransceiver borttagen.
- Flertal ord raderade från sakregistret.

## [2.6.1] – 2023-11-14
### Tillagt
- Nytt experimentellt byggmål för ebok i EPUB-format.

### Ändrat
- Förbättrade texter om simplex och halvduplex.

### Fixat
- Rättat enstaka tecken på många ställen i boken.
- Ändrat en död länk till IARU R1 bandplaner i referenslistan.
- ISBN-numret på tryckortssidan var fel.

### Borttaget
- Flera oanvända bildfiler raderade.

## [2.6.0] – 2023-03-22
### Ändrat
- Makron ändrade till de för siunitx 3.0.
- Releaseinstruktionen flyttad till wikin på GitHub.
- Fört in ändringar p.g.a nya lagar och föreskrifter:
  - Lag (2022:482) om elektronisk kommunikation
  - Förordning (2022:511) om elektronisk kommunikation
  - PTSFS 2022:19 föreskrifter om undantag från tillståndsplikt för användning av vissa radiosändare
  - PTSFS 2019:1 Post- och telestyrelsens allmänna råd om den svenska frekvensplanen

### Fixat
- En felkodad länk har rättats.
- Rättat skrivfel i bilaga med bandplaner.
- Lagt till saknad bandplan för 60-metersbandet i appendix.

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

[Osläppt]: https://github.com/SverigesSandareamatorer/SSA-Akademin/compare/v2.6.1...HEAD
[2.6.1]: https://github.com/SverigesSandareamatorer/SSA-Akademin/compare/v2.6.0...v2.6.1
[2.6.0]: https://github.com/SverigesSandareamatorer/SSA-Akademin/compare/v2.5.0...v2.6.0
[2.5.0]: https://github.com/SverigesSandareamatorer/SSA-Akademin/compare/v2.4.0...v2.5.0
[2.4.0]: https://github.com/SverigesSandareamatorer/SSA-Akademin/compare/v2.3.0...v2.4.0
[2.3.0]: https://github.com/SverigesSandareamatorer/SSA-Akademin/compare/v2.2.0...v2.3.0
[2.2.0]: https://github.com/SverigesSandareamatorer/SSA-Akademin/compare/v2.1.0...v2.2.0
[2.1.0]: https://github.com/SverigesSandareamatorer/SSA-Akademin/compare/v2.0.0...v2.1.0
[2.0.0]: https://github.com/SverigesSandareamatorer/SSA-Akademin/compare/v2.0.0-RC.1...v2.0.0
[2.0.0-RC.1]: https://github.com/SverigesSandareamatorer/SSA-Akademin/compare/8141940...v2.0.0-RC.1
