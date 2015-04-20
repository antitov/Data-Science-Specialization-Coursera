corr <- function (directory, threshold  = 0) {
        setwd(directory)
        airdatalist <- list.files()
        crr <- NA
        for (i in 1:length(airdatalist)) {
                aird <- read.csv(airdatalist[i])
                good <- complete.cases(aird)
                
                if (sum(good) > threshold ) 
                        crr[i] <- cor(aird[good, "sulfate"], aird[good, "nitrate"])
                        
                
        }    
        crr[complete.cases(crr)]
}
