# Texifiering av OCRad text.

Det är en hel del jobb för att konvertera den OCRade texten från Koncept till
någorlunda vettig LaTeX. Med tiden har detta utvecklats även till formatregler.

1.  OCRningen feltolkar flera tecken, så den har tolkat I ("Ivar") som l ("Ludvig"), 
    vilket man ser framförallt i inledning av mening. m kan tolkas som rn osv. 
    Därför behöver man hela tiden vara uppmärksam. I ("Ivar") har även blivit 
    1 ("ett") på en del ställen där siffror förekommer. Många av de grekiska tecknen 
    blir fel, så man får kontrollera med orginalet och justera.

2.  Eftersom orginalet är i två kolumner missar OCRen ibland och text hamnar i
    fel ordning. Man får vara uppmärksam på det och flytta runt text.

3.  Sid-numrering, sidmatning och toppen av sidan ligger kvar, ofta inkomplett.
    Vi låter det ligga kvar tills vi verkligen processar den delen av texten,
    eftersom det blir lättare att matcha mot orignalet. Sen tar vi bara
    bort det.

4.  För bilder har OCRen försökt tolka bilderna. När vi processar texten tar
    vi bort det line-noise det innebär och behåller bara bildreferensen och
    texten. I själva texten finns även en referens till vilken bild som skall
    vara där, den behåller vi också tills vidare, sen skall den döljas.

5.  Själva texten bryter vi om så den blir läsbar. Vi håller oss inom
    80-tecken per rad.

    Text skall övervägande brytas så att nya meningar bryts om så de börjar
    på ny rad, detta skall ses som ett obligatorium för ny text.
    Ett undantag från denna huvudregel är när två korta meningar får plats på
    samma rad.

    Denna regel handlar om att förändringar och uppdateringar i meningar skall
    ge rimligt läsbara diffar.

6.  För att förenkla markerar vi `\part{}` och `\chapter{}` så att det går
    att hitta delarna.
    Numer är \part{} borttaget då det ej fyller sitt syfte längre i nya
    utgåvan.

7.  När man processar en text så använder man `\section{}` för 1.1 nivån,
    `\subsection{}` för 1.1.1 nivån och `\subsubsection{}` för 1.1.1.1 nivån.
    En del onumrerade avsnitt finns och `\paragraph{}` är lämpligt.

8.  Text i kursiv still används för att indikera nyckelbegrepp och då används
    `\emph{}`.
    Nyckelbegrepp skall i förekommande fall även skrivas i sin engelska form,
    för att underlätta sökning på nätet och läsande av engelsk litteratur.
    Exempel:
    \emph{strömtransformator} (eng. \emph{current transformer})

9.  Viss text förekommer i kursiv stil och inskjuten, t.ex. för att ge viktiga
    samband, de läggs inom `\begin{quote}\emph{ och }\end{quote}`. Ibland
    behöver radmatning ske och då får man göra separata `\emph{}` som i det här
    exemplet:

    ```latex
    \begin{quote}
    \emph{Lika laddningar stöter bort varandra.}

    \emph{Olika laddningar drar varandra till sig.}
    \end{quote}
    ```

10. Alla formler latexas och kvarvarande "line-noise" tas bort.

11. Formler med enhetsangivelser och liknande referenser i text skall också
    latexas till formler. T.ex. `\(1\ joule\ [J]\)`. Notera hur mellanslagen är
    slashade för att det skall se bra ut i slutresultatet. Ha alltid mellanslag
    mellan värde och dess prefix och enhet.

    Kommentar: I matematiska formler där enheter ingår bör man
    omgärda enheter och storheter med `\mathrm{}` då det är bara
    variabler som skall sättas kursivt egentligen. Om man vill undvika
    radbrytning mellan mätetal och enhet kan man använda sig av
    tecknet `~` (tilde) i löpande text, exempelvis *"...dipolantennen har
    2,15~dB mer förstärkning än en tänkt isotrop antenn som strålar
    lika i alla riktningar..."*. Slutligen

12. Tabeller latexas givetvis.

    Kommentar: Tabeller som riskerar att sidbrytas men som man
    inte vill göra en float av (för det blir meckigt om de hamnar före
    eller efter det refererande stycket) kan man köra longtable
    på. Slå upp det på webben eller i hundboken. Longtable kan
    sidbrytas snyggt.

13. Avsnitt markeras med vilken eller vilka HAREC krav som de uppfyller.
    `\textbf{HAREC a.\ref{HAREC.a.1.1.1}\label{myHAREC.a.1.1.1}}`

    `\ref{HAREC.a.1.1.1}` gör att man får en pekare på kravet i texten.

    `\label{myHAREC.a.1.1.1}` gör att HAREC-sammanställningen kan visa var HAREC
    krav a.1.1.1 uppfylls.

14. Tabeller och bilder skall ha `\caption{}` och skall ha `\label{}` samt
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

    	\hilight{TODO: Här ser det lite fel ut.}

    Det är behändigt att kunna söka på TODO:, och `\hilight{}` ger en gul
    markör i texten så vi vet när vi läser att här är något vi skall åtgärda.
    Alla TODOs skall åtgärdas innan release.

    En sammanställning av alla TODOs görs med make TODOs som producerar filen 
    TODOs, listar antalet. Den inkluderar flera andra källor av saker som skall 
    åtgärdas innan release.

18. Lägg in `\dfrac` på formler med nedsänkta tecken då det blir tydligare
    att läsa.

19. Lägg in \, som tusentalsavskiljare/

20. Bildreferenserna har i ursprungliga Koncept gjorts som en separat rad.
    De skall i möjligaste mån integreras med själva texten. På samma sätt skall
    även tabeller refereras från texten.
    "I bild 3.16 illustreras..."
    "... illustreras av bild 3.17"

21. Grekiska bokstäver som mu, Omega mm. skall INTE läggas in som UNICODE tecken
    utan läggas in som \(\mu\) i löpande text och \mu (notera mellanslag efter
    u) i Math-environment. Det visar sig att UNICODE inte rendrerar rätt för
    alla dessa.

22. Tecknet för grader ° skall kodas som \degree.
    Skall det vara mellanslag efter, så behövs ofta ett hårt mellanslag med ~
    för annars kommer mellanslaget kernas bort.
    För grader celsius behövs ett mellanslag innan C, dvs. \degree C

23. Nyckelbegrepp skall indexeras dels där de introduceras och definieras,
    men även på de ställen där de används och det kan vara läsvärt för att
    förstå dem och dess användning. En enkel användning är
    \index{strömtransformator}

    För vissa begrepp är det nyttigt att samla gemensamma grupper, det
    gör man genom att ange
    \index{transformator!ström-}
    där transformator är gruppens namn, och efter utropstecknet kommer det
    som skall stå i gruppen.

    Symboler läggs i gruppen symboler, anger symbolen först och sedan de
    representerar, men indexeras givetvis separat också:
    \index{kapacitans}
    \index{symbol!C kapacitans}

    Enheter indexeras givetvis med sin förkortning inom parantes både separat
    och i gruppen enheter:
    \index{farad (F)}
    \index{enheter!farad (F)}
    
    Enheter skrivs ut med liten begynnelsebokstav. Skriv "hertz" och "volt" i stället för "Hertz" och "Volt".

24. Referenser mellan olika delar görs genom att sätta en label och sedan
    referera till den. Det uppmuntras att skapa sådana länkar så man fort kan
    hitta relevant kompelterande material direkt istället för att behöva söka
    via index. I PDFen ger det klickbara länkar.

    \label{kapacitans}
    Förmågan att lagra elektrisk energi (elektrisk laddning) kallas
    \emph{kapacitans} (eng. \emph{capacitance}).

    ...

    Reaktansen beror på kapacitans, se kapitel \ref{kapacitans}

25. Referens till externa dokument, böcker mm skall göras och det uppmuntras.
    De läggs till i filen koncept.bib i BiBTeX format, och en nyckeln-fras
    används, t.ex. ITU-RR. I förekommande fall skall länk till dokumentet
    läggas med i referensen. Man refererar sedan med \cite{} för att peka på
    hela dokumentet:

    \cite{ITU-RR}

    För att referera till ett visst kapitel anger man det inom hakparanteser:

    \cite[1.56]{ITU-RR}

26. I förekommande fall skall SI-enheter och definitioner användas och
    refereras. SI-enheter refereras till med små bokstäver även om de bygger
    på person-namn, t.ex. ohm. Följ SI-brochyrens stil.

27. Konstanter skall anges med full definition och approximativt värde.
    Övrig användning kan gott använda approximation av adekvat precission.
    T.ex. där ljusets hastighet används skall den i SI-systemet angivna
    definitionen användas, men även approximationen av 3*10^8.

28. Förkortningar skall anges som brukligt inom parantes efter sin uttydelse
    där de definieras, vilket i möjligaste mån är första gången de används,
    och framgent kan förkortningen användas.
    I möjligaste mån är att ibland används förkortningar i förbigående innan
    de har en naturlig kontext att definieras i, för de fallen skall förkortning
    användas och definitionen där det är ett bra kontext.

    Tankstreck mellan förkortning och uttydning skall INTE användas.

    Exempel:
    Vector Network Analyzer (VNA)

29. Tankstreck, kodas med `--`, skall användas sparsamt.

30. Förkortningar så som osv, etc, t.ex. bl.a. öht. ska skrivas ut i sin helhet,
    utom i parenteser och tabeller.

31. Tal upp till tolv skrivs med bokstäver. Tal från 13 och uppåt skrivs med siffror.

32. LaTeX skrivs med två mellanslag som tab.

33. Undvik sammansättningar med bindestreck, skriv hellre ihop. 
    Skriv "satellitmottagare" i stället för "satellit-mottagare". 
    Bindestreck ska dock användas i sammansättningar med förkortningar;
    skriv "FM-detektor" istället för "FM detektor".

