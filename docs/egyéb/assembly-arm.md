# ARM 32 bit Assembly - Nagy ZH Jegyzet

- Nagyon hasonlít az Intel Assembly-re, ezért csak különbségeket írom le. [Intel Assembly Jegyzet](assembly-intel.md)
- Egyszerűbb mint az Intel, ez használnám a ZH-n.

## Alap Assembly program

```GAS
.syntax unified  /* Szintaxis meghatározás */
.cpu cortex-a7  /* Processzor megadása, az osztáshoz kell */

/* címke, ugyan az mint Intel-en */
HELLO: .asciz "Hello World\n"

/* Data szekció */
.data

/* Program szekció */
.text

    /* main függvény, ugyan az mint Intel-en */
    .global main
    main:
```

## Regiszterek

Rengeteg regiszterünk van, ami nagyon sokat könnyít a programozásban. nevük simán r0, r1, r2, r3, ... ,r14

r0-tól r10-ig általános célú regiszterek, arra használod amire csak akarod, mint az eax, ebx, ecx és edx Intel-en. A többi speciális

### Speciális regiszterek:

- r13-as regisztert elnevezték sp-nek (Stack Pointer). Ez mutatja a verem tetejét
- lr (r14) - Link Register, ha hívsz egy függvényt, ez tárolja honnan lett meghívva, ide tér vissza a ret utasításkor a program

## Utasítások

### Adatmozgatás

Ez kicsit máshogy működik, mint Intel-en.

#### mov

Van mov, de nem lehet vele bármit bárhova lemásolni. Csakis regiszterbe lehet vele másolni egy másik regiszter értékét vagy egy 0-256 közötti (8 bites) számot.

- `#!GAS mov r0, r1` - r0 = r1
- `#!GAS mov r0, #2` - konstans számok elé #-et kell írni

#### ldr (LoaD Register)

Ezzel tudjuk egy címke (tömb) címét betölteni egy regiszterbe. (mindjárt megérted ennek mi értelme) És egy regiszterben lévő címről tudunk vele adatot betölteni egy másik regiszterbe

- `#!GAS ldr r0, =CIMKE` - Címkék elé = jelet kell írni , CIMKE nevű címkének a címének betöltése az r0 regiszterbe
- `#!GAS ldr r1, [r0]` - az r0 regiszterben található memóriacímen lévő adat betöltése az r1 regiszterbe (indirekt címzés)
- `#!GAS ldr r0, #5` - ezzel is lehet kis számokat beállítani r0 = 5

#### Indirekt címzés (tömbök)

Nem adhatunk meg címkéket a címzésben, csakis regisztereket és konstansokat.

- `#!GAS [r0]` - az r0 regiszterben lévő memória címen lévő adat elérése

Szóval ahhoz hogy egy tömb elemeit be tudjuk járni, előbb be kell töltenünk a címét egy regiszterbe.

```GAS
.data
    TOMB: .int 1, 2, 3, 4
    DOLOG: .int 11
.text
    ldr r0, =TOMB       /* r0 regiszterbe betöltjük a TOMB nevű címke címét */
    ldr r1, [r0]        /* Az r1 regiszterbe betöltjük az r0-ban lévő memóriacímen lévő adatot a memóriából (jelen esetben ez a TOMB 1. eleme) */
    ldr r2, [r0, #1*4]  /* TOMB 2. elemének betöltése r2-be */
    ldr r3, [r0, #2*4]  /* TOMB 3. elemének betöltése r3-be */

    // r7 = TOMB[r6] -- TOMB r6 indexen lévő elemének elérése
    mov r4, #4          // Mivel nem lehet a szorzásban konstans, betöltjük egy regiszterbe a 4-et (4 bájt-os számokból áll a tömb)
    mul r5, r6, r4      // r5 = r6*4 - Mivel nem lehet a címzésben regisztert szorozni konstanssal, külön kell megcsinálni
    ldr r7, [r0, r5]    // r7-be töltöm be a számot, amit ugye az előbb kiszámolt eltolással (r5) kapok meg
```

#### str (STore Register)

Adat mentése regiszterből memóriacímre.

- `#!GAS ldr r1, [r0]` - az r0 regiszterben található memóriacímre írja ki az r1 tartalmát

### Verem kezelés

Ugyan úgy működik mint Intelen, csak a szinaxis kicsit más

- `#!GAS push {r0}` - r0 lemetése
- `#!GAS push {r0, r1}` - r0 és r1 lemetése
- `#!GAS push {r0-r5}` - r0-tól és r5-ig minden regiszter lemetése
- `#!GAS push {r0-r5, r8}` - r0-tól és r5-ig minden regiszter lemetése és r8 lementése

- `#!GAS pop {r0}` - verem tetején lévő elem vissza töltése r0-ba, minden ugyan úgy működik mint push-nál.

## Aritmetika

Csakis regiszterekkel és konstansokkal végezhetünk műveleteket, cserébe sokkal egyszerűbb használni őket.

### Összeadás + add (Addition)

```GAS
mov r2, #2
mov r1, #4
add r0, r1, r2  /* r0 = r1 + r2 */
add r0, r0, r2  /* r0 = r0 + r2 */
add r0, r0, #1  /* r0 = r0 + 1 */
```

### Kivonás - sub (subtraction)

```GAS
mov r2, #2
mov r1, #4
sub r0, r1, r2  /* r0 = r1 - r2 */
sub r0, r0, r2  /* r0 = r0 - r2 */
sub r0, r0, #1  /* r0 = r0 - 1 */
```

### Szorzás \* mul (Multiply)

Nem lehet konstanssal szorozni, csak regiszterrel.

```GAS
mov r2, #2
mov r1, #4
mul r0, r1, r2  /* r0 = r1 * r2 */
mul r0, r0, r2  /* r0 = r0 * r2 */
```

### Előjeles Osztás - sdiv (Divizion)

Ahhoz hogy az osztás működjön meg kell adni milyen procit használunk: `#!GAS .cpu cortex-a7`. Nem lehet konstanssal osztani, csak regiszterrel.

```GAS
mov r2, #2
mov r1, #4
div r0, r1, r2  /* r0 = r1 / r2 */
div r0, r0, r2  /* r0 = r0 / r2 */
```

előjel néküli osztás: `#!GAS udiv` - ugyan úgy működik

## Függvények készítése

- Csakis 4 paramétert adhatunk át egy függvénynek, ezeket a meghívása előtt az r0-r3 regiszterekbe kell másolni.
- A visszatérési értéket az r0-ba kell rakni, mielőtt véget ér a függvény, így sokkal könyebb őket a függvényben elérni.
- Itt is van cedcl (regiszter mentés és vissza töltés), de sokkal egyszerűbb, egy utasítás az elején (`#!GAS push {r4-r11 , lr}`) és egy a végén (``#!GAS pop {r4-r11 , pc}`).
- ret nem kell, az epilógus a függvény vége.
- ne használd a stack-et (pop, push) a függvényben (ne kérdezd miért, nem értem a gyak jegyzetet, de ez a biztos)

Függvény hívás: `#!GAS bl fuggvenynev`

### Egyszerű példa függvény:

```GAS
/* breaksystem nevű függvény kezdete */
.global breaksystem
breaksystem:
    /* cedcl szerinti függvény prológus */
    push {r4 -r11, lr}

    /* r0-r3 regiszterekben vannak a paraméterek */

    mov r0, #3 /*Visszatérési érték beállítása 3-ra*/

    /* epilógus, függvény vége */
    pop {r4 -r11, pc}
```

## Ugrás

Ugrálhat itt is címkékre, akinek nincs jobb dolga a `#!GAS b fuggvenyneve` és a `#!GAS bl fuggvenyneve` utasításokkal.

### Vegtelen ciklus:

```GAS
kezdet:
// program sorai
b kezdet
```

### Feltételes ugrás (if elágazás)

Csak hogy ne unatkozz, a szintaxis itt is kicsit változott, de ugyan úgy működik: elösször megadjuk miket hasonlítunk össze, utána hogy milyen relációs jel legyen közöttük és hova ugorjon ha igaz

```GAS
/* (r0 = r1) */
cmp r0, r1
beq igaz

/* (r0 <= 6) */
cmp r0, #6
ble igaz
```

| Relació | Művelet | Jelentés                |
| ------- | ------- | ----------------------- |
| ==      | beq     | Branch Equal            |
| !=      | bne     | Branch Not Equal        |
| <       | blt     | Branch Lover Then       |
| <=      | ble     | Branch Lover or Equal   |
| >       | bgt     | Branch Greater Than     |
| >=      | bge     | Branch Greater or Equal |

#### If elágazás péda

Pont mint Intel-en, negálással lehet hatékonyan megvalósítani.

`#!c if(r5<=18){}else{}`

```GAS
cmp r5, #18
ble else   /* ha (r5>18), ugorjunk az else címkére, egyébként menjünk tovább*/

    /* ha igaz az eredeti feltétel, megy simán tovább a program  és eljut ide*/

    b endif /* hamis rész átugrása */
else:
    /* ha hamis az eredeti feltétel, átugorja az igaz részt */
endif:
```

## Ciklusok

`#!c for(int i=0, i<5, i++){}`

```GAS
mov r5, 0      // legyen r5 az i valtozo

for:  // for ciklus kezdetét jelző cimke

    // kilepesi feltetel, ha ez teljesul, lepjunk ki a for-bol
    cmp r5, 5        // ha r5 >= 5, az az ha az aktualis elem a tomb 5. egyben utolsó eleme,
    bge forend       // akkor ugorjunk a forend cimkere

    // kod helye, amit a for-ban akarunk futtatni

    add r5, r5, #1   // i = i + 1 (nincs arm-en ++)
b for       // ha ide ert a program vissza ugrik a for elejere
forend:     // for ciklus vege
```

## Gyakorló feladat megoldása

Hibás, a visszatérési érték valamiért mindig -1, de a visszatérési tömböt (Contents) jól tölti fel.

```GAS
.syntax unified
.cpu cortex-a7

.data
    // Előre megadott nagy konstans számok mentése a memóriába, mivel túl nagyon konstans-nak
    
    SZAM1: .int 0xbadc0ffe
    SZAM2: .int 0x11223344
    SZAM3: .int -2048
    

.text

/*
r0 - input
r1 - op
r2 - opArg
r3 - output
r4 - counter
r5 - idx
r6 - value, input[idx]
r7 - 4
r8 - címzés eltolás
r9 - 0x11223344
*/
.global feladatX
feladatX:
    // prológus
    push {r4-r11 , lr}

    mov r7, #4  // r7 = 4
    mov r4, #0  // counter = 0

    mov r5, #0  // idx = 0
    for:
        // for ciklus kilépési feltétele
        mul r8, r5, r7  // r8 = idx * 4
        ldr r6, [r0, r8] // r6 = input[idx], value
        cmp r6, #0
        beq endfor

        // if (op == 0xbadc0ffe)
        ldr r10, =SZAM1
        ldr r10, [r10]
        cmp r1, r10
        bne elseif

            // if (value % opArg != 0)
            sdiv r11, r6, r2    // r11 = value/opArg
            mul r11, r11, r2    // r11 = (value/opArg)*opArg
            sub r11, r6, r11    // r11= value-((value/opArg)*opArg) -> így kell kiszámolni a maradékot ;)
            cmp r11, #0
            beq if11end
                mul r8, r4, r7      // r8 = counter * 4
                str r6, [r3, r8]    // output[counter] = value

                add r4, r4, #1      // counter++
            if11end:
            b if1end

        // else if (op == 0x11223344)
        elseif:
        ldr r10, =SZAM2
        ldr r10, [r10]
        cmp r1, r10
        bne else

            // if (value / 3 < opArg)
            mov r10, #3
            sdiv r11, r6, r10  // r11 = value/3
            cmp r11, r2
            bge if2end
                mul r8, r4, r7      // r8 = counter * 4
                str r6, [r3, r8]    // output[counter] = value

                add r4, r4, #1      // counter++
            if2end:
            b if1end

        else:
            ldr r10, =SZAM3     // r10 = SZAM3 címe
            ldr r10, [r10]      // r10 = -2048
            mul r8, r4, r7      // r8 = counter * 4
            str r10, [r3, r8]   // output[counter] = -2048

            add r4, r4, #1      // counter++
        if1end:
    
        add r5, r5, #1  // idx++
        b for
    endfor:

    mov r0, r4         // counter legyen a visszatérési érték

    // epilógus
    pop {r4-r11 , pc}
```