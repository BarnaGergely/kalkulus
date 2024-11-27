# encoding: UTF8

# munkakönyvtár beállítása

setwd("C:\\ngyj")
getwd()
dir()

# csomag telepítése (Packages fül alatt is lehet)

install.packages("csomag neve")

# típusok, struktúra 

typeof(v)
class(v)
str(v)

# vektor faktorrá konvertálása

f = factor(v) 

# álvéletlenszámok generálása

sample(1:N, n, replace=T) # visszatevéses húzás N elemből
sample(1:n, n, replace=F) # n elem véletlen permutációja

set.seed(K) # randomszámgenerátor kezdőállapot beállítása
rbinom(n, N, p) # (N,p) paraméterű binomiális
rpois(n, lambda) # lambda paraméterű Poisson
rnorm(n) # standard normális
rnorm(n, mu, szigma2) # (mu,szigma2) paraméterű normális
runif(n, a, b) # (a,b) intervallumon egyenletes
rexp(n, lambda) # lambda paraméterű exponenciális

# szűrés

v1[bool_vektor]

# adatfájl beolvasás, adat kiíratása

load("data.rda")
data$x
 
# fájl import (decimális jel!) 
# fileEncoding Adatok mappában lévő szövegfájlok esetén iso-8859-2 vagy UTF8 

adatok <- read.table("adatok.txt", header=TRUE, sep="", na.strings="NA", dec=".", strip.white=TRUE, stringsAsFactors=TRUE, fileEncoding = "")
# sep a szeparáló karakter, üres jelzi a whitespace-t, \t a tabulátor
adatok <- read.table("adatok.csv", header=TRUE, sep=";", na.strings="", dec=",", strip.white=TRUE, stringsAsFactors=TRUE, fileEncoding = "")
adatok <- read.csv2("adatok.csv", dec=",", na.strings="", stringsAsFactors=TRUE, fileEncoding = "") # 


library(foreign, pos=4)
adatok <- read.spss("adatok.sav", use.value.labels=TRUE, max.value.labels=Inf, to.data.frame=TRUE) # SPSS adatfájl

library("readxl")
adatok <- read_excel("adatok.xls") 

# vagy
# library("openxlsx")
# adatok <- read.xlsx("adatok.xlsx") 

# adathalmaz csatolása, lecsatolása

attach(adatok)
detach(adatok)

# adattábla mentése

write.table(adatok, file="adatok.txt") # szövegfájlba
save(adatok, file="adatok.rda") # R adatfájlba