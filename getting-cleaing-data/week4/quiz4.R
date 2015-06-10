#install_from_swirl("Getting and Cleaning Data")

#question 1
#Apply strsplit() to split all the names of the data frame on the characters "wgtp".
#What is the value of the 123 element of the resulting list?
setwd("C:/Users/a.titov/rprog/getting-cleaing-data/week4")
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, destfile = "uscomm.csv")
survey <- read.csv("uscomm.csv")
file.remove("uscomm.csv")
#answer is 
strsplit(names(survey),"wgtp")[123]
#question 2
#Remove the commas from the GDP numbers in millions of dollars and average them. What is the average? 
library(dplyr)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileURL, destfile = "GDP.csv")
GDP <- data.table(read.csv("GDP.csv", skip=4, nrows=219))
setnames(GDP, c("X", "X.1", "X.3", "X.4"), c("CountryCode", "rankingGDP", 
                                             "Long.Name", "gdp"))
file.remove("GDP.csv")

GDP$gdp <- gsub(",","",GDP$gdp)
GDP$gdp <- gsub(" ","",GDP$gdp)
#GDP[,5] <- as.numeric(GDP$gdp)
#mean(as.numeric(grep("[0-9]{7,}",GDP$gdp[1:191], value = TRUE)))

mean(as.numeric(GDP$gdp[1:191]), na.rm = TRUE)
#quaestion 3
#How many countries begin with United?
grep("^[uU]nited", GDP$Long.Name)
#question 4
#Match the data based on the country shortcode. 
#Of the countries for which the end of the fiscal year is available, how many end in June? 
fileURLedu <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileURLedu, destfile = "GDPedu.csv")
GDPedu <- data.table(read.csv("GDPedu.csv"))
                                             "Long.Name", "gdp"))
file.remove("GDPedu.csv")
GDPmerged <- merge(GDP,GDPedu, all = TRUE, by = c("CountryCode"))
fiscal <- grep("[fF]iscal year end: June",GDPmerged$Special.Notes)
length(fiscal)
#Question 5
#You can use the quantmod (http://www.quantmod.com/) package to get historical stock prices for
#publicly traded companies on the NASDAQ and NYSE. Use the following code to download data
#on Amazon's stock price and get the times the data was sampled.
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 
dates <- index(amzn$AMZN.Open)
dates2012 <- dates[dates > "2012-01-01" & dates < "2012-12-31"]
length(dates2012)
Sys.setlocale("LC_TIME", "English")
sum(weekdays(dates2012) == "Monday")

