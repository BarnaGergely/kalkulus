# Egy populációban egy betegség arányát szeretnénk vizsgálni. Vettünk
# egy 250 elemű mintát és azt találtuk, hogy mintában 3 beteg van. 
# Teszteljük 5%-os szignifikancia szinten azt a nullhipotézist, hogy 
# a populációban a betegség aránya 1% !

n = 250 # mintaelemszám
k = 3 # elem gyakorisága

# binomiális teszttel
binom.test(k, n, p=0.01)

# a próbastatisztika értéke k=3
# p-érték = 0.7426 > 0.05
# Elfogadjuk a nullhipotézist.

# khínégyzet-próbával
chisq.test(c(3,250-3), p=c(0.01, 1-0.01))

# Warning: a populációhoz képest túl kicsi a betegség feltételezett aránya, ezért
# nem megbízható a teszt eredménye. Ha 0.01 helyett pl. 0.02-t kellett volna 
# tesztelnünk, nem kaptunk volna warningot (próbáljuk ki!).

####################################################
penzerme <- read.table("penzerme.txt", header=TRUE, fileEncoding = "iso-8859-2")

# Feldobtunk egy pénzérmét 100 alkalommal. A penzerme.txt adatállomány
# tartalmazza kapott mintát. Teszteljük 5%-os szignifikancia szinten 
# azt a nullhipotézist, hogy a pénzérme szabályos!

attach(penzerme)

kat = factor(dobás)  # csoportosító változó

summary(kat)

( n = length(kat) )  # mintaelemszám
( k = sum(as.numeric(kat)-1) )  # az írások száma a mintában

# binomiális teszt
binom.test(k, n, p = 0.5)

# a próbastatisztika értéke k = 46
# p-érték=0.4841  > 0.05
# 5%-os szignifikancia szinten elfogadjuk a nullhipotézist.

# khínégyzet-próba
chisq.test(c(k, n-k) , p = c( 0.01, 0.99 ) )

chisq.test( table(kat), p = c( 1/2, 1/2 ) )

# a próbastatisztika értéke 0.10101
# p-érték = 0.7506
# A warning jelzi, hogy nem megbízható a teszt eredménye, nem 
# hozunk döntést ez alapján.

# a próbastatisztika értéke 0.64
# p-érték=0.4237 > 0.05
# 5%-os szignifikancia szinten elfogadjuk a nullhipotézist.

detach(penzerme)


####################################################
# Heterozigóta növények utódait vizsgálják, közülük 80 lett 
# piros virágú és 35 fehér. Teszteljük 5%-os szignifikancia 
# szinten azt a nullhipotézist, hogy a fehér szín recesszíven
# öröklődik, azaz az előfordulás valószínűsége 1/4 !

# khínégyzet próbával:
chisq.test(c(80,35), p=c(3/4, 1/4))

# a próbastatisztika értéke 1.8116
# a p-érték = 0.1783 > 0.05
# 5%-os szignifikancia szinten elfogadjuk a nullhipotézist.

# binomiális teszttel:
binom.test(35, 80+35, p=1/4)
# a próbastatisztika értéke itt 35
# a p-érték = 0.1957 > 0.05
# 5%-os szignifikancia szinten elfogadjuk a nullhipotézist.

# A két teszt eredménye megerősíti egymást.

####################################################
# Teszteljük 5%-os szignifikancia szinten azt a nullhipotézist, hogy 
# az 1-es, 2-es és 3-as családi állapotúak részaránya ugyanakkora 
# a vizsgált populációban!

kolcson <- read.table("kolcson.txt", header=TRUE, dec=",")

attach(kolcson)

kat = factor(csalall)  # csoportosító változó

summary(kat)  # gyakoriságok
table(kat)/length(kat)  # relatív gyakoriságok

chisq.test( table(kat), p = c( 1/3, 1/3, 1/3 ) )

# a próbastatisztika értéke 12.029
# p-érték=0.002444 < 0.05
# 5%-os szignifikancia szinten elvetjük a nullhipotézist.


# Teszteljük 5%-os szignifikancia szinten azt a nullhipotézist, hogy
# az 1-es, 2-es és 3-as családi állapotúak részaránya rendre 0.25,
# 0.25 és 0.5 a vizsgált populációban!

chisq.test( table(kat), p = c( 0.25, 0.25, 0.5 ) )

# a próbastatisztika értéke 0.25714
# p-érték=0.8794 > 0.05
# 5%-os szignifikancia szinten elfogadjuk a nullhipotézist.

detach(kolcson)


###############################################
minta1 = read.table("minta1.txt", header=TRUE, dec=",")
# literes dobozokba töltött tejmennyiségek

# Teszteljük 5%-os szignifikancia szinten azt a nullhipotézist,
# hogy az adatok normális eloszlásúak!

attach(minta1)

library(nortest)

# normalitásvizsgálat khi-négyzet-próbával
pearson.test(tej)

# tesztstatisztika: 21.632
# p-érték=0.8351 > 0.05
# 5%-os szignifikancia szinten elfogadjuk a nullhipotézist.

# normalitásvizsgálat Lilliefors-próbával 
# (a Kolmogorov-Szmirnov-próba becsléses változata)
lillie.test(tej)

# tesztstatisztika: 0.018606
# p-érték=0,5482 > 0.05
# 5%-os szignifikancia szinten elfogadjuk a nullhipotézist.

hist(tej, freq=FALSE)  # sűrűséghisztogram

# haranggörbét illesztünk az adatokra:
curve( dnorm( x, mean = mean(tej), sd = sd(tej) ), add=TRUE )

# A QQ-ábra:
qqnorm(scale(tej))
abline(0,1,col="red")
# Ez is alátámasztja a teszteredményeket.

detach(minta1)


############################################
cars <- read.table("cars2.txt", header=TRUE, dec=",", sep= "\t")

# Teszteljük 5%-os szignifikancia szinten azt a nullhipotézist,
# hogy a súlyadatok normális eloszlásúak!

attach(cars)

library(nortest)

# normalitásvizsgálat khi-négyzet-próbával
pearson.test(weight)

# a próbastatisztika értéke 40.4
# p-érték = 1,441e-05 < 0.05
# 5%-os szignifikancia szinten elvetjük a nullhipotézist.

# normalitásvizsgálat Lilliefors-próbával
lillie.test(weight)

# a próbastatisztika értéke 0.12247
# p-érték=0,000826 < 0.05
# 5%-os szignifikancia szinten elvetjük a nullhipotézist.

# Q-Q ábra
qqnorm(scale(weight))
abline(0,1, col="red")

# sűrűséghisztogram
hist(weight, freq=FALSE)  # sűrűséghisztogram

detach(cars)


###############################################################
cars <- read.table("cars2.txt", header=TRUE, dec=",", sep= "\t")

# Teszteljük 5%-os szignifikancia szinten azt a nullhipotézist, hogy
# a 4 és 8 hengeres motorral rendelkező autók súlyának eloszlása
# megegyezik!

# A súly folytonos változó.

attach(cars)

kat = factor(cylinder)  # csoportosító változó a cylinder (henger) szerint

x = weight[ kat == 4 ]
y = weight[ kat == 8 ]

# homogenitásvizsgálat Kolmogorov-Szmirnov-próbával
ks.test( x, y )

# tesztstatisztika = 0.98
# p-érték <  2.2e-16 < 0.05
# 5%-os szignifikancia szinten elvetjük a nullhipotézist.

op <- par( mfrow = c(1, 2) )

hist(x, freq=FALSE)
hist(y, freq=FALSE)

par(op)

boxplot(x, y, range=0)

detach(cars)


########################################
# Jövedelem minták homogenitásvizsgálata

kolcson <- read.table("kolcson.txt", header=TRUE, dec=",")

attach(kolcson)

tapply( jovedelem, csalall, FUN = mean, na.rm=TRUE )

# Teszteljük 10%-os szignifikancia szinten azt a nullhipotézist, hogy
# az 1-es és a 2-es családi állapotúak jövedelmének eloszlása megegyezik!

# A jövedelem sok értékű, folytonos változónak tekintjük.

x = jovedelem[ csalall == 1 ]
y = jovedelem[ csalall == 2 ]

ks.test( x, y )

# a próbastatisztika értéke 0.16544
# p-érték = 0.8744 > 0.1 (nem egzakt teszttel p = 0.9777)
# 10%-os szignifikancia szinten elfogadjuk a nullhipotézist.

z = jovedelem[ csalall == 3 ]

# Teszteljük 5%-os szignifikancia szinten azt a nullhipotézist, hogy az
# 1-es és a 3-as családi állapotúak jövedelmének eloszlása megegyezik!

ks.test( x, z )

# a próbastatisztika értéke 0.50676
# p-érték = 0.002933 < 0.05 (nem egzakt teszttel p = 0.00645)
# 5%-os szignifikancia szinten elvetjük a nullhipotézist.

# Vessük össze az eredményeket ábrákkal is!

boxplot( jovedelem ~ csalall )

library(lattice)
histogram( ~jovedelem | csalall, type = "density" )

detach(kolcson)


##################################
# Munkahelyi hiányzások vizsgálata
dohanyzas <- read.delim("dohanyzas.txt", header=TRUE, dec=",")

# 15 munkavállalóról feljegyezték, hogy dohányzik-e (0 nem, 1 igen) 
# és hány napot hiányzott a munkahelyéről 1 hónap alatt.

attach(dohanyzas)

kat = factor(dohanyzik)

# Teszteljük 1%-os szignifikancia szinten azt a nullhipotézist, hogy
# dohányzók és a nemdohányzók hiányzási adatainak eloszlása megegyezik!

# A hiányzás sok értékű, folytonosnak tekintjük. Ha sok egyforma érték 
# lenne, nem tekinthetnénk annak, ekkor warningont kapnánk.

x = hianyzas[ kat == 0 ]
y = hianyzas[ kat == 1 ]

ks.test( x, y )

# A próbastatisztika értéke 1.
# p-érték = 0.0001998 < 0.01 (nem egzakt teszttel p = 0.001493)
# 1%-os szignifikancia szinten elvetjük a nullhipotézist.

boxplot( hianyzas ~ kat, range=0)

histogram( ~hianyzas | kat , type = "density")

detach(dohanyzas)


############################################
employee <- read.table("Employee data.txt", header=TRUE,  na.strings="", sep = "\t" )
attach(employee)

# minority: 0-1  (1: kisebbséghez tartozik, 0: nem tartozik kisebbséghez)

# Teszteljük 5%-os szignifikancia szinten azt a nullhipotézist, hogy
# a kisebbséghez tartozók és a kisebbséghez nem tartozók munkaköri
# kategóriájának eloszlása megegyezik! 

# A munkaköri kategória kevés értékű diszkrét változó.

kat1 = factor(minority)
kat2 = factor(jobcat)

# gyakoriságok
table(kat1, kat2)

# relatív gyakoriságok
prop.table(table(kat1, kat2), 1)

# homogenitásvizsgálat khi-négyzet-próbával
chisq.test(kat1, kat2)

# tesztstatisztika = 26.172
# p-érték = 2.074e-06 < 0.05
# 5%-os szignifikancia szinten elvetjük a nullhipotézist.

detach(employee)


##########################################################
kolcson <- read.table("kolcson.txt", header=TRUE, dec=",")

# Teszteljük 5%-os szignifikancia szinten azt a nullhipotézist, hogy a
# 40 év alattiak és a 40 éves kort elért egyének családi állapotának
# eloszlása megegyezik! 

# A családi állapot kevés értékű diszkrét változó.

attach(kolcson)

( f = eletkor < 40 )

kat1 = factor(f)
kat2 = factor(csalall)

# gyakoriságok
table(kat1, kat2)

# relatív gyakoriságok
prop.table(table(kat1, kat2), 1)

# homogenitásvizsgálat khi-négyzet-próbával
chisq.test(kat1, kat2)

# tesztstatisztika = 7.1874
# p-érték = 0.0275 < 0.05
# 5%-os szignifikancia szinten elvetjük a nullhipotézist.

detach(kolcson)


############################################
kolcson <- read.table("kolcson.txt", header=TRUE, dec=",")

# kölcsönt felvevő személyek adatai

# csalall: 1. egyedülálló, 2. elvált vagy özvegy, 3. házas
# adostip: a kölcsönt felvevő korábban volt-e ügyfele a banknak; 1. nem, 2. igen

# Teszteljük 5%-os szignifikancia szinten azt a nullhipotézist, hogy a
# csalall és az adostip változók függetlenek!
 
# Kevés értékű diszkrét változók.

attach(kolcson)

kat1 = factor(csalall)
kat2 = factor(adostip)

# gyakoriságok
xtabs(~kat1+kat2)

table(kat1, kat2)
addmargins(table(kat1, kat2))

# függetlensévizsgálat khi-négyzet-próbával
chisq.test(kat1, kat2)

# tesztstatisztika: 5.7106
# p-érték = 0.05754 > 0.05
# 5%-os szignifikancia szinten elfogadjuk a nullhipotézist.

chisq.test(kat1, kat2)$expected  # elvárt értékek táblázata

detach(kolcson)


############################################
survey <- read.table("1991 U.S. General Social Survey.txt", header=TRUE,  na.strings=c("0","8","9"), dec=",", sep = "\t")

# happy: general happiness; 1 = very happy, 2 = pretty happy, 3 = not too happy
# life: (Is life exciting or dull?) 1 = exciting, 2 = routine, 3 = dull
# gender: 1: male, 2: female

# Teszteljük 5%-os szignifikancia szinten azt a nullhipotézist, hogy a 
# gender és a life változók függetlenek! 

# Kevés értékű diszkrét változók.

attach(survey)

kat1 = factor(gender)
kat2 = factor(life)

table(kat1, kat2)
addmargins(table(kat1, kat2))

# függetlensévizsgálat khi-négyzet-próbával
chisq.test(kat1, kat2)

# a próbastatisztika értéke 11.994
# p-érték = 0.002486 < 0.05
# 5%-os szignifikancia szinten elvetjük a nullhipotézist.


# Teszteljük 5%-os szignifikancia szinten azt a nullhipotézist, hogy a
# gender és a happy változók függetlenek! 

# Kevés értékű diszkrét változók.

kat1 = factor(gender)
kat2 = factor(happy)

table(kat1, kat2)
addmargins(table(kat1, kat2))

# függetlenségvizsgálat khi-négyzet-próbával
chisq.test(kat1, kat2)

# a próbastatisztika értéke 7.7391
# p-érték = 0.02087 < 0.05
# 5%-os szignifikancia szinten elvetjük a nullhipotézist.

detach(survey)


############################################
kor_vernyomas <- read.table("kor_vernyomas.txt", header=TRUE)
# 10 nő életkorát és szisztolés vérnyomását tartalmazza az adatállomány.

# Teszteljük 5%-os szignifikancia szinten azt a nullhipotézist, hogy az
# életkor és a szisztolés vérnyomás függetlenek egymástól!

# Folytonos változók, kis minta, nem tehető fel a normalitás.

attach(kor_vernyomas)

# Spearman-féle korrelácóteszt
cor.test( eletkor, vernyomas, method = c("spearman"))

# a próbastatisztika értéke 72
# p-érték = 0,09579 > 0.05
# 5%-os szignifikancia szinten elfogadjuk a nullhipotézist.

# a Spearman-féle rangkorrelációs együttható értéke:
# 0,5636364, ez középerős pozitív kapcsolatra utal

plot(vernyomas ~ eletkor)

detach(kor_vernyomas)


##########################################################
# Halak fajgazdagságát vizsgálták különböző tavakban.
# Feljegyezték 10 tó területét és a bennük talált halfajok számát.
halfajok <- read.table("halfajok.txt", header=TRUE)

attach(halfajok)

# Teszteljük 5%-os szignifikanciaszinten azt a nullhipotézist, hogy a
# tavak területe és a bennük talált halfajok száma függetlenek egymástól!

# Mindkét változót folytonosnak tekintjük. Kis minta, normalitást nem
# tesszük fel.

cor.test( fajszam, terulet, method = "spearman" )

# a próbastatisztika értéke 28
# p-érték = 0.005557 < 0.05
# Elvetjük a nullhipotézist.

# a Spearman-féle rangkorrelációs együttható értéke:
# 0.830303, erős pozitív kapcsolatra utal

plot( terulet, fajszam )

detach(halfajok)

##############################################
kurzusok <- read.table("kurzusok.txt", header=TRUE)

# Felmérték, hogy 10 másodéves hallgató mennyire jártas a kalkulus 
# és a történelem tárgyakban; a megkérdezett hallgatók értékelését 
# tartalmazza az adatállomány. Feltesszük, hogy az értékelések
# normális eloszlást követnek.

attach(kurzusok)

# Teszteljük 5%-os szignifikanciaszinten azt a nullhipotézist, hogy 
# a kalkulus és a történelem értékelések függetlenek egymástól!

cor.test( tortenelem, kalkulus, method = "pearson" )

# a próbastatisztika értéke 0.51577
# p-érték = 0.62 > 0.05
# Elfogadjuk a nullhipotézist.

# A korrelációs együttható becslése 0.1793948
# Lehetséges, hogy nem függetlenek, csak a kis mintaelemszám miatt
# nem tudja a teszt kimutatni a kapcsolatot.

# Nézzük meg Spearman-féle korrelációteszttel is!

cor.test( tortenelem, kalkulus, method = "spearman" )

# a próbastatisztika értéke 137.75
# a p-érték 0.6485
# A warning miatt nem megbízható a teszt eredménye, nem döntünk
# az eredménye alapján.

detach(kurzusok)


##################################################
sal <- read.table("salary.txt", header = TRUE)
attach(sal)

# Kérdezzük le a 'jobkat' és az 'educ' változó együttes gyakorisági
# táblázatát. 
gyak.tablazat = table(jobkat, educ)
addmargins(gyak.tablazat)

# Teszteljük 5%-os szignifikancia szinten azt a nullhipotézist, hogy
# a két változó független! (Kevés értékű diszkrét változók.)

chisq.test(gyak.tablazat, correct = FALSE)

# a próbastatisztika értéke 253.54
# p-érték < 2.2e-16 < 0.05
# Elutasítjuk a nullhipotézist.

detach(sal)

##################################################
sal <- read.table("salary.txt", header = TRUE)
attach(sal)

# Teszteljük 1%-os szignifikancia szinten, hogy a jelenlegi fizetés és a
# kezdőfizetés független egymástól! 

# Folytonos változók, nagy minta.

cor.test(salbegin, salary, method = "pearson")

# a próbastatisztika értéke 39.374
# p-érték < 2.2e-16 < 0.01
# Elutasítjuk a nullhipotézist.

# Jellemezzük a kapcsolatot!

cor(salbegin, salary, method = "pearson")

# A korrelációs együttható becslése:
# 0.8755602 erős pozitív kapcsolatra utal

# Adjunk meg egy 99 százalékos megbízhatóságú konfidencia intervallumot
# az elméleti korrelációra!

cor.test(salbegin, salary, method = "pearson", conf.level = 0.99)$conf.int

# (0.8448077, 0.9005475)

# Ábrázoljuk a salary változót a salbegin függvényében és illesszünk
# regressziós egyenest az ábrára!

plot( salary ~ salbegin )
abline( lm(salary ~ salbegin), col="blue")

detach(sal)


##################################################
library(readxl)
autok <- read_excel("autok.xls")
attach(autok)

# A tomeg és a gy10 (gyorsulás 100-ra) kapcsolatát szeretnénk vizsgálni.

plot(gy100 ~ tomeg)

# Illesszünk lineáris modellt, amelyben a gy100 a függő, a tomeg a 
# magyarázó változó!

( model = lm(gy100 ~ tomeg) )

# tomeg együtthatója -0.007442, úgy tűnik, negatív a kapcsolat 
# a konstans tag becslése 19.641082, tehát a modell becslése:
# gy100 = -0.007442 * tomeg + 19.641082 + hiba

# Ábrázoljuk a regressziós egyenest!
abline(model, col="blue")

# gy100 változékonyságának (varianciájának) mekkora arányát magyarázza a modell?
summary(model)$r.squared

# 34,8%-át

# Teszteljük 5%-os szignifikancia szinten azt a nullhipotézist, hogy
# a regressziós egyenes meredeksége 0 !

summary(model)

# A próbastatisztika értéke F = 37.85
# p-érték = 4.037e-08 < 0.05
# Elutasítjuk a nullhipotézist.

# Adjunk 95% megbízhatósági szintű konfidencia intervallumot a
# regressziós egyenes konstans tagjára!

confint(model, level=0.95)

# (16.954714851, 22.327448317)

# Adjunk meg olyan intervallumot, amelybe egy 900 tömegű autó
# gy100 értéke 90% valószínűséggel beleesik!

predict(model, newdata=data.frame(tomeg=900), interval = "prediction", level = 0.9)

# (8.917532, 16.96921)

detach(autok)

##################################################
repair <- read.delim("computer_repair.txt", header=TRUE, sep= "\t")

# Egy cég számítógépek javításával foglalkozik.
# Az adatállomány 14 esethez tartozó adatpárt tartalmaz.
# 1. a szervizelés hossza percekben ("minutes" változó),
# 2. cserélendő vagy javítandó alkatrészek száma ("units" változó).

# Hogyan függ a szervizelés hossza a cserélendő vagy javítandó 
# alkatrészek számától?

attach(repair)

plot( units, minutes )

cor(units, minutes)

( model = lm(minutes ~ units) )

# az "a" paraméter becslése: 15.509
# a "b" paraméter becslése: 4.162
# lineáris modell becslése: minutes = a*units + b + hiba

# Ábrázoljuk a becsült regressziós egyenest!
abline(model)

# A "minutes" változó teljes változékonyságának hány százaléka
# magyarázható a "units" változótól való lineáris függésével?

summary(model)$r.squared

# 98.7%

# Adjunk 95% megbízhatósági szintű konfidencia intervallumot a
# regressziós egyenes meredekségére!
confint(model, level=0.95)

# konfidencia intervallum a-ra: (14.408512, 16.60903)

# Teszteljük 5%-os szignifikanciaszinten azt a nullhipotézist,
# hogy a regressziós egyenes meredeksége 0!
summary(model)

# a próbastatisztika F = 943.2 
# p-érték = 8.92e-13 < 0.05
# Elvetjük a nullhipotézist.

# Adjunk becslést a szervizelés hosszára, ha a cserélendő vagy
# javítandó alkatrészek száma 4 !

(a = model$coefficient[2])
(b = model$coefficient[1])
f = function(x) a*x + b
f(4)
# vagy
predict(model, newdata=data.frame(units=4))

# 66 perc

# Adjunk meg egy olyan intervallumot, melyre teljesül, hogy egy
# units = 4 értékhez tartozó számítógép szervizelésének hossza
# ebbe az intervallumba esik!

predict(model, newdata=data.frame(units=4), interval = "prediction", level = 0.95)

# (53.83936, 78.55413)

detach(repair)

# A példa forrása:
# Samprit Chatterjee, Ali S. Hadi: Regression Analysis by Example,
# Fourth Edition, John Wiley & Sons, Inc., Hoboken, New Jersey, 2006
# 2.3 Example, p. 26


##################################################
sal <- read.table("salary.txt", header = TRUE)
attach(sal)

plot( salary ~ salbegin )

# A salary és salbegin változók helyett térjünk át azok logaritmusára!

logsal = log(salary)
logsalbeg = log(salbegin)

plot(logsal ~ logsalbeg)
# Az ábra a változók logaritmusai közti lineáris kapcsolatot sejtet. 

# A logsal változónak a logsalbeg változótól való való függését
# szeretnénk jellemezni. A regressziós modell becslése:

(linmodel = lm(logsal ~ logsalbeg))

# logsalbeg együtthatója 1.0118, úgy tűnik, pozitív kapcsolat van 
# a változók közt, a konstans tag becslése 0.5663, tehát a modell:
# logsal = 1.0118 * logsalbeg + 0.5663 + hiba

abline(linmodel, col="blue")

# A modell előrejelző ereje:
summary(linmodel)$r.squared

# R^2 = 0.783854, tehát logsal varianciájának kb. 78,4%-a 
# magyarázható a logsalbeg változótól való lineáris függésével.

# Adjunk előrejelzést a salary értékére, ha salbegin értéke 17000 !

# Előrejelzés logsal értékére:
logpred = predict(linmodel, newdata=data.frame(logsalbeg=log(17000)))

# Előrejelzés salary értékére:
exp(logpred)

# 33600.43 

detach(sal)


#############################################################
# Halak fajgazdagságát vizsgálták különböző tavakban.
# Feljegyezték 10 tó területét és a bennük talált halfajok számát.
halfajok <- read.table("halfajok.txt", header=TRUE)

attach(halfajok)

plot( terulet, fajszam )
# Az ábra nemlineáris kapcsolatot sejtet. 

# Legyen a modell: fajszam = a*log(terulet) + b + hiba

( model = lm(fajszam ~ log(terulet)) )

# az "a" paraméter becslése: 9.671
# a "b" paraméter becslése: -29.212

# a modell becslése:
# fajszam = 9.671*log(terulet) - 29.212 + hiba

# Ábrázoljuk a becsült regressziós függvényt!
(a = model$coefficient[2])
(b = model$coefficient[1])
curve( a*log(x)+b, add=TRUE )

# Becsüljük meg, hogy hány halfaj található egy 5800 km^2 területű tóban!
f = function(x) a*log(x)+b
f(5800)

detach(halfajok)

# A példa forrása:
# Reiczigel Jenő, Harnos Andrea, Solymosi Norbert: Biostatisztika nem 
# statisztikusoknak, 2010, Pars Kft., Nagykovácsi
# 9.15. példa, 297. oldal
