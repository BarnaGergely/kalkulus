# Határérték

## Mi az a határérték?

> Legyen az f(x) függvény értelmezve az x0 pont egy környezetében, kivéve esetleg az x0 pontot. Az f(x) függvénynek létezik az x0 pontban határértéke és ez „A”, ha bármely (∀) ε>0-hoz létezik (∃) olyan δ>0, hogy ha 0<|x-x0|<δ, akkor |f(x)-A|<ε.

Hát ebből egy szót nem értek, de ez a hivatalos definíció. (ez csak egy kis errettentés volt, hogy ne akarj szóbelizni ;) )

Kitalálom hogy én meg akarom nézni mi az f(x) határértéke a z helyen. Elkezdek szépen sétálni a z felé a számegyenesen (x tengelyen), egyre közelebb és közelebb érek hozzá, de sosem szabad rálépnem, sosem juthatok el z-ig, de végtelenül közel kerülhetek hozzá. Ha ezen a z-hez végtelenül közeli helyen megnézem mennyi a függvény értéke, a határértéket kapom. - Ez volt a szemléletes definíció, most nézzük a matematikus megfogalmazást.

Az értelmezési tartományunkban ne legyen benne az x0 pont (amiről meg akarjuk tudni hogy itt van e határérték): a környezete igen, de maga az x0 pont ne. Van határértéke x0-nak és ez a határérték A, ha bármilyen pozitív ε (epszilon)-t veszek, létezik hozzá olyan δ (delta), amire igaz az hogy 0<|x-x0|<δ, akkor |f(x)-A|<ε. - nem értem ):

### Határérték jelölése

$$\lim_{x \to x_0} f(x) = A$$

- $lim$-el (limesz) jelöljük hogy egy határértékről beszélünk
- $x \rightarrow x_0$ mutatja hogy melyik helyhez tart a függvény. pl. ha a 2 helyen érdekel minket a függvény határértéke, akkor $x \rightarrow 2$
- $A$ a függvény határértéke. Ezt kell általában kiszámolni.

## Nevezetes határértékek

Nem csak egy számhoz tarthat a limesz, hanem mondjuk végtelenhez, minusz végtelen vagy 0-hoz is. Van egy rakás alap függvény, aminek a limesz-ét tudni kell fejből a feladatok megoldásához. A függvények grafikonját talán még könyebb megtanulni mint ezt a táblázatot.

### Összeadás, kivonás

!!! abstract "Nevezetes határértékek"

    === "Egyszerű"

        |               | $x \to -\infty$ | $x \to 0$ | $x \to \infty$ |
        | ------------- | --------------- | --------- | -------------- |
        | $x$           | $-\infty$       | $0$       | $\infty$       |
        | $\frac{1}{x}$ | $0$             | -         | $0$            |
        | $x^2$         | $\infty$        | $0$       | $\infty$       |
        | $x^3$         | $-\infty$       | $0$       | $\infty$       |
        | $2^x$         |                 |           |                |
        | $e^x$         |                 |           |                |

    === "Osztás"

    === "Gyögvonás"
        |               | $x \to -\infty$ | $x \to 0$ | $x \to \infty$ |
        | ------------- | --------------- | --------- | -------------- |
        | $\sqrt{x}$    |                 |           |                |
        | $\sqrt[3]{x}$ |                 |           |                |

    === "Szögfüggvények"

        |                | $x \to -\infty$ | $x \to 0$ | $x \to \infty$ |
        | -------------- | --------------- | --------- | -------------- |
        | $sin{(x)}$     |                 |           |                |
        | $cos{(x)}$     |                 |           |                |
        | $tan{(x)}$     |                 |           |                |
        | $cot{(x)}$     |                 |           |                |
        | $arcsin{(x)}$  |                 |           |                |
        | $$arccos{(x)}$ |                 |           |                |
        | $arctan{(x)}$  |                 |           |                |
        | $arccot{(x)}$  |                 |           |                |

    === "Tangens"

### Szorzás, osztás

### Hatványozás, gyökvonás

### Logaritmus

### Szögfüggvények

$$\lim_{x \to \infty} 10*x = \infty$$

$$\lim_{x \to \infty} \frac{1}{x} = 0$$

$$\lim_{x \to \infty} \frac{1}{x^2} = 0$$

$$\lim_{x \to \infty} \frac{1}{x^k} = 0$$

$$\lim_{x \to \infty} x^2 = \infty$$

$$\lim_{x \to \infty} x^3 = \infty$$

$$\lim_{x \to \infty} x^k = \infty$$

$$\lim_{x \to \infty} \sqrt{x} = \infty$$

$$\lim_{x \to \infty} \sqrt{x^2} = \infty$$

$$\lim_{x \to \infty} \sqrt{x^k} = \infty$$

$$\lim_{x \to \infty} \frac{x}{2} = \infty$$

$$\lim_{x \to \infty} \frac{x}{3} = \infty$$

### - végtelen

$$\lim_{x \to -\infty} 10*x = -\infty$$

$$\lim_{x \to -\infty} \frac{1}{x} = 0$$

## Folytonos függvények határértéke

!!! note "Folytonosság"
Ha a függvény folytonos, akkor a határértéke megegyezik a fügvényértékkel.

Bízz bennem, így van, de ne akard bizonyítani. A nem folytonos függvényekre majd még kitérünk, most kezdjünk a folytonosokkal.

A legtöbb függvény, amikkel a vizsgán találkozni fogunk folytonos. Ekkor **a függvény határértéke egyenlő a függvény értékével** az adott pontban.

### Egyszerű eset

!!! example "Egyszerű folytonos függvény határértéke"

    === "Szám behelyettesítése"

        $$\lim_{x \to 2} \frac{x^3}{4} = ?$$

        Magyarul: Számoljuk ki a 2 helyen az $\frac{x^2}{2}$ határértékét. A függvény folytonos, ezért a határéték megeggyezik a függvényértékkel, csak be kell helyettesítenünk az x helyére a 2-t és megvan a határéték.

        $$\lim_{x \to 2} \frac{x^3}{4} \to \frac{2^3}{4} = 2$$

    === "Végtelen behelyettesítése"

        Nézzünk egy másik példát is:

        $$\lim_{x \to \infty} \frac{2x+6}{4} = ?$$

        $$\lim_{x \to \infty} \frac{2x+6}{4} \to  \frac{2 \cdot \infty+6}{4} = \frac{\infty}{4} = \infty$$

        Végetelent is simán be lehet helyettesíteni, de ilyenkor nagyon kell vigyázni, mert külön szabályok vannak a végtelen műveletekre.

### Végtelen műveletek

!!! abstract "Végtelen műveletek"

    === "Összeadás, kivonás"

        $$\infty + \infty = \infty$$

        $$\infty + szám = \infty$$

        $$\infty - \infty = -\infty + \infty = ?$$

        $$\infty - szám = \infty$$

        $$szám - \infty = -\infty$$

    === "Szorzás"

        $$\infty \cdot \infty = \infty$$

        $$\infty \cdot -\infty = -\infty$$

        $$\infty \cdot pozitív szám = \infty$$

        $$\infty \cdot negatív szám = -\infty$$

        $$\infty \cdot 0 = ?$$

        $$-\infty \cdot 0 = ?$$

    === "Osztás"

        $$\frac{\infty}{\infty} = ?$$

        $$\frac{-\infty}{-\infty} = ?$$

        $$\frac{\infty}{-\infty} = ?$$

        $$\frac{-\infty}{\infty} = ?$$

        $$\frac{\infty}{pozitív szám} = \infty$$

        $$\frac{\infty}{negatív szám} = -\infty$$

        $$\frac{-\infty}{pozitív szám} = -\infty$$

        $$\frac{-\infty}{negatív szám} = \infty$$

        $$\frac{pozitív szám}{\infty} = 0$$

        $$\frac{pozitív szám}{-\infty} = 0$$

        $$\frac{negatív szám}{\infty} = 0$$

        $$\frac{negatív szám}{-\infty} = 0$$

        $$\frac{0}{\infty} = 0$$

        $$\frac{0}{-\infty} = 0$$

        $$\frac{\infty}{0} = ?$$

        $$\frac{-\infty}{0} = ?$$

    === "Hatványozás"

        $$\infty^k = \infty$$

        $$\infty^2 = \infty$$

        $$\infty^{-2} =  \frac{1}{\infty^2} = 0$$

        Páros hatványok pozitívvá teszik:

        $$-\infty^2 = \infty$$

        Páratlan hatványok negatívan hagyják:

        $$-\infty^3 = -\infty$$

        $$2^\infty = \infty$$

        $$2^{-\infty} = \frac{1}{2^\infty} = 0$$

        $$0^\infty = 0$$

        $$\infty^0 = 1$$

    === "TODO: Gyökvonás"

        Todo:

**Ahhol kérdőjelet látsz, ott nem lehet ennyiből megmondani mennyi az eredmény.** A végtelen egy elég tág mértékegység, nem adja meg hogy pontosan mekkora az a végtelen. Ugye $\infty + 1 = \infty$ egyel nagyobb lett a végetelen mégis ugyan úgy hívjuk. Szóval a $\infty - \infty$ nagyjából annyira pontos megfogalmazás a matematika világában mint a $szám - szám$. Nem derül ki belőle pontosan mennyi az adott érték, ezért egy csomó művelet nem vagy csak trükkőzéssel végezhető el.

### Speciális esetek

10 000-ből 9999 esetben gyerekjáték meghatározni egy folytonos függvény határértékét, de ha valamelyik fenti kérdőjeles eset jön elő, nagyon nehéz. A vizsgán csakis ezt a pár nehéz esetet kérik, szóval a továbbiakban ezekkel foglalkozunk.

#### "∞/∞" tipusú határérték

Általában egy törthöz vagy egész számhoz tart, aránylag egyszerű megoldani.

##### Megoldás domináns tag kiemelésével

!!! example ""∞/∞" tipusú határérték megoldása domináns tag kiemelésével"

    === "Egyszerű kiemelés"

        $$
        \lim_{x \to \infty} \frac{n^2-2n}{3n^2-2} = ?
        $$

        Emeljük ki a számlálóban és a nevezőben szereplő kifejezés legnagyobb kitevőjű (domináns) x-es tagját.

        $$
        \lim_{x \to \infty} \frac{n^2-2n}{3n^2-2} = \lim_{x \to \infty} \frac{n^2 \cdot (1-\frac{2n}{n^2})} {n^2 \cdot (3 - \frac{2}{3n^2})} = \lim_{x \to \infty} \frac{n^2}{n^2} \cdot \frac{1-\frac{2n}{n^2}}{3 - \frac{2}{3n^2}} =
        $$

        $$
        = \lim_{x \to \infty} 1 \cdot \frac{1-\frac{2}{n}}{3 - \frac{2}{3n^2}} \to 1 \cdot \frac{1-\frac{2}{\infty}}{3 - \frac{2}{3\infty^2}} = \frac{1-0}{3-0} = \frac{1}{3}
        $$


        - Kiemelésnél minden tagot el kell osztani a számmal amit kiemeltünk
        - Ha egy számot elosztok önmagával az egy lesz: $\frac{4}{4} = 1$, $\frac{n^2}{n^2} = 1$
        - $\lim_{x \to \infty} 1/\infty \to 0$


        Sokszor több lehetséges kiemelés is létezik. Neked kell eldöntei melyiket érdemes választani. Pl. ez a feladat megoldható így is:

        $$
        \lim_{n \to \infty}\frac{n^2 - 2n}{3n^2 - 2} = \lim_{n \to \infty}\frac{n^2 \cdot (1 - \frac{2n}{n^2})}{3n^2 \cdot (1 - \frac{2}{3n^2})} = \lim_{n \to \infty}\frac{n^2}{3n^2} \cdot \frac{1 - \frac{2}{n}}{1 - \frac{2}{3n^2}} \to \frac{1}{3} \cdot \frac{1-0}{1-0} = \frac{1}{3}
        $$

    === "TODO: Gyökös kiemelés"

#### "0/0" tipusú határérték

0-val nem lehet osztani. Valahogy fel kell oldanunk ezt az ellentétet, amire több féle eszköz is kínálkozik. A továbbiakban alapvetően egyenlet rendezéssel oldjuk meg a feladatokat. Vizsgán is hasonlóra lehet majd számítani, ezért érdemes a különféle megoldási módokat jól begyakorolni.

#### "∞/0" tipusú határérték

#### "0/∞" tipusú határérték

#### "∞\*0" tipusú határérték
