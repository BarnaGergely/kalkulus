# Határérték

## Mi az a határérték?

>  Legyen az f(x) függvény értelmezve az x0 pont egy környezetében, kivéve esetleg az x0 pontot. Az f(x) függvénynek létezik az x0 pontban határértéke és ez „A”, ha bármely (∀) ε>0-hoz létezik (∃) olyan δ>0, hogy ha 0<|x-x0|<δ, akkor |f(x)-A|<ε.

Hát ebből egy szót nem értek, de ez a hivatalos definíció. (ez csak egy kis errettentés volt, hogy ne akarj szóbelizni ;) )

Kitalálom hogy én meg akarom nézni mi az f(x) határértéke a z helyen. Elkezdek szépen sétálni a z felé a számegyenesen (x tengelyen), egyre közelebb és közelebb érek hozzá, de sosem szabad rálépnem, sosem juthatok el z-ig, de végtelenül közel kerülhetek hozzá. Ha ezen a z-hez végtelenül közeli helyen megnézem mennyi a függvény értéke, a határértéket kapom. - Ez volt a szemléletes definíció, most nézzük a matematikus megfogalmazást.

Az értelmezési tartományunkban ne legyen benne az x0 pont (amiről meg akarjuk tudni hogy folytonos e): a környezete igen, de maga az x0 pont ne. Van határértéke x0-nak és ez a határérték A, ha bármilyen pozitív ε (epszilon)-t veszek, létezik hozzá olyan δ (delta), amire igaz az hogy 0<|x-x0|<δ, akkor |f(x)-A|<ε. - nem értem ):

### Határérték jelölése

$$\lim_{x \to x_0} f(x) = A$$

- $lim$-el (limesz) jelöljük hogy egy határértékről beszélünk
- $x \rightarrow x_0$ mutatja hogy melyik helyhez tart a függvény. pl. ha a 2 helyen érdekel minket a függvény határértéke, akkor $x \rightarrow 2$
- $A$ a függvény határértéke. Ezt kell általában kiszámolni.

## Nevezetes határértékek

Nem csak egy számhoz tarthat a limesz, hanem mondjuk végtelenhez, minusz végtelen vagy 0-hoz is. Van egy rakás alap függvény, aminek a limesz-ét tudni kell fejből a feladatok megoldásához.

### Összeadás, kivonás

| $\lim_{x \to \infty}$ | $\lim_{x \to -\infty}$ |
| --------------------- | ---------------------- |
| $x \to \infty$        | $x \to -\infty$        |
| $x+10 \to \infty$     | $x+10 \to -\infty$     |
| $1-x \to -\infty$     | $1-x \to \infty$       |

### Szorzás, osztás

### Hatványozás, gyökvonás

### Logaritmus

### Szögfüggvények

$$\lim_{x \to \infty} 10*x = \infty$$

$$\lim_{x \to \infty} \frac{1}{x} = 0$$

$$\lim_{x \to \infty} x^2 = \infty$$

$$\lim_{x \to \infty} x^1/2 = $$

$$\lim_{x \to \infty} x^3 = \infty$$

$$\lim_{x \to \infty} x^1/3 = $$

### - végtelen


$$\lim_{x \to -\infty} 10*x = -\infty$$

$$\lim_{x \to -\infty} \frac{1}{x} = 0$$


## Folytonos függvények határértéke

!!! note "Folytonosság"
    Ha a függvény folytonos, akkor a határértéke megegyezik a fügvényértékkel.

Bízz bennem, így van, de ne akard bizonyítani. A nem folytonos függvényekre majd még kitérünk, most kezdjünk a folytonosokkal.

A legtöbb függvény, amikkel a vizsgán találkozni fogunk folytonos. Ekkor **a függvény határértéke egyenlő a függvény értékével** az adott pontban.

### Egyszerű eset

$$\lim_{x \to 2} \frac{x^2}{2} = ?$$

Magyarul: Számoljuk ki a 2 helyen az $\frac{x^2}{2}$ határértékét. A függvény folytonos, ezért a határéték megeggyezik a függvényértékkel, csak be kell helyettesítenünk az x helyére a 2-t és megvan a határéték.

$$\lim_{x \to 2} \frac{x^2}{2} = \frac{2^2}{2} = 2$$

Ez kicsit már túl egyszerűnek tűnik? - 10 000-ből 9999 esetben gyerekjáték meghatározni egy folytonos függvény határértékét, de van néhány undorító speciális eset, amikor nagyon nehéz. A vizsgán csakis ezt a pár nehéz esetet kérik, szóval a továbbiakban ezekkel foglalkozunk.

### "0/0" tipusú határérték

0-val nem lehet osztani. Valahogy fel kell oldanunk ezt az ellentétet, amire söbb féle eszköz is kínálkozik. A továbbiakban alapvetően egyenlet rendezéssel oldjuk meg a feladatokat. Vizsgán is hasonlóra lehet majd számítani, ezért érdemes a különféle megoldási módokat jól begyakorolni.



#### "∞/∞" tipusú határérték

##### Megoldás domináns tag kiemeléssel

$$\lim_{n \to \infty}\frac{n^2 - 2n}{3n^2 - 2} = \lim_{n \to \infty}\frac{n^2(1 - \frac{2n}{n^2})}{3n^2(1 - \frac{2}{3n^2})} = \lim_{n \to \infty}\frac{n^2}{3n^2} * \frac{(1 - \frac{2}{n})}{(1 - \frac{2}{3n^2})} = \frac{1}{3}*\frac{1-0}{1-0} = \frac{1}{3}$$

Emeljük ki a számlálóban és a nevezőben szereplő kifejezés legnagyobb kitevőjű (domináns) tagját.

#### "∞/0" tipusú határérték

#### "0/∞" tipusú határérték

#### "∞*0" tipusú határérték