setwd("C:/Users/a.titov/rprog/getting-cleaing-data/week3")
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv "
download.file(fileURL, destfile = "uscomm.csv")
uscomm <- read.csv("uscomm.csv")
file.remove("uscomm.csv")

agricultureLogical <- uscomm$ACR==3 & uscomm$AGS==6
which(agricultureLogical)

##Jpeg question
library(jpeg)

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileURL, destfile = "jeff.jpg")
picjpeg <- readJPEG("getdata-jeff.jpg", native = TRUE)
file.remove("jeff.jpg")

###GDP quiz
packages <- c("data.table", "jpeg")
sapply(packages, require, character.only = TRUE, quietly = TRUE)
library(dplyr)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
fileURLedu <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileURL, destfile = "GDP.csv")
download.file(fileURLedu, destfile = "GDPedu.csv")
GDP <- data.table(read.csv("GDP.csv", skip=4, nrows=219))
GDPedu <- data.table(read.csv("GDPedu.csv"))
setnames(GDP, c("X", "X.1", "X.3", "X.4"), c("CountryCode", "rankingGDP", 
                                               "Long.Name", "gdp"))
file.remove("GDP.csv", "GDPedu.csv")

sum(GDP$CountryCode %in% GDPedu$CountryCode)
GDP$gdp <- gsub(",","",GDP$gdp)
GDP$gdp <- gsub(" ","",GDP$gdp)
GDP[,5] <- as.numeric(GDP$gdp)
GDP[5:nrow(GDP),5] <- sapply(GDP$X.3[5:nrow(GDP)],as.numeric)
arrange(GDP,gdp)[13,]$Long.Name
GDPmerged <- merge(GDP,GDPedu, all = TRUE, by = c("CountryCode"))
sum(!is.na(unique(GDPmerged$rankingGDP)))
mean(GDPmerged[GDPmerged$Income.Group == "High income: OECD",]$rankingGDP)
mean(GDPmerged[GDPmerged$Income.Group == "High income: nonOECD",]$rankingGDP, na.rm = TRUE)
GDPmerged[, mean(rankingGDP, na.rm = TRUE), by = Income.Group]


breaks <- quantile(GDPmerged$rankingGDP, probs = seq(0, 1, 0.2), na.rm = TRUE)
GDPmerged$quantileGDP <- cut(GDPmerged$rankingGDP, breaks = breaks)
table(cut(GDPmerged$rankingGDP, breaks = breaks))
GDPmerged[Income.Group == "Lower middle income", .N, by = c("Income.Group", "quantileGDP")]