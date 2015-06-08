setwd("C:/Users/ewok/rprog/Exploratory-Data-Analysis")
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
library(data.table)
download.file(fileURL, temp)

data <- read.table(unz(temp, "household_power_consumption.txt"))


unlink(temp)