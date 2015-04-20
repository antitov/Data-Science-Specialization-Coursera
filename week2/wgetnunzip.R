data_url <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(data_url, "specdata.zip")
unzip("specdata.zip")
file.remove("specdata.zip")