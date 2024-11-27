# encoding: UTF8
# v, v1, v2 numerikus vektor, kat, kat1, kat2 faktor


# binomiális teszt (kétértékű változóra)

(n = length(kat[!is.na(kat)]))
k = table(kat)[2] # 2. érték gyakorisága
binom.test(k, n, p = 0.5) # k: megfigyelt események száma, n: elemszám


# Khi^2 eloszlásra: 

gyak = table(kat) # gyakoriságok
chisq.test(gyak) # diszkrét uniform teszt
chisq.test(gyak, p=valsz) # p valószínűségvektor 

library(nortest) 
pearson.test(v) # chi^2 becsléses normalitásteszt


# Kolmogorov-Smirnov becsléses normalitásteszt (Lilliefors-teszt): 

lillie.test(v) 


# kétmintás Kolmogorov-Smirnov: 

k = as.numeric(kat)
ks.test(v[k==1], v[k==2])


# Khi^2 homogenitásra és függetlenségre: 

xtabs(~kat1+kat2) # kontingenciatábla
table(kat1, kat2)
addmargins(table(kat1, kat2))
chisq.test(kat1, kat2)$expected # elvárt értékek
chisq.test(kat1, kat2, correct=F) 


# Korrelációtesztek: 

cor.test(v1, v2, method="pearson")
cor.test(v1, v2, method="spearman")