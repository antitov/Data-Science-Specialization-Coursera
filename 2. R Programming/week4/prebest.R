outcomeData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
oDHA <- as.numeric(outcomeData$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
oDHF <- as.numeric(outcomeData$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
oDP <- as.numeric(outcomeData$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
#converting to numeric values for heart attack
outcomeData$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack <- oDHA
#converting to numeric for hear faliure
outcomeData$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure <- oDHF
#converting to numeric for pneumonia
outcomeData$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia <- oDP
#creating function for increment (just for fun  =) )
`%+=%` = function(e1,e2) eval.parent(substitute(e1 <- e1 + e2))
#clearin from NAs from HA, HF, P
#outcomeData <- outcomeData[complete.cases(oDHA) & complete.cases(oDHF) & complete.cases(oDP), ]