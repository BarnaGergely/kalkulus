# encoding: UTF8 
# (megnyitni, menteni lehet fájlkódolással a File menüben)

# munkakönyvtár beállítása (jobb alsó panel beállításainál is)

setwd("C:\\sajatkonyvtar")
getwd()
dir()

# csomag telepítése, betöltése 

install.packages("moments")
library(moments)

# függvények és help

?mean
help(mean)
args(mean) # opcionális argumentumok

# értékadás, kiíratás, törlés

assign("v",5)
v = 5
v <- 5

v
print(v)

rm(v)
rm(list = ls()) # összes objektum törlése

# típusok 

class(v)
typeof(v)
is.numeric(v)
is.character(v)

(v = pi)
v = "pi"
v = TRUE
v = (5+2)^8*3
v = 8+2i


# vektor, faktor, műveletek

v1 = c(5,2,1,5,2)  # vektor létrehozása
v2 = c(TRUE,TRUE,FALSE,TRUE,TRUE)


class(v1)
str(v1)
length(v1)

v1-3 # (+,-,*,/,^) komponensenkénti műveletek
v1*v2 # (+,-,*,/,^) komponensenkénti műveletek
sum(v1)
min(v1)
log(v1^(v2+1))

bool = (1<v1 & v1<5)

sort(v1)  # növekvő rendezés
sort(v1, decreasing = TRUE)  # csökkenő rendezés

# szűrők

v1[2]
v1[2:4]
v1[c(2,4)]
v1[v1>3]
v1[v2]
v1[bool]

str(v1)
summary(v1)

f1 = factor(v1)      # vektor faktorrá konvertálása
str(f1)
summary(f1)

v3 = c("kék", "zöld", "kék")
str(v3)
summary(v3)

f3 = factor(v3)
str(f3)
summary(f3)

# adatstruktúra

adatok = data.frame(v1,v2)

# alapstatisztikák

sum(v1)
min(v1)
max(v1)
mean(v1)
median(v1)

# gyakorisági táblázat (vektorra, faktorra) és ábrázolása

(t = table(v1))
barplot(v1) # nem a gyakoriságokat ábrázolja
barplot(t)


# adatfájl beolvasás

load("data.rda")

# fájl import

# szövegfájl (.txt, .csv) - változónevek, szeparáló karakter, 
# hiányzó adat jelölése, tizedesjel, karakterkódolás megadása
emberek <- read.table("emberek.txt", header=TRUE, sep="", na.strings="NA", dec=",", strip.white=TRUE, stringsAsFactors=TRUE, fileEncoding="iso-8859-2")
emberek <- read.table("emberek.txt", header=TRUE, sep="", na.strings="NA", dec=",", strip.white=TRUE, stringsAsFactors=TRUE, fileEncoding="UTF8")

# .csv (figyeljünk a karakterkódolásra, változónevekre, tizedesjelre!)
kerdoiv <- read.csv2("kerdoiv.csv", dec=",", na.strings="", fileEncoding="iso-8859-2") 
kerdoiv <- read.csv2("kerdoiv.csv", dec=",", na.strings="", fileEncoding="UTF8") 

# SPSS adatfájl (.sav)
library(foreign, pos=4)
brain <- read.spss("brain.sav", use.value.labels=TRUE, max.value.labels=Inf, to.data.frame=TRUE)

# Excel fájl (.xls, .xlsx)
library(readxl)
autok <- read_excel("autok.xls")

# adathalmaz csatolása, lecsatolása

loero
autok$loero

attach(autok)
loero
detach(autok)


# Beépített adatbázis:

airLine = data.frame(AirPassengers)
?AirPassengers


# hiányzó adatok kezelése

emberek50 = subset(emberek, szul>1973)
table(is.na(emberek))
emberek2 = emberek[!is.na(emberek)]
cipo = emberek$cipomeret[!is.na(emberek$cipomeret)]
emberek_nem = subset(emberek, select=c(nev, nem))


# adatok fájlba mentése

save(v1, v2, f1, file = "adatok.rda")  # R adatfájl
save("brain", file = "brain.rda") # R adatfájl
write.table("brain", file = "brain.txt") # szövegfájlba

# output fájlba/terminálra irányítása

sink("output.txt")
mean(v1)
sink() # vissza a terminálra

# kép fájlba mentésének egy módja (másik jobb oldalon Plots/Export)

png("abra.png") # képfájl megnyitása
# pdf("abra.pdf"), win.metafile("abra.wmf"), jpeg("abra.jpg"), bmp("abra.bmp"), postscript("abra.ps")
barplot(t) # ábra elkészítése 
dev.off() # képfájl mentése



#####################################################################

#            LEÍRÓ STATISZTIKA

#####################################################################


summary(emberek)

attach(emberek)


# nem mintaelemszáma, gyakoriságai, relatív gyakoriságai, ábrán is

length(nem)
sum(!is.na(nem)) 
# nincs hiányzó adat

summary(nem) # gyakoriságok (faktorra!)
table(nem) # ua. hiányzó adatok nélkül
prop.table(table(nem)) # relatív gyakoriságok
table(nem)/length(nem)
barplot(table(nem)) # oszlopdiagram - gyakoriságok
barplot(prop.table(table(nem))) # oszlopdiagram - relatív gyakoriságok

pie(nem) # kördiagram - hiba!
pie(table(nem)) # kördiagram

plot(ecdf(nem)) # empirikus eloszlásfüggvény (automatikus változókonverzió)


# cipőméret mintaemleszáma, empirikus eloszlásfüggvény

length(cipomeret) # mintaelemszám hiányzó adatokkal
length(cipomeret[!is.na(cipomeret)]) # mintaelemszám hiányzó adatok nélkül
sum(!is.na(cipomeret)) # ugyanaz

sum(is.na(cipomeret)) # hiányzó adatok száma

plot(ecdf(cipomeret)) # ábra
ecdf(cipomeret)(38) # empirikus eloszlásfüggvény értéke x=38 helyen


# kor leíró statisztikája 
# (mintaterjedelem, v.é., variancia, szórás, medián becslése)

kor = 2024-szul

summary(kor)

(r = range(kor, na.rm=TRUE)) # min, max
r[2]-r[1] # mintaterjedelem 
max(kor, na.rm=T) - min(kor, na.rm = T) # ua.

median(kor, na.rm=T) # medián, hiányzó adatok átugrása

mean(kor, na.rm=T)  # átlag

var(kor, na.rm=T) # variancia becslése
sd(kor, na.rm=T) # szórás becslése
sd(kor, na.rm=T)**2 # variancia becslése

moment(kor, order=2, central=T) # 2. empirikus centrális momentum

# kor eloszlásának vizsgálata: csúcsosság, ferdeség, hisztogram

library(moments)
skewness(kor, na.rm=T) # ferdeség
kurtosis(kor, na.rm=T) # csúcsosság

hist(kor) # hisztogram
hist(kor,freq=FALSE) # sűrűséghisztogram


# Standardizáljuk a kort!

(kor-mean(kor, na.rm=T))/sd(kor, na.rm=T)
scale(kor) 

detach(emberek)


sal <- read.table("salary.txt", header=T, sep="", na.strings="NA", dec=".", strip.white=TRUE, stringsAsFactors=TRUE)
# Azért nem salary a változónév, mert van az adathalmazban 
# salary változó, csatoláskor két azonos nevű objektum lenne.
attach(sal)


# jobtime eloszlásának normálishoz való viszonyítása: 
# ferdeség, csúcsosság, hisztogram, QQ ábra

# library(moments)
skewness(jobtime, na.rm=T) # ferdeség
kurtosis(jobtime, na.rm=T) # csúcsosság

hist(jobtime, freq=F, ylim=c(0,0.05)) 
# nézzük meg, mennyire hasonlít a normális eloszláshoz:
curve(dnorm(x, mean=mean(jobtime), sd=sd(jobtime)), col="red", add=T)

qqnorm(scale(jobtime)) # QQ ábra egyenes nélkül
abline(0,1, col="red") # x=y egyenes


# jobtime kvantilisek becslései, interkvartilis terjedelem, boxplot

quantile(jobtime, na.rm=T)  # min, 1. kvartilis, medián (= 2. kvartilis), 3. kvartilis, max
summary(jobtime, na.rm=T)
IQR(jobtime) # interkvartilis terjedelem
boxplot(jobtime, range=0)
quantile(jobtime, probs=c(0.1,0.9), na.rm=T) # 0.1- és 0.9-kvantilis


# salary eloszlásának vizsgálata

boxplot(salary) # boxplot kiugró adatokkal
boxplot(salary, outline=F) # kiugró adatokat kiszedi
boxplot(salary, range=0) # nem nézi, van-e kiugró adat 

hist(salary, freq=F) # jobbra ferde eloszlás
hist(salary, breaks = 26,freq=F) 

skewness(salary, na.rm=T) # ferdeség

median(salary, na.rm=T)
mean(salary, na.rm=T)


# salary leíró statisztikája csoportosítva nemek szerint

tapply(salary, list(gender), mean, na.rm=T) # kat szerint csoportosított átlagok
aggregate(salary, list(gender), mean, na.rm=T) # ua.
barplot(tapply(salary, list(gender), mean, na.rm=T)) # átlagok csoportonként

tapply(salary, list(gender), sd, na.rm=T) # kat szerint csoportosított szórásbecslések

tapply(salary, list(gender), quantile, na.rm=T) # kat szerint csoportosított kvartilisek

boxplot(salary~gender, range=0) # boxplot csoportonként


# jobtime és salary kovarianciájának, korrelációjának becslése

cov(jobtime, salary, use="complete.obs") # kovariancia
cor(jobtime, salary, use="complete.obs") # korreláció

plot(jobtime, salary) 

detach(sal)



#####################################################################

#            PARAMÉTERES PRÓBÁK

#####################################################################

#    ---------
#    EGYMINTÁS
#    ---------


library(foreign, pos=4)
brain <- read.spss("brain.sav", use.value.labels=T, max.value.labels=Inf, to.data.frame=TRUE)
attach(brain)

# Igaz-e, hogy 100 az IQ várható értéke? Nézzük meg PIQ-ra!

mean(PIQ) # átlag alapján nem döntünk!

qqnorm(PIQ)  # normalitás?
abline(mean(PIQ),sd(PIQ))

t.test(PIQ, mu=100)
t.test(PIQ, mu=110)

t.test(PIQ, mu=100)$statistic
t.test(PIQ, mu=100)$p.value
t.test(PIQ, mu=100)$conf.int
t.test(PIQ, mu=100)$estimate
mean(PIQ)

# Melyik szignifikancia szinten fogadjuk el 
# 0.1, 0.5, 0.01 és 0.001 közül? 
# 5%-os (0.05) szignifikancia szinten döntünk általában.

?t.test

# A konfidenciaszint átállítása
t.test(PIQ, conf.level=.99)

detach(brain)


# Mi a helyzet alacsony férfiak esetén?

brain.sm = subset(brain, Gender=="Male  " & Height<=70)
attach(brain.sm)

mean(PIQ)  # még nagyobb becslés

t.test(PIQ, mu=100)  # mégis elfogadjuk a H0: mu=100-at! Miért?

detach(brain.sm)


#    -----
#    PÁROS
#    -----


library(readxl)
betegek <- read_excel("betegek.xls")
attach(betegek)

# Van-e eltérés a két lázérték várható értéke között? 

(v = c(mean(laz1), mean(laz2)))
barplot(v)

qqnorm(scale(laz1-laz2)) # normalitás?
abline(0,1)

# boxplot(laz1, laz2, range=0)
# ábra alapján nem döntünk


# Teszteljük 0,05-os szignifikancia szinten!
t.test(laz1, laz2, paired=T)
# Elfogadjuk-e 0,01-os szignifikancia szinten?

# Ellenőrizzük, hogy az előadásbeli eljárás ugyanazt az eredményt adja!
t.test(laz1-laz2) 


# Teszteljük 5%-os szignifikancia szinten azt a nullhipotézist, hogy 
# a laz1 várható értéke 0.5-del nagyobb a laz2 várható értékénél!

t.test(laz1, laz2, mu=0.5, paired=T)

detach(betegek)



# library(readxl)
autok <- read_excel("autok.xls")
attach(autok)

# Megegyezik-e várhatóan a fogyasztás 120-nál és a városi fogyasztás? 
# Teszteljük 5%-os szignifikancia szinten!

c(mean(f120), mean(vf)) # különbözőnek tűnik(!)

t.test(f120, vf, paired=T)
t.test(vf, f120, paired=T)  # kérdés: Megegyeznek-e a p-értékek? Miért?

detach(autok)


#    ---------
#    KÉTMINTÁS
#    ---------

# Teszteljük normális eloszlású minták várható értékének egyenlőségét!

v1 = rnorm(20, 0, 1)
v2 = rnorm(25, 0, 1) # egyenlőek az elméleti szórások, H_0 igaz

# kétmintás t-próba

t.test(v1, v2, var.equal=T)

v2 = rnorm(25, 1.2, 1) # egyenlőek a szórások, H_0 nem igaz, elutasítjuk

v2 = rnorm(25, 0.2, 1) # egyenlőek a szórások, H_0 nem igaz, elutasítjuk
# elég nagy minta esetén elutasítja ezt is a konzisztencia miatt

t.test(v1, v2, var.equal=T) # nem igaz a nullhipotézis - másodfajú hiba!!

# Ha nem (feltétlenül) egyenlőek a szórások:

v2 = rnorm(25, 0, 1.2) 

# Tankönyvi eljárás:
# 1. szórásvizsgálat (feltételezhetjük a normális eloszlást)

var.test(v1, v2) # másodfajú hiba!
boxplot(v1, v2, range=0) # elfogadás esetén óvatosságból

# 2. lépés kétmintás t-próba vagy Welch-próba

t.test(v1, v2, var.equal=T) # A tankönyvi eljárás alapján most ezt kellene
t.test(v1, v2)  # tudjuk, hogy különbözőek a szórások 
# (két minta esetén a Welch-próba az alapértelmezett a t.test függvényben)


# Ha nem normális eloszlású a minta (nagy minta kell!)

sal <- read.table("salary.txt", header=T, sep="", na.strings="NA", dec=".", strip.white=TRUE, stringsAsFactors=TRUE)
attach(sal)

# Eltér-e a kezdőfizetés várható értéke a két nemnél? 
# Teszteljük 5%-os szignifikancia szinten!

hist(salbegin, freq=F) 
qqnorm(scale(salbegin))
abline(0,1) 

# nem tekintjük normális eloszlásúnak (később teszteljük is)
# F-próba nem alkalmazható (Levene-tesztet szoktak alkalmazni)

# nemek szerint

boxplot(salbegin ~ gender, range=0) 

# különbözőnek tűnik a szórás, de F-próbával nem tudjuk tesztelni
# Levene-tesztet szoktak alkalmazni (nem a tananyag része)
# library(car)
# leveneTest(salbegin ~ gender, center=mean)

t.test(salbegin ~ gender) 


# Egyenlő-e a kezdőfizetés várható értéke a gyermekesek és 
# a gyermektelenek csoportjában? Milyen szignifikancia szinten fogadjuk el?

boxplot(salbegin ~ factor(child>0), range=0)

# Szórásvizsgálat nélkül is tesztelhetjük a várható értékek 
# egyenlőségét (nem tankönyvi eljárás):

t.test(salbegin ~ factor(child>0))


# Azt szeretnénk tesztelni 5%-os szignifikancia szinten, hogy 
# a gyermektelenek kezdőfizetése 745-tel több. 

t.test(salbegin ~ factor(child>0), mu=745)

# Egy másik hipotézis szerint 3000-rel több. 

t.test(salbegin ~ factor(child>0), mu=3000)

# Mi a magyarázata a furcsa eredménynek?

detach(sal)


#    ----------
#    TÖBBMINTÁS
#    ----------


# Ellenőrizzük, hogy az egyszempontos varianciaanalízis 
# a kétmintás t-próba általánosítása!

kat = sample(0:1, 20, replace=T)

t.test(v1~kat, var.equal=T)
t.test(v1~kat, var.equal=T)$statistic^2  # t^2 = F (alábbi tesztből)
oneway.test(v1~kat, var.equal=T) # egyszempontos ANOVA teszt

# Welch-próbákra hasonlóan

t.test(v1 ~ kat)
t.test(v1 ~ kat)$statistic^2
oneway.test(v1 ~ kat) # Welch teszt több csoportra


# Az életkor vizsgálata a régió kategóriái szerint

survey <- read.table("1991 U.S. General Social Survey.txt", header=T,  na.strings=c("0","8","9"), dec=",", sep = "\t")

attach(survey)

kat = factor(region)  # csoportosító változó

table(kat)

# Teszteljük azt a nullhipotézist, hogy a különböző régiókhoz 
# tartozó életkorok szórása megegyezik!

# az életkor csoportonkénti átlaga
(t = tapply(age, list(kat), mean, na.rm=T))
barplot(t)    

# Tankönyvi eljárás:
# 1. szórásvizsgálat

bartlett.test(age ~ kat)
library(car)
leveneTest(age, kat, center=mean)

# 2. Teszteljük a várható értékek egyezőségét!

oneway.test(age ~ kat, var.equal=T)

# Nem tankönyvi eljárás: Teszteljük úgy is, hogy nem tesszük
# fel a szórások egyenlőségét!

oneway.test(age ~ kat)

detach(survey)



#####################################################################

#            NEMPARAMÉTERES PRÓBÁK

#####################################################################

#    ---------
#    EGYMINTÁS
#    ---------


# Elvégeztek különböző érmékkel összesen 350757 pénzfeldobást és azt 
# találták, hogy 178078 esetben a pénzérme a kiindulási oldalra. 
# Ez alapján azt mondják, 51% körüli az azonos oldalra érkezés 
# valószínűsége. (Bartos és mtsai, 2023)
# Teszteljük 1%-os szignifikancia szinten azt, hogy ez a valószínűség 
# 50% és azt is, hogy 51%!
# Ig Nobel díjat is kaptak rá: https://www.theguardian.com/science/2024/sep/12/ig-nobel-prize-goes-to-team-who-found-mammals-can-breathe-through-anuses

k = 178078
n = 350757

k/n
# A relaív gyakoriság 0.5076962

# H_0: p_0=0,5
# binomiális teszt:
binom.test(k, n, p = 0.5)

# Alkalmazható a khínégyzet-próba is:
chisq.test(c(k,n-k), p = c(0.5, 0.5))

# H_0: p_0=0,51
# binomiális teszt:
binom.test(k, n, p = 0.51)

# khínégyzet-próba
chisq.test(c(k,n-k), p = c(0.51, 0.49))

# Egyik nullhipotézist sem fogadjuk el. Lényeges a  mintaelemszám:
# ha 100 dobásból 51 esik ugyanarra az oldalra, elfogadjuk mindkét 
# nullhipotézist (5%-os szinten is):

k = 51
n = 100

# H_0: p_0=0,5
binom.test(k, n, p = 0.5)
chisq.test(c(k,n-k), p = c(0.5, 0.5))

binom.test(k, n, p = 0.51)
chisq.test(c(k,n-k), p = c(0.51, 0.49))


# 50 kockadobásból 11 db 6-os. Teszteljük 5%-os szignifikancia szinten  
# azt a nullhipotézist, hogy a 6-os dobás valószínűsége 1/6 !

n = 50
k = 11

# a 6-osok aránya
k/n

binom.test(k, n, p = 1/6)

# Legyen most minden a 10-szerese (a 6-osok aránya nem változik) 
# n = 500, k=110. Végezzük el a vizsgálatot így is!
# Elfogadjuk-e a nullhipotézist 1%-os szinten?


# A mintaelemszám most is 50. Most nézzük a teljes dobássorozatot, 
# legyen  8 db 1-es, 7 db 2-es, 10 db 3-as, 6 db 4-es, 8 db 5-ös és 
# 11 db 6-os. Teszteljük azt a nullhipotézist, hogy szabályos a kocka!

dobasok = c(8,7,10,6,8,11)
valsz = c(1/6,1/6,1/6,1/6,1/6,1/6)

chisq.test(dobasok, p = valsz)
chisq.test(dobasok)

# Kisebb minta esetén problémába ütközünk:

dobasok = c(2,1,3,1,3,2)
chisq.test(dobasok)

# A khínégyzet próbastatisztika eloszlása csak aszimptotikusan adott, ezért
# kis minta esetén nem megbízható a teszt eredménye, ilyenkor nem tudunk dönteni!
# Mindegyik várható érték legalább 5 kell, hogy legyen.

kerdoiv <- read.csv2("kerdoiv.csv", dec=",", na.strings="", fileEncoding="iso-8859-2") 
attach(kerdoiv)

# Teszteljük azt a nullhipotézist, hogy a dohányzók aránya a
# populációban 20%!

table(Dohanyzas)

# khínégyzet próbával:
chisq.test(table(Dohanyzas), p=c(0.2, 0.8))

# binomiális teszttel:
binom.test(sum(Dohanyzas=="igen"), length(Dohanyzas), p=0.2)

# 5%-os szignifikancia szinten mindkét teszt elutasítja H_0-t. 
# Viszont ha epszilon = 0.005, akkor bár mindkét próbánál ugyanannyi
# az elsőfajú hiba különböző a döntés ugyanarról a hipotézisről.
# Mi lehet ennek az oka?

detach(kerdoiv)


# Teszteljük azt a nullhipotézist, hogy a beépített normális 
# randomszámgenerátor alapértelmezetten standard normális 
# eloszlású álvéletlenszámokat generál!

v = rnorm(100)

# először nézzük az ábrát:
hist(v, freq=F)
qqnorm(v)
abline(0,1)

# a Kolmogorov-Szmirnov teszttel:
ks.test(v, "pnorm", 0, 1)
ks.test(v, "pnorm") # ugyanaz

# Ha csak normalitást szeretnénk tesztelni:
library(nortest) 
lillie.test(v)
ks.test(v, "pnorm", mean(v), sd(v))  

# A beépített khínégyzet próbánál nem lehet megadni a 
# paramétereket, csak a becsléses változat fut le korrekt módon!
pearson.test(v, adjust=T) # nortest csomagban van

# Generáljunk (a) n=50 (b) n=500 elemű egyenletes eloszlású
# mintát és teszteljük a normalitást!

v = runif(50, -1, 1) 
# v = runif(500, -1, 1)

lillie.test(v)
pearson.test(v, adjust=T) 


# Vizsgáljuk meg a verbális IQ normalitását!

library(foreign, pos=4)
brain <- read.spss("brain.sav", use.value.labels=T, max.value.labels=Inf, to.data.frame=TRUE)
attach(brain)

hist(VIQ, freq=F)
qqnorm(scale(VIQ))
abline(0,1)

library(moments)
skewness(VIQ, na.rm=T)

# Teszteljük azt a nullhipotézist, hogy a VIQ változó 
# normális eloszlású!

# khínégyzet próbával:
library(nortest)
pearson.test(VIQ) # adjust = T az alapértelmezett 

# Kolmogorov-Szmirnov-teszttel:
ks.test(VIQ, "pnorm", mean(VIQ), sd(VIQ))
lillie.test(VIQ)


# Tesztejük 5%-os szignifikancia szinten azt
# a nullhipotézist, hogy VIQ mediánja 100 !

mean(VIQ)
median(VIQ)
boxplot(VIQ, range=0)

# Előjelpróba:
binom.test(sum(VIQ<100), length(VIQ), p=1/2)

# Meg tudjuk-e valósítani a medián tesztelését másik tanult próbával?

detach(brain)


sal <- read.table("salary.txt", header=T, sep="", na.strings="NA", dec=".", strip.white=TRUE, fileEncoding="iso-8859-2")
attach(sal)

hist(salary, freq=F)
qqnorm(scale(salary))
abline(0,1, col="red")

# library(moments)
skewness(salary, na.rm=T)

# Teszteljük azt a nullhipotézist, hogy a salary változó 
# normális eloszlású!

pearson.test(salary)
lillie.test(salary)

detach(sal)


#    ---------
#    KÉTMINTÁS
#    ---------

kerdoiv <- read.csv2("kerdoiv.csv", dec=",", na.strings="", fileEncoding="iso-8859-2") 
attach(kerdoiv)

# Teszteljük 5%-is szignifikancia szinten azt a nullhipotézist, 
# hogy a férfi és női autótulajdonosok megoszlása megegyezik!

table(Auto)
chisq.test(Auto, Nem, correct=F) # Yate korrekció kihagyása: correct=F

# Teszteljük 5%-is szignifikancia szinten azt a nullhipotézist, 
# hogy a férfiak és nők hajszínének megoszlása megegyezik!

chisq.test(Hajszin, Nem)
# Warning: túl kicsi minta (valamelyik értékből kevés van).

table(Hajszin)
# amelyikből kevés van, töröljük vagy vonjuk össze másikkal
Hajszin[Hajszin=="vörös"] = "szőke"
Hajszin[Hajszin=="fekete"] = "barna"

chisq.test(Hajszin, Nem, correct=F) # Yate korrekció kihagyása: correct=F

remove(Hajszin)


# Teszteljük 5%-is szignifikancia szinten azt a nullhipotézist, 
# hogy a házasok és kapcsolatban lévők testsúlyának eloszlása
# megegyezik!

table(Csaladi)
boxplot(Suly ~ factor(Csaladi), range=0)
k = as.numeric(factor(Csaladi))
ks.test(Suly[k==3], Suly[k==4])

detach(kerdoiv)


#    ------------
#    FÜGGETLENSÉG
#    ------------

kockak <- read.table("kocka2.txt", header=F, sep="", strip.white=T)
attach(kockak)

# Független-e a V1 kockadobás V2-től?

addmargins(xtabs(~ V1+V2)) # kontingenciatábla (megfigyelt értékek)
chisq.test(V1, V2)
chisq.test(xtabs(~ V1+V2)) # ugyanazt adja
chisq.test(V1, V2)$expected # elvárt értékek
# Warning: túl kevés mintaelem, nem megbízható a teszt

# Kis mintára Fisher egzakt teszt alkalmazhazó pl.
fisher.test(V1, V2)
# Elfogadjuk a függetlenségre vonatkozó nullhipotézist.
# Figyelem! Kis minta esetén hajlamosak a tesztek elfogadni a nullhipotézist!
detach(kockak)

# Nézzük meg nagyobb mintán!

library("readxl")
kockak <- read_excel("kocka2023.xlsx") 
attach(kockak)

addmargins(xtabs(~ V1+V2)) # kontingenciatábla
chisq.test(V1, V2)

# Az egzakt teszt most hibát ad.

# Mivel numerikusak az adatok és nagy a minta, alkalmazható 
# a Pearson-féle korrelációteszt is.

cor.test(V1, V2, method="spearman")

# A Spearman-féle korrelációteszt nem alkalmazható, mert
# nem folytonosak a háttérváltozók.
detach(kockak)

 library(foreign, pos=4)
 brain <- read.spss("brain.sav", use.value.labels=TRUE, max.value.labels=Inf, to.data.frame=TRUE)
attach(brain)

# Feltéve, hogy a súly és magasság normális eloszlást követnek 
# teszteljük 0,05-os szignifikancia szinten, hogy függetlenek!

cor.test(Weight, Height, method="pearson")

# A normális eloszlás folytonos, nézzük meg a Spearman-féle
# korrelációteszttel is!

cor.test(Weight, Height, method="spearman")
# Warning: egyforma értékek (tie), nem megbízható a teszt eredménye

detach(brain)
 

ferfiak <- read.table("ferfiak.txt", header=T, sep="", fileEncoding="iso-8859-2") 
attach(ferfiak)

# Teszteljük 5%-is szignifikancia szinten azt a nullhipotézist, hogy a
# magasság és cipőméret függetlenek! (folytonos változók, kis minta!)

# A minta nem elég nagy, ha a normalitás nem tehető fel, 
# nem alkalmazhatjuk a Pearson-féle korrelációtesztet.
cor(magassag, cipomeret)
cor.test(magassag, cipomeret, method="spearman")
# Megj. Nagy az empirikus korrelációs együttható és a rangkorrelációs
# együttható is, a kis minta miatt viszont nem szignifikáns a 
# kapcsolat még 0,1-es szignifikancia szinten sem.
detach(ferfiak)


kerdoiv <- read.csv2("kerdoiv.csv", dec=",", na.strings="", fileEncoding="iso-8859-2") 
attach(kerdoiv)

# Teszteljük 5%-is szignifikancia szinten azt a nullhipotézist, 
# hogy a sportolás független a hangszeren való játszástól! 

# (kevés értékű diszkrét változók, nagy minta, nem numerikus)
summary(factor(Sport))
xtabs(~ Sport+Hangszer)
chisq.test(Sport, Hangszer)

# Vizsgáljuk meg a kor és a jövedelem kapcsolatát!

plot(Kor, Jovedelem)
# vagy
plot(Jovedelem ~ Kor)

cov(Kor, Jovedelem, use="complete.obs") # kovariancia
cor(Kor, Jovedelem, use="complete.obs") # korreláció

# Teszteljük 5%-is szignifikancia szinten azt a nullhipotézist, 
# hogy a jövedelem független a kortól! (folytonos változók)

cor.test(Jovedelem, Kor, method="spearman")
# Warning: egyforma értékek (tie), nem megbízható a teszt eredménye

cor.test(Kor, Jovedelem, method="pearson")
# Elég nagy minta használható a teszt eredménye



#####################################################################

#            TÖBBVÁLTOZÓS MÓDSZEREK

#####################################################################

#    ----------------------
#    EGYVÁLTOZÓS REGRESSZIÓ
#    ----------------------


# kerdoiv <- read.csv2("kerdoiv.csv", dec=",", na.strings="", fileEncoding="iso-8859-2") 
# attach(kerdoiv)

# Kapcsolat ábrázolása regressziós egyenessel
linmodell1 = lm(log(Jovedelem) ~ Kor)
plot(log(Jovedelem) ~ Kor) # uaz mint plot(Kor, Jovedelem)
abline(linmodell1, col="red")

linmodell1 # modell és paraméterbecslések

#előrejelzés:
predict(linmodell1, newdata=data.frame(Kor=25))

# Nagy minta esetén a normalitásfeltétel elhagyható, de nézzünk rá:
qqnorm(linmodell1$residuals)
abline(0,sd(linmodell1$residuals), col="red")
library(nortest)
lillie.test(linmodell1$residuals)
pearson.test(linmodell1$residuals)

# Feltételvizsgálat - szóráshomogenitás és függetlenség

plot(linmodell1$fitted.values, linmodell1$residuals)
abline(0,0, col="red")



# Vizsgáljuk a testmagasság és cipőméret kapcsolatát!

cor.test(Magassag, Cipo)

cor(Magassag, Cipo, use="complete.obs")^2
plot(Magassag, Cipo)

# Cipo változóban egy nagy érték, töröljük
Cipo[Cipo>100] = NA

cor(Magassag, Cipo, use="complete.obs")
plot(Cipo~Magassag)
# korreláció (és a regressziós egyenes érzékenyek!)

# a modell
linmodell2 = lm(Cipo ~ Magassag)
abline(linmodell2, col="red")

# előrejelzés
predict(linmodell2, newdata=data.frame(Magassag=180))


# Diagnosztika (feltételvizsgálat) - normalitás

qqnorm(linmodell2$residuals)
abline(0,sd(linmodell2$residuals), col="red")

lillie.test(linmodell2$residuals)
pearson.test(linmodell2$residuals)

# Feltételvizsgálat - függetlenség

plot(linmodell2$fitted.values, linmodell2$residuals)
abline(0,0, col="red")
# létezik próba is a függetlenség tesztelésére

# A modell tesztelése
anova(linmodell2)
summary(linmodell2)
# a p-érték ugyanaz, mint a Pearson-féle korrelációtesztnél
cor.test(Magassag, Cipo)
# próbastatisztikák kapcsolata: F = t^2
cor.test(Magassag, Cipo)$statistic^2

# paraméterek becslései
linmodell2$coefficient

# konfidencia intervallumok
confint(linmodell2, level=0.95) 

# Mennyire jó a modell előrejelző ereje? A teljes változékonyság 
# hány százaléka magyarázható a regressziós modellel?

summary(linmodell2)$r.squared
cor(Magassag, Cipo, use="complete.obs")^2
cor(predict(linmodell2), Cipo[!is.na(Magassag)&!is.na(Cipo)])^2

# előrejelzés
predict(linmodell2, newdata=data.frame(Magassag=177))
# intervallummal is
predict(linmodell2, newdata=data.frame(Magassag=177), interval="prediction", level = 0.95) 

# modell összefoglalása
summary(linmodell2)

# keresztvalidáció

emberek <- read.table("emberek.txt", header=T, sep="", na.strings="NA", dec=",", strip.white=TRUE, stringsAsFactors=TRUE, fileEncoding="iso-8859-2")
attach(emberek)
cor(cipomeret, predict(linmodell2, newdata=data.frame(Magassag=magassag)), use="complete.obs")^2


# A testtömegindex definíciója arra utal, hogy a magasság és a súly 
# közt kvadratikus kapcsolat van. Adjunk becslést erre a kapcsolatra!

# A modell: Suly = a*Magassag^2 + b + hiba
regmodell = lm(Suly ~ Magassag^2) 
regmodell$coefficient
regmodell = lm(Suly ~ Magassag) 
regmodell$coefficient
# ugyanaz, nem jó így
regmodell = lm(Suly ~ I(Magassag^2))
# I() szerepe a formula és a modell jelölései közti különbségtétel
regmodell$coefficient
# konstans tag nem kéne
regmodell = lm(Suly ~ I(Magassag^2)-1) 
# -1: additív konstans nélkül
regmodell$coefficient

(a = regmodell$coefficient)
# Kérdés: Ha a magasság méterben lenne adva, mennyi lenne a?

f = function(x) a*(x^2) # becslő függvény

plot(Suly ~ Magassag)
curve(f(x), add=T, col="red") # regressziós görbe

# másik modell: gyök(Suly) = a*Magassag + hiba

regmodell2 = lm(sqrt(Suly) ~ Magassag-1)
(a = regmodell2$coefficient^2)
curve(f(x), add=T, col="blue") 
# ebben a hibák négyzetösszege nem minimális


# Nézzük meg a kor és magasság kapcsolatát!

linmodell3 = lm(Magassag ~ Kor)
plot(Magassag ~ Kor) # uaz mint plot(Kor, Jovedelem)
abline(linmodell3, col="red") # közel vízszintes egyenes
summary(linmodell3) # Elfogadjuk az a=0 hullhipotézist
cor.test(Kor, Magassag) 


#    -----------------------
#    TÖBBVÁLTOZÓS REGRESSZIÓ
#    -----------------------


# kerdoiv <- read.csv2("kerdoiv.csv", dec=",", na.strings="", fileEncoding="iso-8859-2") 
# attach(kerdoiv)

# Nézzük meg azt a többváltozós (konstans tag nélküli) modellt, ahol 
# a súly a magasság négyzetének, a cipőméretnek és a kornak 
# lineáris függvénye! Értelmezzük a modell leírásában szereplő
# értékeket!

tregmodell = lm(Suly ~ I(Magassag^2)+Cipo+Kor-1) 
summary(tregmodell)

# A teszt szerint a cipőméret elhagyható a modellből. Hagyjuk el,
# és nézzük meg, hogy változik a modell magyarázó ereje!

tregmodell2 = lm(Suly ~ I(Magassag^2)+Kor-1) 
summary(tregmodell2)$r.squared

# intervallumok
confint(tregmodell2, level = 0.95) 
predict(tregmodell2, newdata=data.frame(Magassag=177, Kor=23), interval = "prediction", level = 0.95) 

# Vegyük be a modellbe a konstans tagot és teszteljük  
# 5%-os szignifikancia szinten az elhagyhatóságát!

tregmodell3 = lm(Suly ~ I(Magassag^2)+Cipo+Kor) 
summary(tregmodell3)

# intervallumok
confint(tregmodell3, level = 0.95) 
predict(tregmodell3, newdata=data.frame(Magassag=177, Kor=23, Cipo=42), interval = "prediction", level = 0.95) 

detach(kerdoiv)


# megoldás kollinearitás (X^TX nem invertálható) esetén

x1 = rnorm(100)
x2 = rnorm(100)
x3 = x1+2*x2
# X mátrix rangja 2

Y = x1+x2+rnorm(100,0,0.1)

(tlinmodell = lm(Y ~ x1+x2+x3))

# Annyi magyarázó változó marad a modellben, amennyi X mátrix rangja


# Mit tapasztalunk, ha erősen korreláló magyarázó változók vannak?

library(readxl)
autok <- read_excel("autok.xls")
attach(autok)

X = cbind(henger, loero, vegseb, gy100, f90, f120, tomeg)
cor(X)

tregmodell4 = lm(vf ~ X)
summary(tregmodell4)

cor(vf, X)

# A megoldhatóság szempontjából nem baj, ha nincs kollinearitás
# (lineáris algebrai értelemben(!) vett lineáris függőség),
# a magyarázó változók szerepét befolyásolja.

detach(autok)



#####################################################################

#            ÁLVÉLETLEN SZÁMOK

#####################################################################

# LCG által generált álvéletlen számok

set.seed(42) # kezdőérték beállítása

runif(5) # 5 db álvéletlenszám

# Az egészet újrafuttatva ugyanazt adja, set.seed(42) nélkül mást.


# Különböző eloszlású véletlen minták

n = 10000

set.seed(3684) # kezdőérték beállítása
v1 = runif(n, -1, 1) # egyenletes (elemszám, a, b)
hist(v1, freq=F, breaks=13)

set.seed(3684)
v2 = 2*runif(n) - 1
sum(!v1==v2)

v3 = rexp(n, 2) # vagy exponenciális (elemszám, lambda)
hist(v3, freq=F, breaks=20)

v4 = rnorm(n, 0, 1) # normális (elemszám, mu, sigma) 
hist(v4, freq=F, breaks=32)

v5 = rbinom(n, 6, 1/3)
barplot(table(v5)/n)

v6 = rbinom(n, 60, 1/3)
barplot(table(v6)/n)

# visszatevéses húzás

sample(1:10, 15, replace=T) 

# n elem véletlen permutációját hogy lehet megvalósítani?


#       -------------------
#       MONTE CARLO MÓDSZER
#       -------------------

# pí közelítése

N = 20000
t1 = runif(N, -1, 1)
t2 = runif(N, -1, 1)

x <- seq(-1, 1, len=1000)
plot(t1,t2, pch=".", xlim=c(-1,1), ylim=c(-1,1)); curve(sqrt(1-x^2), add=T, lwd=2, col = "blue"); curve(-sqrt(1-x^2), add=T, lwd=2, col = "blue")

N = 20000000
t1 = runif(N, -1, 1)
t2 = runif(N, -1, 1)

(pi_kozelites = 4*sum(t1^2+t2^2<=1)/N)

# Újrafuttatva az egészet más eredményt ad.

pi


# A Craps játék vizsgálata Monte-Carlo szimulációval 
# (Viharos László példája)
# A játék az aranyásók körében volt népszerű, de már játszották a 
# XII.~században a keresztes háborúk katonái. A játékot két játékos 
# játssza két kockával. Ha a dobott számok összege 7 vagy 11, akkor 
# az Első játékos nyer. Ha az összeg 2, 3 vagy 12, akkor a Második 
# játékos nyer. Ha az összeg ezektől különbözik, akkor mindaddig 
# újra dobnak, amíg az összeg 7 nem lesz, amikor a Második nyer, 
# vagy az legelőször dobott összeg megismétlődik, amikor az Első 
# játékos nyer. Egyenlő tétekkel játszva igazságos-e a játék?
# Forrás: Nemetz Tibor, Wintsche Gergely: Valószínűségszámítás és 
# statisztika mindenkinek, Polygon, 1999; 15.20. Feladat.
# Szimuláljuk le a játékot 100 000-szer, melynek felhasználásával 
# adjunk közelítést az Első játékos nyerésének tapasztalati 
# valószínűségét!

m = 100000
k = 0  # a k változóba kerül ez Első játékos nyerésének gyakorisága
set.seed(10)

for (i in 1:m){
  x = sample(1:6, 1, replace=T)  # az egyik kockával "dobott" szám
  y = sample(1:6, 1, replace=T)  # a másik kockával "dobott" szám
  z = x+y
  if (z == 7 | z == 11) {k = k+1}
  else { if (z != 2 & z != 3 & z != 12){
    repeat{
      x = sample(1:6, 1, replace=T)
      y = sample(1:6, 1, replace=T)
      v = x + y
      if (v == 7) {break}
      if (v == z) {k = k+1; break}
    }}}}

# a tapasztalati valószínűség:
k/m


# t-próba statisztikájának eloszlása:

N = 200000
n = 10
t = vector(length=N)
p = vector(length=N)

# kis normális minta esetén
for(i in 1:N){
  v = rnorm(n)
  t[i] = t.test(v)$statistic
  p[i] = t.test(v)$p.value
}

hist(t, freq=F, breaks=96, xlim=c(-6,6),  ylim=c(0,0.4))
curve(dt(x, df=n-1), col="blue", add=T)
mean(p<=0.05) # elutasítás relatív gyakorisága


# kis exponenciális minta esetén
for(i in 1:N){
  v = rexp(n,1)-1
  t[i] = t.test(v)$statistic
  p[i] = t.test(v)$p.value
}

hist(t, freq=F, breaks=192, xlim=c(-6,6),  ylim=c(0,0.4))
curve(dt(x, df=n-1), col="blue", add=T)
mean(p<=0.05) # elutasítás relatív gyakorisága

# nagy exponenciális minta esetén
n = 100
t = vector(length=N)
for(i in 1:N){
  v = rexp(n,1)-1
  t[i] = t.test(v)$statistic
  p[i] = t.test(v)$p.value
}

hist(t, freq=F, breaks=192, xlim=c(-6,6),  ylim=c(0,0.4))
curve(dt(x, df=n-1), col="blue", add=T)
mean(p<=0.05) # elutasítás relatív gyakorisága


#       ----------------------
#       VÉLETLENSÉG TESZTELÉSE
#       ----------------------

# Teszteljük, hogy a beépített generátor egyenletes eloszlású 
# sorozatot generál!

n = 100
unif = runif(n)

library(randtests)
runs.test(unif, threshold=1/2) # véletlenszerűség tesztelése

ks.test(unif, "punif") # egyenletes eloszlás tesztelése


# futamteszt dichotóm változóra tseries csomagban

detach("package:tseries", unload=T)
library(tseries)

runs.test(factor(sample(1:2, n, replace=T))) # dichotóm faktor változóra
