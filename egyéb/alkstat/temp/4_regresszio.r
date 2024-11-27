# encoding: UTF8
# v1, v2 numerikus vektor


# regresszióanalízis modellje

(modell = lm(v2~v1)) # lineáris regreszió egyváltozós esetben
(modell = lm(v2~I(log(v1)))) # log függvényt illeszti

summary(modell) # paraméterek, tesztek, R^2
summary(modell)$r.squared # r^2 becslése, magyarázó erő
(a=modell$coefficient[2]) # meredekség
(b=modell$coefficient[1]) # tengelymetszet
confint(modell, level = 0.95) # konfidencia intervallum a paraméterekre 

# előrejelzés 

f = function(x) a*x+b # a becslő függvény lineáris esetben 
f = function(x) a*log(x)+b # a becslő függvény nemlineáris esetben
f(v) # előrejelzés a fenti függvénnyel, v lehet vektor is
predict(modell, newdata=data.frame(v1=v), interval = "prediction", level = 0.95) # előrejelzés + előrejelzési intervallum a kimenetelek értékére

# ábra

plot(v2~v1) # vagy plot(v1,v2)
abline(modell) # regressziós egyenes lineáris esetben
curve(f(x), add=T) # regressziós görbe