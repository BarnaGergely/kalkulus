setwd("D://SZTE//Kalkulus//kalkulus-szte//docs//egyéb//alkstat//temp")
getwd()
adatok <- read.table("adatok.txt", header=TRUE, sep="", na.strings="NA", dec=".", strip.white=TRUE, stringsAsFactors=TRUE, fileEncoding = "")

library(nortest) 
pearson.test(adatok$pretest.2)

lillie.test(adatok$pretest.2) 