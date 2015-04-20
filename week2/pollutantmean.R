#num_el <- length(list.files("specdata"))
# paste(x,"csv", sep = ".")
pollutantmean <- function(directory, pollutant, id = 1:332) {
        curdir <- getwd()
        setwd(directory)
        airdatalist <- list.files()
        meanair <- 0
        lengthair <-0
        for (i in 1:length(id)) {
                aird <- read.csv(airdatalist[id[i]])
                good <- complete.cases(aird[,pollutant])
                if (mean(aird[good,pollutant]) != "NaN") {
                        meanair[i] <- mean(aird[good,pollutant])
                        lengthair[i] <- length(aird[good,pollutant])   
                }
                
                aird <- 0
                good <- 0
                                
        }    
        setwd(curdir)
        meanair <- meanair[complete.cases(meanair)]
        lengthair <- lengthair[complete.cases(lengthair)]        
        sum(meanair*lengthair)/sum(lengthair)
}


