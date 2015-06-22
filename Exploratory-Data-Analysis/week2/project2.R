#set locale Language to ENG
Sys.setlocale("LC_TIME", "C");
Sys.setlocale("LC_TIME", "C");
setwd("C:/Users/a.titov/rprog/Exploratory-Data-Analysis/week2")
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileURL, destfile = "data.zip")
unzip("data.zip")
file.remove("data.zip")
NEI <- readRDS("summarySCC_PM25.rds", refhook = NULL)
SCC <- readRDS("Source_Classification_Code.rds", refhook = NULL)
file.remove("summarySCC_PM25.rds","Source_Classification_Code.rds")
#question 1:
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
#Using the base plotting system, make a plot showing the total PM2.5 emission
#from all sources for each of the years 1999, 2002, 2005, and 2008.
sumsYears <- c(sum(NEI[NEI$year == 1999,]$Emissions),
               sum(NEI[NEI$year == 2002,]$Emissions),
               sum(NEI[NEI$year == 2005,]$Emissions),
               sum(NEI[NEI$year == 2008,]$Emissions))
sumsYears <- sumsYears/1e+6
Years <- c(1999, 2002, 2005, 2008)
xaxis <- 1:4
plot(xaxis, sumsYears, pch = 20, col = "red",
     ylab = "PM2.5, millons of tons", xlab = "Years", xaxt = "n")
axis(1, at = 1:4, Years)
legend("topright", legend = "Data", pch = 20, col = "red")
title("Overall Emission of PM2.5")
fit <- lm(sumsYears ~ xaxis)
abline(fit, lwd = 1, col = "blue")

                                     