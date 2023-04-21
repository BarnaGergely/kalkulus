# Függvények

A függvények lényegében a matematikusok gépei. Olyanok mint egy varázsdoboz: bele dobsz egy számot (input), végrehajt rajta egy rakás módosítást és kiesik a végén egy eredmény (output).

$$
f(x) = \frac{x-1}{2}
$$

Ez a bonyolult felírás lényegében annyit mond, hogy melyik változón és milyen módosítást kell végre hajtani a gépnek.

> Nevezzük el a gépünket (függvényünket) f-nek, várjon egy x nevű bemeneti változót. Vonjon ki belőle 1-et majd ossza el 2-vel és adja vissza az eredményt

Így talán ismerősebb lesz:

```c
float f(float x) {
    return (x-1)/2;
}
```

A 5 helyen a függvény a 2 értéket veszi fel. Szóval a függvény értéke az 5 helyen 2 lesz.

## Értelmezési tartomány és érték készlet

## Függvény grafikonja

A függvény bemeneti változóját sokszor x-nek, a kimeneti változót sokszor y-nak szoktuk nevezni egy praktikus okból: így egyszerűen lehet ábrázolni grafikonon.

!!! note
    Ha vesszük a függvény egy pontját, annak első az az x koordinátáját **helynek**, másodikat az az y-t **értéknek** vagy függvényértéknek szoktuk nevezni.

Az x tengely a bemeneti változó lehetséges értékeit, az y tengely a függvény által erre adott eredményt mutatja. Ebből általában kirajzolódik egy szép vonal, aminek minden pontja megadja hogy adott inputra milyen output-ot ad a függvény. Más szavakkal hogy az adott helyen milyen értéket vesz fel a függvény.

$[6, 2]$

$[x = hely = 6, y = érték = 2]$

A 6 helyen 2 értéket vesz fel a függvény. A 6 helyen a függvényérték 2 lesz.

### Szélső érték

### Zérushely

### Minimum, maximum, lokális minimum, lokális maximum

### Monotonitás

### Konvexitás

### Inflexiós pont