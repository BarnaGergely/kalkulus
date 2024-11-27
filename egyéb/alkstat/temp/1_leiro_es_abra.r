# encoding: UTF8
# adat adattáblázat (dataframe), v numerikus vektor, kat faktor


length(adat) # változók száma 
ncol(adat) # változók száma
nrow(adat) # mintaelemszám 

summary(adatok) 
plot(ecdf(v)) # empirikus eloszlásfüggvény - csak vektorra!
ecdf(v)(x0) # az empirikus eloszlásfüggvény értéke az x0 helyen, v lehet numerikus változó vagy vektor


# diszkrét változó 

length(kat) # mintaelemszám
length(kat[!is.na(kat)]) # hiányzó adatok nélkül
sum(!is.na(kat)) # ugyanaz

summary(kat) # gyakoriságok faktor változó esetén
table(kat) # ua. hiányzó adatok nélkül
prop.table(table(kat)) # relatív gyakoriságok

pie(table(kat)) # kördiagram
barplot(table(kat)) # oszlopdiagram - gyakoriságok
barplot(prop.table(table(kat))) # relatív gyakoriságok

# folytonos változó 

summary(v) # kvartilisek, átlag numerikus vektor esetén
length(v) # mintaelemszám
sum(!is.na(v)) # hiányzó adatok nélkül

range(v, na.rm=TRUE) # min, max
range(v, na.rm=TRUE)[2]-range(v, na.rm=TRUE)[1] # mintaterjedelem
max(v, na.rm=TRUE) - min(v, na.rm=TRUE) # mintaterjedelem

mean(v, na.rm=TRUE)  # átlag, hiányzó adatok átugrása

var(v, na.rm=TRUE) # variancia becslése
sd(v, na.rm=TRUE) # szórás becslése

std_v = scale(v) # standardizálás

library(moments)
skewness(v, na.rm=TRUE) # ferdeség
kurtosis(v, na.rm=TRUE) # csúcsosság (lapultság)

median(v, na.rm=TRUE) # empirikus medián

quantile(v, na.rm=TRUE)  # min, 1. kvartilis, medián (= 2. kvartilis), 3. kvartilis, max
quantile(v, probs=c(p,q), na.rm=TRUE) # p- és q-kvantilis

IQR(v) # interkvartilis terjedelem

boxplot(v, range=0)

hist(v,freq=FALSE) # sűrűséghisztogram

# normális Q-Q ábra (standardizált változóra)
std_v = scale(v) # standardizálás
qqnorm(std_v)
abline(0,1, col="red") # x=y egyenes

# csoportosítva (summary, min, max, range, mean, var, sd, skewness, median, quantile, IQR, stb.)

tapply(v, list(kat), mean, na.rm=TRUE) # kat szerint csoportosított átlagok
aggregate(v, list(kat), mean, na.rm=TRUE) # ua.

barplot(tapply(v, list(kat), mean, na.rm=TRUE)) # átlagok csoportonként
boxplot(v~kat, range=0) # boxplot csoportonként

# Kovariancia, korreláció:

cov(v1, v2, use="complete.obs") # kovariancia
cor(v1, v2, use="complete.obs") # korreláció

plot(v1,v2) 