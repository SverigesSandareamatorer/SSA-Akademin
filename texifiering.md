# Texifiering av OCRad text.

Det är en hel del jobb för att konvertera den OCRade texten från Koncept till
någorlunda vettig LaTeX.

1.  OCRningen feltolkar flera tecken, så den har tolkat I som l, vilket man ser
    framförallt i inledning av mening. m kan tolkas som rn osv. Därför behöver
    man hela tiden vara uppmärksam. I har även blivit 1 på en del ställen där
    siffror förekommer.

2.  Eftersom orginalet är i två kolumner missar OCRen ibland och text hamnar i
    fel ordning. Man får vara uppmärksam på det och flytta runt text.

3.  Sid-numrering, sidmatning och toppen av sidan ligger kvar, ofta inkomplett.
    Jag låter det ligga kvar tills jag verkligen processar den delen av texten,
    för det gör att det blir lättare att matcha mot orignalet. Sen tar jag bara
    bort det, för vi behöver det inte.

4.  För bilder har OCRen försökt tolka bilderna. När jag processar texten tar
    jag bort det line-noise det innebär och behåller bara bild-referensen och
    texten. I själva texten finns även en referens till vilken bild som skall
    vara	där, den behåller jag också tills vidare, sen skall de döljas.

5.  Själva texten bryter jag om så den blir läsbar. Jag håller mig inom
    80-tecken bredd i min Emacs.

    Text skall övervägande brytas så att nya meningar bryts om så de börjar
    på ny rad, detta skall ses som ett obligatorium för ny text.
    Ett undantag från denna huvudregel är när två korta meningar får plats på
    samma rad.

    Denna regel handlar om att förändringar och uppdateringar i meningar skall
    ge rimligt läsbara diffar.

6.  För att förenkla har jag markerat `\part{}` och `\chapter{}` så att det går att
    hitta delarna.

7.  När man processar en text så använder man `\section{}` för 1.1 nivån,
    `\subsection{}` för 1.1.1 nivån och `\subsubsection{}` för 1.1.1.1 nivån.
    En del onumrerade avsnitt finns och `\paragraph{}` är lämpligt.

8.  Text i kursiv still används för att indikera nyckelbegrepp och då används
    `\emph{}`.

9.  Viss text förekommer i kursiv stil och inskjuten, t.ex. för att ge viktiga
    samband, de läggs inom `\begin{quote}\emph{ och }\end{quote}`. Ibland behöver
    radmatning ske och då får man göra separata `\emph{}` som i det här exemplet:
    
    ```latex
    \begin{quote}
    \emph{Lika laddningar stöter bort varandra.}
    
    \emph{Olika laddningar drar varandra till sig.}
    \end{quote}
    ```

10. Alla formler latexas och kvarvarande "line-noise" tas bort.

11. Formler med enhetsangivelser och liknande referenser i text skall också
    latexas till formler. T.ex. `\(1\ Joule\ [J]\)`. Notera hur mellanslagen är
    slashade för att det skall se bra ut i slutresultatet. Ha alltid mellanslag
    mellan värde och dess prefix och enhet.

    Anders kommentar: I matermatiska formler där enheter ingår bör man
    omgärda enheter och storheter med `\mathrm{}` då det är bara
    variabler som skall sättas kursivt egentligen. Om man vill undvika
    radbrytning mellan mätetal och enhet så kan man använda sig av
    tecknet `~` (tilde) i löpande text, exempelvis *"...dipolantennen har
    2,15~dB mer förstärkning än en tänkt isotrop antenn som strålar
    lika i alla riktningar..."*. Slutligen

12. Tabeller latexas givetvis.

    Anders kommentar: Tabeller som riskerar att sidbrytas men som man
    inte vill göra en float av (för det blir meckigt om de hamnar före
    eller efter det refererande stycket) kan man köra longtable
    på. Slå upp det på webben eller i hundboken. Longtable kan
    nämligen sidbrytas snyggt.
    
13. Avsnitt markeras med vilken eller vilka HAREC krav som de uppfyller.
    `\textbf{HAREC a.\ref{HAREC.a.1.1.1}\label{myHAREC.a.1.1.1}}`

    `\ref{HAREC.a.1.1.1}` gör att man får en pekare på kravet i texten.

    `\label{myHAREC.a.1.1.1}` gör att HAREC-sammanställningen kan visa var HAREC
    krav a.1.1.1 uppfylls.

14. Tabeller och bilder skall ha `\caption{}` och skall ha `\label{}` samt refereras
    till från texten. Det gör att automatisk sammanställning av bilder och
    tabeller kan ske, samt förstås gör det enkelt för alla läsare att se vilken
    bild/tabell som hör till texten.

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

    Det är behändigt att kunna söka på TODO:, och `\hilight{}` ger en gul markör i
    texten så vi vet när vi läser att här är något vi skall åtgärda.

18. Har lagt i `\dfrac` på formler med nedsänkta tecken då det blir tydligare
    att läsa. /NTJ

19. har lagt in \, som tusentalsavskiljare/ NTJ
