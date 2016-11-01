library(data.table)
library(ggplot2)


# fileURL <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
# temp <- tempfile()
# download.file(fileURL, temp)

Sys.setlocale("LC_TIME", "C");
download.file(fileURL,"stormdata.csv.bz2")
#Attention on parameter fill = TRUE. It's needed to refill blank cells is csv file
stormdata <- read.table("stormdata.csv.bz2", fill = TRUE)

stormdata <- read.table("stormdata.csv.bz2", fill = TRUE, sep = ",", nrows = 10000,  header = TRUE)



stormdata <- read.table("stormdata.csv.bz2", fill = TRUE, sep = ",",  header = TRUE)

stormdata[stormdata$PROPDMG==max(stormdata$PROPDMG),]
unique(stormdata[stormdata$FATALITIES>0,]$EVTYPE)
setwd("c:/Users/a.titov/rprog-projects/5. Reproducible Research PA2/")

fileURL <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
temp <- tempfile()
download.file(fileURL, temp)


unlink(temp)

#ggploy stat summary
# stat_summary(fun.data=mean_cl_normal)
