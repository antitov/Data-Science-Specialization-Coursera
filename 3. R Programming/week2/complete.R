complete <- function(directory, id = 1:332) {
        setwd(directory)
        airdatalist <- list.files()
        dfcc <- data.frame(id= integer(0), nobs = numeric(0))
        lengthair <-0
        for (i in 1:length(id)) {
                aird <- read.csv(airdatalist[id[i]])
                good <- complete.cases(aird)
                dfcc[i,1] <- id[i]
                dfcc[i,2] <- sum(good)
                                            
        }    
        dfcc
}

