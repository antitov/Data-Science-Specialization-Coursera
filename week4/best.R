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
#clearin from NAs from HA, HF, P
#outcomeData <- outcomeData[complete.cases(oDHA) & complete.cases(oDHF) & complete.cases(oDP), ]
#creating function for increment (just for fun  =) )
`%+=%` = function(e1,e2) eval.parent(substitute(e1 <- e1 + e2))
best <- function(state, outcome) {
        #checking for statre validity
        if (sum(state == state.abb)!=1) {
                errormsg <- "invalid state"
                return(errormsg)
        }
        #setting apriori values for outcome 
        outchk <- c("heart attack","heart failure","pneumonia")
        #checking index number for outcome in outchk list
        indout <- seq_along(outchk)[sapply(outchk, FUN=function(X) outcome %in% X)]
        #checking for outcome values : HA, HF, Pn
        if (sum(outcome == outchk)!=1) {
                errormsg <- "invalid outcome"
                return(errormsg)
        }
        #replacing all spaces to dots in "outcome" to assing non-spaces valuens to names()
        outchkDot <- gsub(" ", ".", outchk)
        #creating logical matrix for specific state
        statematr <- outcomeData$State == state
        #creating apriori list of names(outcome)
        outcomematr <- as.list(c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", 
                         "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure",
                         "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"))
        names(outcomematr) <- outchkDot #assigned dot-space-replaced outcomes as names
        #generating vectro of values for specific state and outcome (with NAs)
        outcomevalue <- outcomeData[statematr,][as.character(outcomematr[outchkDot[indout]])]
        outcomevalue <- outcomevalue[complete.cases(outcomevalue),] #deleting NAs
        outcomeData <- outcomeData[complete.cases(outcomevalue),] #creating non-NA source dataframe 
        outcomelogic <- outcomevalue == min(outcomevalue) 
        #finding best Hospital and getting the aphabetically first one if there is more than 1
        besthosp <- outcomeData[statematr,][outcomelogic,]$Hospital.Name
        if(length(besthosp)==1) {
                return(besthosp)
        } 
        else {
                bestLetters <- substr(besthosp[1:length(besthosp)], 1, 1)
                besthosp <- besthosp[bestLetters == min(bestLetters)]
                return(besthosp)
        }
        #outcomematr[outchkDot[indout]]
       #min(outcome[TXstate,]$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
       #TXstate <- (outcome$State =="TX")
       #outcome[TXstate,][as.character(outcomematr[outchkDot[indout]])]
}