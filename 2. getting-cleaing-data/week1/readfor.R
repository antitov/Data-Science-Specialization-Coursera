
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(fileURL, destfile = "data.for")
sst <- read.fwf("data.for", widths = c(15,4,9,4,9,4,9,4,4), skip = 4)
file.remove("data.for") 