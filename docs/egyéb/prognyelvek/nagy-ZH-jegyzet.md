# Programozási nyelvek nagy ZH jegyzet

## SmallTalk

- kiterjesztés: .st
- tipus: 
- röviden: objektum orientált nyelv, üzeneteket küldünk az egymás után írt dolgokkal objektumok között
- komment: `#!st "komment"`

. sor vége

! szakasz vége, lokális változók csak ebben léteznek

- `#!st 'szoveg' printNl!` - kiiratás "".ek közé, sortörés
- `#!st 'szoveg' diplayNl!` - sima kiiratás sortöréssel a végén
- - `#!st 'szoveg' diplayNl!` - sima kiiratás sortörés nélkül

Mindig zárójelezni kell, még szorzásnál és összeadásnál is!

### Változók
```st
|x y z|             "Deklaráció"
x := 200.           "Egyszeres értékadás"
x := y := z := 300. "Többszörös értékadás"
```

### Üzenetek

#### Fajtái

- Unary: `#!st 'szoveg' printNl` -> < objektum > <üzenet> , 1 objektum van csak
- Binary: `#!st (5 + 2)`  -> < objektum > < operator > < objektum > , 2 objektumot kapcsol össze
- Kulcsszavas: `#!st (2 + 3 max: 3 + 4)` -> kettőspontos izé

**kulcsszavas < binary < unary**

#### Szám üzenetek:

```st
5 odd.
4 even.
5 negated.
3 factorial.
5 squared.
5 raisedTo: 3.
12 gcd: 20.
60 lcm: 18.
2 + 3 min: 3 + 4.
2 + 3 max: 3 + 4.
(5//2).    "Egész osztás hányadosa"
(5\\2).    "Egész osztás maradéka"
97 asCharacter.
```

#### Karakter üzenetek:

```st
"Karakter üzenetek"
Character space.
Character eof.
Character nl.
$a asUppercase.  "$a = az 'a' mint karakter"
$A asLowercase.
$a isLetter.
$1 isDigit.
$1 digitValue.
$a isSeparator.
$a asciiValue.
!
```

#### Kasztolás (konvertálás)

```st
x := '1000' asInteger.
```

### Blokkok

- [] közé írjuk őket
- value üzenettel lehet kiértékelni őket
- balról jobbra hajtódnak végre
- visszatérési érték a legutolsó kifejezés

```st
[5. 3*2. 'lol'] value printNl!  "kiírja hogy lol"

"paraméteres"
[:a :b :c | (a + b + c) printNl] value: 2 value: 3 value: 4!
```

#### if elágazás

```st
|k| k := 2.
k > 0 ifTrue: ['k pozitiv' printNl] ifFalse: ['k negativ' printNl]!
```

#### While ciklus

```st
|x| x := 2.
[x < 20] whileTrue: [x printNl. x := x + 2]!
```

#### For ciklus

```st
1 to: 5 by: 1 do: [:i | i printNl]! "a by: elhagyható, ilyenkor a +1 lesz a lépésköz"
```

### Kollekciók

A kollekciók elemei bármilyen tipusúak lehetnek. Több fajta kollekciónk is van.

#### ARRAY - TÖMB

minden elemnek van egy indexe

```st
|a|
a := Array new: 20.       "20 elemű tömb létrehozása"
a displayNl.              " tömb tartalmának kiíratása "
(a at: 1) displayNl.      "az első elemet írja ki, ami most 'nil', a tömböket 1-től indexeljük "
a at: 1 put: 99.          "legyen 99 az első helyen"
a at: 2 put: 1.           "legyen 4 a második helyen"
(a at: 1) displayNl.      "1. elem kiíratása"
a size printNl.           "a tömb mérete"
#(1 $B 'string') printNl. "tömbliterál (nem lehet módosítani)"
```

#### SET - Halmaz

minden elem csak egyszer szerepelhet benne.

```st
a := Set new. "üres halmaz létrehozása"
a printNl.    "kiírás"
a add: 5. a add: 7. a add: 'foo'.
a add: 9; add: 10; add: 'bar'.              "A ';' működése: az üzenetet annak az objektumnak küldi el, aminek a legutolsót küldte. Spórolás hosszú változóneveknél..."
a add:5; add: 5; add: 5; add: 5; yourself.  "A yourself üzenet egyszerűen visszaadja azt az objektumot, aminek elküldték, azért lehet hasznos, mert az add az argumentumát adja vissza"
a printNl.
a remove: 5.               "Az 5-ös kivétele"
a printNl.
a includes: 5.             "Tartalmazás vizsgálata -> true vagy false"
a includes: 7.

a addAll: #(4 5 66)        "kollekció összes elemének hozzáadása a halmazhoz"
a printNl.

"Példa halmaz feltöltésére ciklussal"
|x| x:= Set new.
1 to: 100 do: [ :i | x add: i ].
x printNl.
```

#### BAG

olyan mint a halmaz, csak egy elem szerepelhet többször is, számolja hányszor szerepelnek az elemek

#### Dictionary

kulcs-érték párokat tárol, mint a tömb, csak itt lehet az index string is

### Objektumok

Gyakorlatilag minden objektum, az összes változó az.

#### Objektumok összehasonlítása

```st
x := 'hehe'.
y := 'hehe'.
(x = y) printNl.  "igaz, ha x és y egyenlő, tehát a tartalmuk azonos"
(x ~= y) printNl. "igaz, ha x és y nem egyenlő, tehát a tartalmuk különbözik"
(x == y) printNl. "igaz, ha x és y azonos, tehát ugyanaz az objektum"
(x ~~ y) printNl. "igaz, ha x és y különböző, tehát nem ugyanaz az objektum"
```

### Osztály

```st
"-------------------------"
'Hello' class printNl.                "típus lekérdezése (a Java-s getClass() megfelelője)"
('Hello' isMemberOf: String) printNl. "típus vizsgálata (kb. mint az instanceof Java-ban)"

"-------------------------"
"Tört osztály"
Object subclass: Tort [ "az Object lesz az ős"
  |szamlalo nevezo|     "adattagok definiálása"

  init: sz init: n [    "kettő paraméteres inicializáló üzenet (a konstruktorban használjuk)"
    szamlalo := sz.     "a számláló adattag beállítása az első paraméter alapján"
    nevezo := n.
    self egyszerusit.   "a biztonság kedvéért kapásból csinálunk egy egyszerűsítést"
    ^self.              "visszaadjuk a felinicializált objektumot (self == this Java-ban)"
  ]

  szamlalo [            "a számláló getter üzenete, nincs paraméter"
    ^szamlalo.          "csak annyit csinál, hogy visszadja a megfelelő adattagot"
  ]

  nevezo [              "a nevező getter üzenete"
    ^nevezo.
  ]

  egyszerusit [
    |lnko|
    lnko := szamlalo gcd: nevezo. "legnagyobb közös osztó"
    szamlalo := szamlalo // lnko.
    nevezo := nevezo // lnko.
  ]

  displayNl [              "egy kamu 'toString()'"
    szamlalo display.
    $/ display.
    nevezo displayNl.
  ]

  "bináris üzenetek"
  + masik [
    |eredm sz n|
    sz := (szamlalo * masik nevezo) + (nevezo * masik szamlalo).
    n := nevezo * masik nevezo.
    eredm := Tort new: sz new: n.
    eredm egyszerusit.
    ^eredm.
  ]

  - masik [
    |eredm sz n|
    sz := (szamlalo * masik nevezo) - (nevezo * masik szamlalo).
    n := nevezo * masik nevezo.
    eredm := Tort new: sz new: n.
    eredm egyszerusit.
    ^eredm.
  ]

  * masik [
    |eredm sz n|
    sz := szamlalo * masik szamlalo.
    n := nevezo * masik nevezo.
    eredm := Tort new: sz new: n.
    eredm egyszerusit.
    ^eredm.
  ]

  / masik [
    |eredm sz n|
    sz := szamlalo * masik nevezo.
    n := nevezo * masik szamlalo.
    eredm := Tort new: sz new: n.
    eredm egyszerusit.
    ^eredm.
  ]

  printOn: stream [             "valódi 'toString()', ezt hívja meg a print(Nl)/display(Nl) a megfelelő paraméterrel (=a stream ahová ki kell írni)"
    szamlalo printOn: stream.
    $/ displayOn: stream.       "azért displayOn, hogy a $ ne legyen benne a kiírásban (print-tel benne lenne)"
    nevezo printOn: stream.
  ]

]

"konstruktor"
Tort class extend [        "az osztályt egészítjük ki azzal, hogy hogyan kell belőle egy példányt létrehozni"
  new: sz new: n [
    |obj|
    obj := super new.      "létrehozunk egy 'üres' objektumot az ős konstruktorának meghívásával"
    obj init: sz init: n.  "inicializáljuk az új objektumot"
    ^obj.                  "visszaadjuk a friss, ropogós objektumot"
  ]
]

"példa a Tort osztály használatára"
|r1 r2|
r1 := Tort new: 2 new: 3.
r2 := Tort new: 3 new: 4.
(r1 + r2) printNl.
(r1 - r2) printNl.
(r1 * r2) printNl.
(r1 / r2) printNl.
!
```

## Hashkell

- kiterjesztés: .hs
- tipus: lusta kiértékelés
- röviden: itt csak függvények vannak és rekurzió, nincsenek változók sem, csak paraméterek

mohó kiértékelés: függvény futtatásakor először az argumentum értékét határozzuk meg
lusta kiértékelés: csak a végső esetben értékelődik ki a paraméter