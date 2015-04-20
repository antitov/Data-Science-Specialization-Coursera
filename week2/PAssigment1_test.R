air1 <-read.csv("070.csv")
air2 <-read.csv("071.csv")
air3 <-read.csv("072.csv")
poll <- "nitrate"
air2good <- complete.cases(air2[,poll])
air1good <- complete.cases(air1[,poll])
air3good <- complete.cases(air3[,poll])
mm <-0
ll <- 0
mm[1] <- mean(air1[air1good, poll])
mm[2] <- mean(air2[air2good, poll])
mm[3] <- mean(air3[air3good, poll])

ll[1] <- length(air1[air1good, poll])
ll[2] <- length(air2[air2good, poll])
ll[3] <- length(air3[air3good, poll])

(ll[2]*sum(air1[air1good, "sulfate"])+ll[1]*sum(air2[air2good, "sulfate"]))/(2*ll[1]*ll[2])
sum(mm*ll)/sum(ll)
mean(mm)

id=1:2
pollutant = "sulfate"
meanair <- 0
lengthair <-0
count <- 0
i

for (i in 1:length(id)) {
        aird <- read.csv(airdatalist[id[i]])
        good <- complete.cases(aird)
        meanair[i] <- mean(aird[good,pollutant])
        lengthair[i] <- length(aird[good,pollutant])
        aird <- 0
        good <- 0
        count <- count+1
}    
sum(meanair*lengthair)/sum(lengthair)
