library(sqldf)
setwd("c:/Users/a.titov/rprog/getting-cleaing-data/week1/")

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileURL, destfile = "acs.csv")
acs <- read.csv("acs.csv")
file.remove("acs.csv")

sqldf("select distinct AGEP from acs")
unique(acs$AGEP)
sqldf("select pwgtp1 from acs where AGEP < 50")
