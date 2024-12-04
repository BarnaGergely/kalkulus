# Alkstat ZH2 segédlet

Nem vagyok matematikus, csak túl akarok már esni ezen, ha hibát találsz, nyugodtan javítsd.

## Videós segédlet

- Binomiális és khi-négyzet teszt valószínűségek tesztelésére.
[ttps://youtu.be/I7CToIF09kQ](https://youtu.be/I7CToIF09kQ)
- Normalitás tesztelése: khi-négyzet teszt illeszkedésre, Kolmogorov-Szmirnov
teszt. [https://youtu.be/Whm8Yb6AkUA](https://youtu.be/Whm8Yb6AkUA)
- Kétmintás Kolmogorov-Szmirnov próba. [https://youtu.be/vX0vNpMS2Jw](https://youtu.be/vX0vNpMS2Jw)
- Khi-négyzet teszt homogenitás tesztelésére. [https://youtu.be/-zbfY7LPH9g](https://youtu.be/-zbfY7LPH9g)
- Függetlenség tesztelése: khi-négyzet próba, Spearman- és Pearson-féle
korrelációs teszt. [https://youtu.be/iK-XOKjc750](https://youtu.be/iK-XOKjc750)
- Korreláció elemzése, tesztelése: [https://youtu.be/fUHiC_vxWfk](https://youtu.be/fUHiC_vxWfk)
- Regresszió. [https://youtu.be/YYgz8LmrGr4](https://youtu.be/YYgz8LmrGr4)
- Lineáris regresszió. (Tömörebb változat.) [https://youtu.be/kCrCLZAQeKw](https://youtu.be/kCrCLZAQeKw)

## Megoldás lépései

0. Beolvasod az adatot szeparátor karakterre és tizedes vesszőre nagyon figyelve!!!
1. Megnézed diszkrét e a minta
2. Kiválasztod milyen próba kell (osszefoglalo.pdf segít)
3. Megkeresed a segédanyagokban a próbát
4. Lemásolod és használod

## Adat kiemelés puska

```r
weight <- adatok$weight[adatok$group == "ctrl"] # weight változóban tároljuk azokat a weight értékeket, amelyekhez tartozó group változó "ctrl" értékű

változó = változó[oszlopSzűrésiFeltétel, sorSzűrésiFeltétel]
# TODO: Nem tudom biztosan ki kell e tenni a vessszőt ha a második feltétel nincs megadva

tomb = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1/4)
tomb = tomb[1:5] # Az első 5 elemet adja vissza
tomb = tomb[tomb > 5] # Azokat az elemeket adja vissza, amelyek nagyobbak 5-nél
tomb = tomb[tomb == 2 || tomb == 4] # Azokat az elemeket adja vissza, amelyek 2 vagy 4
```

## Egy mintáról hogyan tudom eldönteni, hogy diszkrét e?

- **Diszkrét:** konkrét értékeket tud felvenni, pl egy ember lehet 158 centi magas, vagy 160.
  - általában nem sok féle érték van bennük és egyértelmű kategóriákba szétvehetők, ha szöveges cucc akkor csak diszkrét lehet pl beteg nem beteg vagy valami, vagy ha 1 2 3 értékek lehetnek a változóba akkor az 3 kategória
- **Folytonos:** intervallumon belül bármilyen értéket felvehet és nem lehet kategóriákra szétszedni mert lenne vagy 100 vagy több is, ilyen a magasság, testsúly, meg úgy általánosságba "mérhető" adatok, (általában életkor is folytonos de ha pl azt mondják hogy 10-24 , 25-36, 37-50 korú csoportokra osztják és valamelyikbe van benne akkor diszkrét, és ezt ugye bármilyen ilyen folytonossal eljátszható az a diszkretizálás ha jól tudom, ilyen nem lesz elvileg)

## Próbák

Nem lesz olyan feladat ahol több féle próbával is meg lehet oldani, csak egy lesz helyes.

![orai.jpg](orai.jpg)

### Valószínűség tesztelése

- **Binomiális teszt:** igaz/hamis értékek eloszlásának aránya (pl. érme dobás, győzelem/vereség)
- **khi-négyzet próba valószínűségek tesztelésére (szerintem nem lesz ZH-ban):** Kis minta esetén Warningot dob, ilyenkor nem tudunk dönteni.
  - `#!r chisq.test(table(dobasok), p = c(0.5, 0.5))`

### Eloszlás tesztelése (eloszlás egy adott fügvénnyel egyenlő e)

- **FOLYTONOS | Egymintás Kolmogorov–Szmirnov-próba:** folytonos minta eloszlása megegyezik e egy elméleti eloszlással (pl. normális eloszlású e a minta)
- **FOLYTONOS | Kétmintás Kolmogorov–Szmirnov-próba:** két független folytonos minta eloszlása megegyezik e (pl. két csoport közötti különbség)
- **DISZKRÉT | khi-négyzet próba becsléses illeszkedés tesztelésére:** diszkrét, akár kategóriakra bontott minta eloszlása megfelel-e egy elméleti eloszlásnak. normalitás tesztelésére használtuk.
  - `#!r pearson.test(v)`

### Hommogenitás tesztelése (azonos e két változó eloszlása)

- **FOLYTONOS | Kolmogorov–Szmirnov-próba (pirsson normalitásra):** TODO: utána nézni ez mi
- **DISZKRÉT | khi-négyzet próba homogenitás tesztelésére:** gyakoriság táblázat segítségével teszteljük megegyezik e a két kategorizált diszkrét változó eloszlása
  - `#!r chisq.test(table(adatok$adostip, adatok$tipus))`

### Függetlenség, összefüggés tesztelése (Kapcsolat erősségének vizsgálata)

- **FOLYTONOS | Spearman-féle kollerációteszt:** két folytonos összetartozó minták függetlenségének tesztelése (pl. tanulási idő és eredmény)
- **FOLYTONOS, NUMERIKUS | Pearson-féle korrelációteszt:** folytonos, összetartozó és normál eloszlású vagy nagy minták függetlenségének tesztelése (pl. tanulási idő és eredmény)
- **DISZKRÉT | khi-négyzet próba függetlenség tesztelésére:** diszkrét változók közötti függetlenség tesztelése
  - `#!r chisq.test(adatok$education, adatok$region)`

### egyéb próbák, amik valszeg nem lesznek ZH-n

- **t-próba:** mintában egy valószínűségi változó átlaga szignifikánsan különbözik-e egy adott m értéktől.
- **kétmintás t-próba:** Azonos eloszlású e a két minta (két minta átlaga egyenlő)
- **páros t-próba:** jellemzően hasonló egységek párjaiból álló mintából vagy egy olyan egységcsoportból áll, amelyet kétszer teszteltek ("ismételt mérések" t-teszt). (például kontrollokra, edzéstervek hatékonyságának ellenőrzésére.)

#### Variancia tesztelése

- **F-próba:**  szórásnégyzetek egyenlőségét vizsgáló eljárás, melynél a nullhipotézis, hogy két normális eloszlású mintának azonos a varianciája.
- **Welch-próba:** két külön mintában egy-egy valószínűségi változó átlagai egymástól szignifikánsan különböznek-e

## feladatok

### 8. Feladat

Olvassuk be a "PlantGrowth.txt" tabulátorral tagolt adatfájlt. 5%-os szignifikancia szinten teszteljük azt a nullhipotézist, hogy a "weight" változó a "group" változó "ctrl" csoportjában normális eloszlást követ.

Ehhez ? használjuk. A teszt p-értéke ?, ezért ? a nullhipotézist.

```r
# \t a tabulátor karakter
adatok <- read.table("PlantGrowth.txt", header = TRUE, sep = "\t", na.strings = "NA", dec = ".", strip.white = TRUE, stringsAsFactors = TRUE, fileEncoding = "")
adatok

weight <- adatok$weight[adatok$group == "ctrl"]

#install.packages("nortest") # Ha nem találná a lib-et az IDE, így tudjuk telepíteni
library(nortest)
lillie.test(weight) # mivel egy mintán tesztelünk normális eloszlást
```

```console
> lillie.test(weight)

        Lilliefors (Kolmogorov-Smirnov) normality test

data:  weight
D = 0.18309, p-value = 0.5189
```

> Ehhez `Egymintás Kolmogorov–Szmirnov-próbát` használjuk. A teszt p-értéke `0.5189`, ezért `elfogadjuk` a nullhipotézist.

### 9. Feladat

Olvassuk be a "PlantGrowth.txt" tabulátorral tagolt adatbázist 5%-os szignifikancia szinten teszteljük azt a nullhipotézist hogy a „weight” változó eloszlása (eloszlásfüggvénye) azonos a „group” változó „ctrl” és „trt2” csoportjaiban

Ehhez ? használjuk. A teszt p-értéke ?, ezért ? a nullhipotézist

```r
ctrl <- adatok$weight[adatok$group == "ctrl"]
trt2 <- adatok$weight[adatok$group == "trt2"]
ks.test(ctrl, trt2) # mivel két folytonos mintán tesztelünk eloszlást
```

```console
> ks.test(ctrl, trt2)

        Exact two-sample Kolmogorov-Smirnov test

data:  ctrl and trt2
D = 0.55556, p-value = 0.1259
alternative hypothesis: two-sided
```

> Ehhez `a kétmintás Kolmogorov-Smirnov-próbát` használjuk. A teszt p-értéke `0.1259`, ezért `elfogadjuk` a nullhipotézist

### 10. Feladat

Olvassuk be az adatok1.txt adatfájlt. Az "education" és a "region" változók kapcsolatát vizsgáljuk.

A változók függetlenségét ? teszteljük 5%-os szignifikancia szinten. Ezt alkalmazva azt kapjuk, hogy a próbastatisztika értéke ?, a p-érték ?,?.

```r
adatok <- read.table("adatok1.txt", header=TRUE, sep="", na.strings="NA", dec=".", strip.white=TRUE, stringsAsFactors=TRUE, fileEncoding = "")
edu <- adatok$education
reg <- adatok$region

chisq.test(edu, reg) # mivel diszkrét (a region nem egy szám, hanem egy kategória, egy hely) változók függetlenségét teszteljük
```

```console
> chisq.test(edu, reg, correct=F) 

        Pearson's Chi-squared test

data:  edu and reg
X-squared = 59.666, df = 8, p-value = 5.421e-10
```

> A változók függetlenségét `khi-négyzet-próbával` teszteljük 5%-os szignifikancia szinten. Ezt alkalmazva azt kapjuk, hogy a próbastatisztika értéke `59.666`, a p-érték `5.421e-10`, `tehát elutasítjuk a nullhipotézist, hogy függetlenek`.

### 11. Feladat

Kíváncsiak vagyunk, hogy az amerikai profi kosárlabda bajnokságban (NBA) előnyt jelent-e az, ha valaki hazai pályán játszik. A 2014-15-ös szezon alapszakaszában 1230 mérkőzést játszottak le, ebből 703 alkalommal a hazai, 527 alkalommal pedig a vendég csapat nyert.

Teszteljük 5%-os szignifikanciaszinten azt a nullhipotézist, hogy a hazai pálya nem nyújt előnyt, tehát két véletlenszerűen választott csapat találkozóján a felek ugyanakkora eséllyel nyerik meg a mérkőzést. Ehhez ? használjuk. A teszt p-értéke ?, ezért ? a nullhipotézist.

```r
# Azt teszteljük hogy a hazai NINCS előnyben (ha a hazai pálya NEM nyújt előnyt, akkor a felek ugyanakkora eséllyel nyerik meg a mérkőzést (50%-50%) és a teszt igazat adna)
binom.test(703, 1230, p = 0.5) # mivel igaz/hamis értékek eloszlásának arányát teszteljük
```

```console
> binom.test(703, 1230, p = 0.5)

        Exact binomial test

data:  703 and 1230
number of successes = 703, number of trials = 1230, p-value = 5.794e-07
alternative hypothesis: true probability of success is not equal to 0.5
95 percent confidence interval:
 0.5433397 0.5994069
sample estimates:
probability of success
             0.5715447
```

> Teszteljük 5%-os szignifikanciaszinten azt a nullhipotézist, hogy a hazai pálya nem nyújt előnyt, tehát két véletlenszerűen választott csapat találkozóján a felek ugyanakkora eséllyel nyerik meg a mérkőzést. Ehhez `a binomiális tesztet` használjuk. A teszt p-értéke `5.794e-07`, ezért `elutasítjuk` a nullhipotézist.

### 12. Feladat

Olvassuk be a kolcson.txt adatfájlt. Teszteljük 5%-os szignifikancia szinten azt a nullhipotézist, hogy az "adostip" változó szerinti két csoportban megegyezik a "tipus" változó eloszlása!

Erre ? alkalmazható. Ezt alkalmazva azt kapjuk, hogy a próbastatisztika értéke ?,a p-érték ?,?.

```r
adatok <- read.table("kolcson.txt", header=TRUE, sep="", na.strings="NA", dec=".", strip.white=TRUE, stringsAsFactors=TRUE, fileEncoding = "")

gyak <- table(adatok$adostip, adatok$tipus) # gyakoriság táblázat létrehozása: megmutatja, hogy a két vizsgált változó minden kombinációja milyen gyakorisággal fordul elő az adathalmazban
chisq.test(gyak) # mivel diszkrét változók eloszlását teszteljük
```

```console
> chisq.test(gyak)

        Pearson's Chi-squared test

data:  gyak
X-squared = 4.7075, df = 2, p-value = 0.09501
```

> Erre `a khi-négyzet-próba homogenitás tesztelésére` alkalmazható. Ezt alkalmazva azt kapjuk, hogy a próbastatisztika értéke `4.7075`,a p-érték `0.09501`,`tehát elfogadjuk a nullhipotézist`.

### 13. Feladat

8 jóbarát elment szórakozni zh előtti este. Kíváncsiak voltak, az elfogyasztott sör mennyisége befolyásolja-e a zh eredményét, ezért felírták mindkettőt, az adatokat a „sor.csv” fájl tartalmazza.

A „sor” és a „pontszam” változók korrelációjának becslése ?, ami ?. Ha Pearson korrelációteszttel 5%-os szignifikancia szinten teszteljük a függetlenséget, akkor azt kapjuk, hogy p=?, tehát ? azt nullhipotézist, hogy ?.

*Hibás a feladat. "pontszam" változó neve "pont"*

```r
adatok <- read.table("sor.csv", header=TRUE, sep=";", na.strings="", dec=",", strip.white=TRUE, stringsAsFactors=TRUE, fileEncoding = "")
cor.test(adatok$sor, adatok$pont, method="pearson") # mivel két folytonos változó közötti lineáris kapcsolatot tesztelünk, amit a feladat is kér
```

```console
> cor.test(adatok$sor, adatok$pont, method = "pearson")

        Pearson's product-moment correlation

data:  adatok$sor and adatok$pont
t = -4.2423, df = 6, p-value = 0.005426
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 -0.975425 -0.413943
sample estimates:
       cor
-0.8660066
```

> A „sor” és a „pontszam” változók korrelációjának becslése `-0.8660066`, ami `erős, ellentétes irány`. Ha Pearson korrelációteszttel 5%-os szignifikancia szinten teszteljük a függetlenséget, akkor azt kapjuk, hogy p=`0.005426`, tehát `elutasítjuk` azt nullhipotézist, hogy `független a két változó`.

### 14. Feladat

Olvassuk be a "adatok.txt" adatfájlt, majd teszteljük azt a nullhipotézist, hogy a "pretest.2" változó normális eloszlást követ.

Erre ? alkalmazható. Ezt alkalmazva azt kapjuk, hogy a p-érték ? , ezért ? a nullhipotézist.

```r
adatok <- read.table("adatok.txt", header=TRUE, sep="", na.strings="NA", dec=".", strip.white=TRUE, stringsAsFactors=TRUE, fileEncoding = "")

library(nortest) 
pearson.test(adatok$pretest.2) # mivel diszkrét a mintánk ezt használjuk Kolmogorov helyett
```

```console
pearson.test(adatok$pretest.2)

        Pearson chi-square normality test

data:  adatok$pretest.2
P = 44.847, p-value = 3.933e-07
```

> Erre `a khi-négyzet-próba becsléses illeszkedésvizsgálatra` alkalmazható. Ezt alkalmazva azt kapjuk, hogy a p-érték `3.933e-07` , ezért `elutasítjuk` a nullhipotézist.

### 15. Feladat

Olvassuk be az adatok2.txt adatfájlt, mely megtakarítási adatokat tartalmaz különböző országokban. Teszteljük 5%-os szignifikancia szinten azt a nullhipotézist, hogy a 15 évnél fiatalabb korúak aránya (pop15) független az egy főre jutó jövedelemtől (dpi)!

Erre ? alkalmazható. Ezt alkalmazva azt kapjuk, hogy a próbastatisztika értéke ?, a p-érték ?, ?.

```r
adatok <- read.table("adatok2.txt", header=TRUE, sep="", na.strings="NA", dec=".", strip.white=TRUE, stringsAsFactors=TRUE, fileEncoding = "")
cor.test(adatok$pop15, adatok$dpi, method="spearman") # mivel folytonosak a minták, de nem biztos hogy lineáris a kapcsolat
```

```console
> cor.test(adatok$pop15, adatok$dpi, method="spearman")

        Spearman's rank correlation rho

data:  adatok$pop15 and adatok$dpi
S = 36984, p-value < 2.2e-16
alternative hypothesis: true rho is not equal to 0
sample estimates:
       rho
-0.7759424
```

> Erre `a Spearman-féle kollerációteszt` alkalmazható. Ezt alkalmazva azt kapjuk, hogy a próbastatisztika értéke `36984`, a p-érték `< 2.2e-16`, `tehát elutasítjuk a nullhipotézist`.

### 16. Feladat

Olvassuk be a family.txt adatfájlt. Az "expend" változónak az "income" változótól való függését lineáris regressziós modellel vizsgáljuk. Az "expend" változó teljes változékonyságának ? százaléka magyarázható a "income" változótól való lineáris függésével. Az "income" változó együtthatója 95% valószínűséggel a (?, ?) intervallumba esik. Teszteljük 5%-os szignifikancia szinten azt a nullhipotézist, hogy a regressziós egyenes meredeksége 0 ! A próbastatisztika értéke ?. Mivel a p-érték ?, ezért ?.

```r
adatok <- read.table("family.txt", header=TRUE, sep="", na.strings="NA", dec=",", strip.white=TRUE, stringsAsFactors=TRUE, fileEncoding = "")

reg <- lm(expend ~ income, data=adatok) # mivel TODO:
summary(reg)
```

```console
summary(reg)

Call:
lm(formula = expend ~ income, data = adatok)

Residuals:
    Min      1Q  Median      3Q     Max
-2.4206 -1.4905  0.2887  0.6978  3.3150 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)
(Intercept) -0.41200    0.76377  -0.539    0.596
income       0.18411    0.01493  12.328 3.27e-10 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 1.559 on 18 degrees of freedom
Multiple R-squared:  0.8941,    Adjusted R-squared:  0.8882
F-statistic:   152 on 1 and 18 DF,  p-value: 3.266e-10
```

> Az "expend" változó teljes változékonyságának `89.4` százaléka magyarázható a "income" változótól való lineáris függésével. Az "income" változó együtthatója 95% valószínűséggel a (?, ?) intervallumba esik. Teszteljük 5%-os szignifikancia szinten azt a nullhipotézist, hogy a regressziós egyenes meredeksége 0 ! A próbastatisztika értéke `152`. Mivel a p-érték `3.266e-10`, ezért `elutasítjuk a nullhipotézist`.

### 17. Feladat

Olvassuk be az sale-advertising.txt adatfájlt. A "sale" változónak az "advertising" változótól való függését lineáris regressziós modellel vizsgáljuk. Becsüljük a modell paramétereit!

Az "advertising" változó együtthatójának becslése ?, a konstans tag becslése ?. Ha az "advertising" változó értéke 6.2, akkor a "sale" változó értéke 95% valószínűséggel a (?,?) intervallumba esik. Ábrázolja az adatokat és az illesztett regressziós egyenest!

```r
adatok <- read.table("sale-advertising.txt", header=TRUE, sep="", na.strings="NA", dec=",", strip.white=TRUE, stringsAsFactors=TRUE, fileEncoding = "")

reg <- lm(sale ~ advertising, data=adatok) # mivel TODO:
summary(reg)
```

```console
> summary(reg)

Call:
lm(formula = sale ~ advertising, data = adatok)

Residuals:
     Min       1Q   Median       3Q      Max 
-1.02098 -0.46996 -0.06305  0.35216  1.38290

Coefficients:
            Estimate Std. Error t value Pr(>|t|)
(Intercept)   1.9381     0.7222   2.683   0.0278 *
advertising   1.4365     0.0947  15.168 3.53e-07 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.7442 on 8 degrees of freedom
Multiple R-squared:  0.9664,    Adjusted R-squared:  0.9622
F-statistic: 230.1 on 1 and 8 DF,  p-value: 3.534e-07
```

> Az "advertising" változó együtthatójának becslése `1.4365`, a konstans tag becslése `1.9381`.

```r
predict(reg, data.frame(advertising=6.2), interval="prediction", level=0.95)
```

```console
> predict(reg, data.frame(advertising = 6.2), interval = "prediction", level =$
       fit      lwr      upr
1 10.84417 9.030873 12.65746
```

> Ha az "advertising" változó értéke 6.2, akkor a "sale" változó értéke 95% valószínűséggel a (`9.030873`, `12.65746`) intervallumba esik.

```r
plot(adatok$sale ~ adatok$advertising) # plot(függoleges ~ vizszintes)
abline(reg) # Ha nem rajzol vonalat, fordítsd meg a paraméterek sorrendjét a plot-nál
```

![17. feladat](abraMegoldas.png)
