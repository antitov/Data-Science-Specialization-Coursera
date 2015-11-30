rankhospital <- function(state, outcome, num = "best") {
        #checking for statre validity
        if (sum(state == state.abb)!=1) {
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
        if(num=="best") {
                out <- best(state, outcome)
                return(out)
        }
        if(num=="worst") {
                out <-worst(state, outcome)
                return(out)
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
        #sorting outData by outcome and hospital name
        outcomestate <- outcomeData[statematr,]
        outcomesubset <- outcomestate[as.character(outcomematr[outchkDot[indout]])]
        outranked <- outcomestate[with(outcomestate, order(outcomesubset, Hospital.Name)), ]
        outranked$Hospital.Name[num]




}