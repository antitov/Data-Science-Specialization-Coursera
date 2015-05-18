fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, destfile = "housingIDAHO.csv")
housingID <- read.csv("housingIDAHO.csv")


fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileURL, destfile = "natgas.xlsx")
library(xlsx)
GAS <- read.xlsx("natgas.csv")