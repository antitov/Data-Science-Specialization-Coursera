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
par(mfrow = c(1,1))
png(filename = "plot1.png", width = 480, height = 300)
plot(xaxis, sumsYears, pch = 20, col = "red",
     ylab = "PM2.5, millons of tons", xlab = "Years", xaxt = "n", ylim = c(0, 8))
axis(1, at = 1:4, Years)
legend("topright", legend = "Data", pch = 20, col = "red")
title("Overall Emission of PM2.5")
fit <- lm(sumsYears ~ xaxis)
abline(fit, lwd = 1, col = "blue")
dev.off()
#question 2:
#Have total emissions from PM2.5 decreased in the Baltimore City,
#Maryland (fips == "24510") from 1999 to 2008? Use the base plotting
#system to make a plot answering this question.
library(dplyr)
par(mfrow = c(1,1))
png(filename = "plot2.png", width = 480, height = 480)
NEIBalti <- filter(NEI, fips == "24510")
NEIBaltiYearsSum <- summarise(group_by(NEIBalti, year),
                              pm2.5 = sum(Emissions, na.rm = TRUE))
plot(NEIBaltiYearsSum$year, NEIBaltiYearsSum$pm2.5, pch = 20, col = "red",
     ylab = "PM2.5, tons", xlab = "Years", xaxt = "n")
axis(1, NEIBaltiYearsSum$year, Years)
legend("topright", legend = "Data", pch = 20, col = "red")
title("Overall Emission of PM2.5 in Baltimore")
fit <- lm(NEIBaltiYearsSum$pm2.5 ~ NEIBaltiYearsSum$year)
abline(fit, lwd = 1, col = "blue")
dev.off()
#question 3:
#Of the four types of sources indicated by the type (point, nonpoint, 
#onroad, nonroad) variable, which of these four sources have seen decreases 
#in emissions from 1999–2008 for Baltimore City? Which have seen increases 
#in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot 
#answer this question.










#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?
