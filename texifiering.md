# Typsättning av OCR:ad text

Det är en hel del jobb för att konvertera den OCR:ade texten från KonCEPT till
någorlunda vettig LaTeX. Med tiden har detta utvecklats även till formatregler.

1.  OCRningen feltolkar flera tecken, så den har tolkat I (”Ivar”) som l (”Ludvig”),
    vilket man ser framförallt i inledning av mening. m kan tolkas som rn osv.
    Därför behöver man hela tiden vara uppmärksam. I (”Ivar”) har även blivit
    1 (”ett”) på en del ställen där siffror förekommer. Många av de grekiska tecknen
    blir fel, så man får kontrollera med originalet och justera.

2.  Eftersom originalet är i två kolumner missar OCR:en ibland och text hamnar i
    fel ordning. Man får vara uppmärksam på det och flytta runt text.

3.  Sidnumrering, sidmatning och toppen av sidan ligger kvar, ofta inkomplett.
    Vi låter det ligga kvar tills vi verkligen processar den delen av texten,
    eftersom det blir lättare att matcha mot originalet. Sen tar vi bara
    bort det.

4.  För bilder har OCR:en försökt tolka bilderna. När vi processar texten tar
    vi bort det line-noise det innebär och behåller bara bildreferensen och
    texten. I själva texten finns även en referens till vilken bild som ska
    vara där, den behåller vi också tills vidare, sen ska den döljas.

5.  Själva innehållstexten bryter vi om så den blir läsbar. Vi håller oss till
    maximalt 80&nbsp;tecken per kodrad.

    Text ska brytas så att nya meningar bryts om så de börjar på ny rad.
    Denna regel handlar om att förändringar och uppdateringar i meningar ska
    ge rimligt läsbara diffar.
    Ett undantag från denna huvudregel är när två korta meningar får plats på
    samma rad.

6.  För att förenkla markerar vi kapitlen med `\chapter{}`.

7.  När man processar en text så använder man `\section{}` för 1.1 nivån,
    `\subsection{}` för 1.1.1 nivån och `\subsubsection{}` för 1.1.1.1 nivån.
    En del onumrerade avsnitt finns och `\paragraph{}` är lämpligt.

8.  Text i kursiv stil används för att indikera nyckelbegrepp och då används
    `\emph{}`.
    Nyckelbegrepp ska i förekommande fall även skrivas i sin engelska form,
    för att underlätta sökning på nätet och läsande av engelsk litteratur.
    Exempel: `\emph{strömtransformator} (eng. \emph{current transformer})`

9.  Viss text förekommer i kursiv stil och inskjuten, t.ex. för att ge viktiga
    samband, de läggs inom `\begin{quote}\emph{` och `}\end{quote}`. Ibland
    behöver radmatning ske och då får man göra separata `\emph{}` som i det här
    exemplet:

    ```latex
    \begin{quote}
    \emph{Lika laddningar stöter bort varandra.}

    \emph{Olika laddningar drar varandra till sig.}
    \end{quote}
    ```

10. Alla formler typsätts och kvarvarande ”line-noise” tas bort.

11. Formler med enhetsangivelser och liknande referenser i text ska också
    typsättas till formler med hjälp av siunitx. T.ex. `\qty{1}{\joule}`.

    Tal som är längre eller har högre precision än ”vardagliga tal” ska
    typsättas med `\num{250000}` som exempel. Dessa kommer då typsättas korrekt
    så att de får rätt avstånd och separation.

    Enheter typsätts t.ex. med `\unit{kg.m/s^2}` för att få kilogrammeter per sekund-
    kvadrat. För en komplett lista av enheter som siunitx förstår, se paketets
    dokumentation.

12. Tabeller typsätts givetvis.

    Kommentar: Tabeller som riskerar att sidbrytas men som man
    inte vill göra en float av (för det blir meckigt om de hamnar före
    eller efter det refererande stycket) kan man köra xtabular
    på. Slå upp det på webben eller i hundboken. Xtabular kan
    sidbrytas snyggt, även i 2-kolumner.

13. Avsnitt markeras med vilken eller vilka HAREC-krav som de uppfyller.
    `\textbf{HAREC a.\ref{HAREC.a.1.1.1}\label{myHAREC.a.1.1.1}}`

    `\ref{HAREC.a.1.1.1}` gör att man får en pekare på kravet i texten.

    `\label{myHAREC.a.1.1.1}` gör att HAREC-sammanställningen kan visa var HAREC
    krav a.1.1.1 uppfylls.

14. Tabeller och bilder ska ha `\caption{}` och ska ha `\label{}` samt
    refereras från texten. Det gör att automatisk sammanställning av
    bilder och tabeller kan ske, samt förstås gör det enkelt för alla läsare
    att se vilken bild/tabell som hör till texten.
    Det hjälper även LaTeX att rendrera så att bilder och tabeller hamnar nära
    där de används.

15. Understrukna ord väljer vi att använda fetstil på, dvs. markera med
    `\textbf{}`

16. Bilder inkluderas med

    ```latex
    \begin{figure}[h]
    \begin{center}
    \includegraphics[width=7cm]{images/bild_2_1-15}
    \caption{Våginterferens}
    \label{fig:BildII1-15}
    \end{center}
    \end{figure}

    Bild \ref{fig:BildII1-15}

    \begin{figure*}[h]
    \begin{center}
    \includegraphics[width=14cm]{images/bild_2_1-15}
    \caption{Våginterferens}
    \label{fig:BildII1-15}
    \end{center}
    \end{figure*}

    Bild \ref{fig:BildII1-15}
    ```

17. Kommentarer vi har som del av den editoriella bearbetningen lägger vi
    synligt i texten med följande format:

    ```latex
    \hilight{TODO: Här ser det lite fel ut.}
    ```

    Det är behändigt att kunna söka på TODO:, och `\hilight{}` ger en gul
    markör i texten så vi vet när vi läser att här är något vi ska åtgärda.
    Alla TODOs ska åtgärdas innan release.

    En sammanställning av alla TODOs görs med make TODOs som producerar filen
    TODOs, listar antalet. Den inkluderar flera andra källor av saker som ska
    åtgärdas innan release.

18. Lägg in `\dfrac` på formler med nedsänkta tecken då det blir tydligare
    att läsa.

19. Tusentalsavskiljare läggs in med `\num{}` t.ex. `\num{9000000}`.

20. Bildreferenserna har i ursprungliga Koncept gjorts som en separat rad.
    De ska i möjligaste mån integreras med själva texten. På samma sätt ska
    även tabeller refereras från texten.
    ”I bild 3.16 illustreras...”
    ”... illustreras av bild 3.17”

21. Grekiska bokstäver som mu, Omega mm. ska INTE läggas in som Unicode-tecken
    utan läggas in som `\(\mu\)` i löpande text och \mu (notera mellanslag efter
    u) i Math-environment. Det visar sig att Unicode inte rendrerar rätt för
    alla dessa.

22. Grader kodas med `\ang{}` t.ex. `\ang{90}`.

23. Nyckelbegrepp ska indexeras dels där de introduceras och definieras,
    men även på de ställen där de används och det kan vara läsvärt för att
    förstå dem och dess användning. En enkel användning är
    `\index{strömtransformator}`

    För vissa begrepp är det nyttigt att samla gemensamma grupper, det
    gör man genom att ange `\index{transformator!ström-}` där transformator är
    gruppens namn, och efter utropstecknet kommer det som ska stå i gruppen.

    Symboler läggs i gruppen symboler, anger symbolen först och sedan de
    representerar, men indexeras givetvis separat också:
    ```latex
    \index{kapacitans}
    \index{symbol!C kapacitans}
    ```

    Enheter indexeras givetvis med sin förkortning inom parantes både separat
    och i gruppen enheter:
    ```latex
    \index{farad (F)}
    \index{enheter!farad (F)}
    ```

    Enheter skrivs ut med liten begynnelsebokstav. Skriv ”hertz” och ”volt” i
    stället för ”Hertz” och ”Volt” om man inte refererar till namnen på de personer
    som gett namn till enheterna.

24. Referenser mellan olika delar görs genom att sätta en `\label{}` och sedan
    referera till den.
    Använd inte bokstäverna ÅÄÖ i label-namnet! Använd de vedertagna prefixen!
    Det uppmuntras att skapa sådana länkar så man fort kan hitta relevant
    kompletterande material direkt istället för att behöva söka via sakregistret.
    I PDF:en ger det klickbara länkar.

    ```latex
	\section{Kapacitans}
    \label{sec:kapacitans}
    Förmågan att lagra elektrisk energi (elektrisk laddning) kallas
    \emph{kapacitans} (eng. \emph{capacitance}).

    ...

    Reaktansen beror på kapacitans, se kapitel~\ref{sec:kapacitans}
    ```

25. Referens till externa dokument, böcker m.m. ska göras och det uppmuntras.
    De läggs till i filen koncept.bib i BiBTeX-format, och en nyckeln-fras
    används, t.ex. ITU-RR. I förekommande fall ska länk till dokumentet
    läggas med i referensen. Man refererar sedan med `\cite{}` för att peka på
    hela dokumentet: `\cite{ITU-RR}`.
    För att referera till ett visst kapitel anger man det inom hakparanteser:
    `\cite[1.56]{ITU-RR}`.

26. I förekommande fall ska SI-enheter och definitioner användas och
    refereras. SI-enheter refereras till med små bokstäver även om de bygger
    på personnamn, t.ex. ohm. Följ SI-brochyrens stil.

27. Konstanter ska anges med full definition och approximativt värde.
    Övrig användning kan gott använda approximation av adekvat precision.
    T.ex. där ljusets hastighet används ska den i SI-systemet angivna
    definitionen användas, men även approximationen av 3&sdot;10<sup>8</sup>,
    300&nbsp;000&nbsp;km/s.

28. Förkortningar ska anges som brukligt inom parantes efter sin uttydelse
    där de definieras, vilket i möjligaste mån är första gången de används,
    och framgent kan förkortningen användas.
    I möjligaste mån är att ibland används förkortningar i förbigående innan
    de har en naturlig kontext att definieras i, för de fallen ska förkortning
    användas och definitionen där det är ett bra kontext.

    Tankstreck mellan förkortning och uttydning ska INTE användas.

    Exempel:
    Vector Network Analyzer (VNA)

29. Tankstreck, kodas med `--`, ska användas sparsamt.

30. Förkortningar så som osv, etc, t.ex. bl.a. öht. ska skrivas ut i
    sin helhet, utom i parenteser och tabeller.

31. Tal upp till tolv skrivs med bokstäver. Tal från 13 och uppåt skrivs med
    siffror.

32. Indentering föreskrivt med hård tabb.

33. Undvik sammansättningar med bindestreck, skriv hellre ihop. Skriv
    ”satellitmottagare” i stället för ”satellit-mottagare”. Bindestreck ska dock
    användas i sammansättningar med förkortningar; skriv ”FM-detektor” istället
    för ”FM detektor”.
