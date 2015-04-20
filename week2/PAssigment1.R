#num_el <- length(list.files("specdata"))
# paste(x,"csv", sep = ".")
polutantmean <- function(directory, pollutant, id = 1:332) {
        setwd(directory)
        airdatalist <- list.files()
        meanair <- 0
        lengthair <-0
        for (i in 1:length(id)) {
                aird <- read.csv(airdatalist[id[i]])
                good <- complete.cases(aird[,pollutant])
                meanair[i] <- mean(aird[good,pollutant])
                lengthair[i] <- length(aird[good,pollutant])
                aird <- 0
                good <- 0
                                
        }    
        sum(meanair*lengthair)/sum(lengthair)
}


