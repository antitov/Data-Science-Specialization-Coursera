best <- function(state, outcome) {
        #checking for statre validity
        statelist <- sort(unique(outcomeData$State))
        if (sum(state == statelist)!=1) {
                errormsg <- "invalid state"
                stop(errormsg)
        }
        #setting apriori values for outcome 
        outchk <- c("heart attack","heart failure","pneumonia")
        #checking index number for outcome in outchk list
        indout <- seq_along(outchk)[sapply(outchk, FUN=function(X) outcome %in% X)]
        #checking for outcome values : HA, HF, Pn
        if (sum(outcome == outchk)!=1) {
                errormsg <- "invalid outcome"
                stop(errormsg)
        }
        #replacing all spaces to dots in "outcome" to assing non-spaces valuens to names()
        outchkDot <- gsub(" ", ".", outchk)
        #creating apriori list of names(outcome)
        outcomematr <- as.list(c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", 
                         "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure",
                         "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"))
        names(outcomematr) <- outchkDot #assigned dot-space-replaced outcomes as names
        #generating vectro of values for specific state and outcome (with NAs)
        outcomevalueALL <- outcomeData[as.character(outcomematr[outchkDot[indout]])]
        outcomeData <- outcomeData[complete.cases(outcomevalueALL),] #creating non-NA source dataframe 
        #creating logical matrix for specific state
        statematr <- outcomeData$State == state
        outcomevalue <- outcomeData[statematr,][as.character(outcomematr[outchkDot[indout]])]
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