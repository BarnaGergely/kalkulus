# KaróKulus - Kalkulus SZTE Jegyzet

Ennek a jegyzetnek a célja, hogy átmenjek kalkulusból. Megpróbáltam összefoglalni mindent, amire szükség lesz, hogy meglegyen a vizsga.

Nem vagyok matematikus, sőt már többször is megbuktam ebből a nyamvadt tantárgyból, nem célom tökéletesen pontos oktatóanyagot írni és nem fogok az előadás anyagával, bizonyításokkal vacakolni. Leírom emberek számára is érthetően a lényeget, ha a kettes megvan a többi nem érdekel.

## Mi az a kalkulus?

A kalkulus, más néven analízis (más szakokon így hívják) **a függvény elemzés tudománya**. Lényegében annyiról fog szólni ez a félév, hogy fogunk egy undorítóan bonyolult függvényt és megpróbáljuk ábrázolni, megtalálni a nevezetes pontjait és minél több mindent elmondani róla.

## Hol használják a kalkulust?

Az átlag programozó életben **sehol**, viszont több tantárgy is épül rá, így nem fogod megúszni hogy megtanuld. (Zümi-re (Üzem mérnök informatika) félévkor át lehet menni, ott ez is könnyített).

Egyébként aránylag sok alacsony szintű szoftverben használják, mivel meg lehet vele jósolni a jövőt, pontosabban hogy egy függvény merre fog tovább haladni. PID kontrollerekben (fűtőtest és motor vezérlők), gazdasági elemző és könyvelő programok alacsonyabb szintű függvényeiben futhatsz össze deriválással és integrálással.

## Jegyzet felépítése

### [0. Ismétlés](ismétlés)

Gimis alapok, amiket sok helyen nem adtak le, de itt nélkülünk megpusztulsz.

### 1. Határérték

### 2. Deriválás

### 3. Integrálás

### 4. Teljes függvényvizsgálat

### 5. Vizsga feladatok megoldással

## Tanácsok

- **Barta Máriát nagy ívben kerüld el!!!!!!** - Ha véletlen hozzá vetted fel a gyakot, gyorsan menj át máshoz, mert az első pár hét után nagyon megváltozik. Általában 30-ból 3-an mennek csak át nála, azok is bődületesen sok tanulással.
- **Az előadás sokkal nehezebb mint a gyak!** - rengeteget kell rá tanulni és általában nem sikerül az első évben teljesíteni.
- Nem írok többet, úgysem jegyeznéd meg.

## Segédanyagok

### 1. Mateking

Nem ingyenes (kb. 5000 Ft egy félévre), de kötelező vétel mindenkinek, aki szeret videóból tanulni. Érthetően elmagyaráz mindent, nem úgy mint az egyetemi tanárok. Viszont nem olyan komplikált feladatokat old meg, mint amire a vizsgához szükség lesz.

### 2. Thomas-féle kalkulus 1.

Sokkal jobb mint az előadás anyag, már csak azért is mert nem magyarok írták. Ha könyvből szeretsz tanulni, ha nem, szerintem ez a legjobb anyag kalkulushoz. Aránylag gyorsan össze lehet belőle szedni egy egy témakör alapjait és tele van ábrákkal.

### 3. Fülöp Vanda Kalkulus ​I. példatár

Gyakon ebből tanulunk, ezért biztos hogy használni fogod még. Minden téma végén van pár kidolgozott és utána egy tucat gyakorló a sok gyakvezér a ZH-kon a kidolgozott feladatot adja fel szóról szóra (vagy kicsit más számokkal) mások a gyakorlók közül választanak, ezért legalább a kidolgozottakat érdemes fejből tudnod, de jó ha a többit is megoldod.

### Videók

- [Kalkulus1 vizsgák 2021-22 őszi félév](https://youtube.com/playlist?list=PL5lXyio09uVY6bnzsLDYa_7zdstnHekYa)
- [Alapismeretek](https://youtube.com/playlist?list=PLm_pNdtN9Bap82U1dvkOT1uUXovYNnsUl)
- [M1 - 7. - Integrálszámítás - YouTube](https://youtube.com/playlist?list=PLm_pNdtN9Bao5JxKx5rUzVeGbt4Iaf_Ty)
- [Kalkulus 1. 2020-21 őszi félév](https://youtube.com/playlist?list=PL5lXyio09uVa-2iXrLk10vLjgWO8aO_ts)
- [Kalkulus I. gyakorlat informatikusoknak 2021/22 - YouTube](https://youtube.com/playlist?list=PLm_pNdtN9BaryRWDVBWaKVR_r25fctzJ6)

### Weblapok

- Deriválás gyakorló: [Derivative Calculator](https://www.derivative-calculator.net/)
- Integrálás gyakoró: [Integral Calculator](https://www.integral-calculator.com/)
- [WolframAlpha](https://www.wolframalpha.com/) (bármit megold, amit le tudsz írni)
- [PhotoMaths](https://photomath.com/en) (azt is kiszámolja, amit le sem tudsz írni)
- [mateking](https://www.mateking.hu/kalkulus)

### Hivatalos segédanyagok:

- Szabó Tamás, Fülöp Vanda videói: [alapismeretek](http://www.youtube.com/playlist?list=PLm_pNdtN9Bap82U1dvkOT1uUXovYNnsUl) [kidolgozott feladatok ](http://www.math.u-szeged.hu/~szbtmsz/vm1k1/vm1k1.html) [vagy itt](http://www.math.u-szeged.hu/~szbtmsz/video.html)
- régebbi vizsgadolgozatok [ itt](http://www.math.u-szeged.hu/~szbtmsz/) [itt ](http://www.math.u-szeged.hu/~fulopv/) vagy [itt](http://www.math.u-szeged.hu/~nemeth/hallgatoknak.php)
- az én régebbi (vírus-online) előadásaim [itt](https://www.youtube.com/channel/UC8c9PPbYKKHfz4vMpmqW4zA)
- másodsorban javasoljuk: Thomas-féle Kalkulus [itt](https://dtk.tankonyvtar.hu/handle/123456789/13056)

# Ismétlés

Alapegyenletek képe

Függvény rendezés

Műveletek törtekkel

Logaritmus

szögfüggvénye

# Teljes függvényvizsgálat

1. Értelmezési tartomány
   1. Hol nincs értelmezve a függvény
   2. Függvény értelmezési tartományának felírása halmazos jelölésel
   3. Számegyenes
2. Tengelymetszet(Zérushely) - Hol 0 a függvény értéke? 4. f(x) = 0
3. Paritás
4. Határérték - Hova tart a függvény az értelmezési tartomány széleiben? 5. limeszes vacak 6. Újabb ábra
5. Monotonitás, helyi szélsőérték 7. első derivált 8. ahol az első derivált értéke 0, inflexiós pont van 1. f ’(x)=0 9. Táblázat 10. Hol csökken és hol nő a függvény 11. Mennyi a szélsőérték értéke
6. Érték készlet
7. Konvexitás, inflexiós pont
8. Grafikon

# Integrálás

Elemi integrálok

## Határozatlan integrál

_Mi a határozott integrál?_

### Egyszerű összetett függvény

Belső függvény deriváltja egy szám

külső függvény integrálja / belső függvény szorzó tényezője

### Bonyolult összetett függvény

Belső függvény deriváltja nem szám (változó x vagy függvény)

### Két függvény szorzata vagy hányadosa

#### Két egyszerű függvény szorzata

Nincs a két szórzó tényező között kapcsolat (egyik sem a másik deriváltja)

##### Parciális integrálás módszere

#### Egy egyszerű és egy bonyolult függvény szorzata

Ha az egyik függvény szám szorosa a másiknak

Helyettesítés módszere

### Racionális törtfüggvény

Elemi racionális törtekre bontás tétele

Polinom osztás

### Paraméteres integrálás

## Határozott integrál (riemann integrál)

A függvény legyen az [a,b] intervallumon egy korlátos függvény

Tételek

Ha folytonos, akkor Riemann integrálható

Értékét Newton-linic formula tétel alapján tudjuk kiszámítani.

először kiszámítjuk határozatlan integrálját

Aztán alkalmazzuk a tételt
