rankall <- function(outcome, num = "best") {
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
        outcomeData <- outcomeData[!is.na(outcomevalueALL),] #creating non-NA source dataframe 
        outcomesubset <- outcomeData[as.character(outcomematr[outchkDot[indout]])]
                #sorting all states plus non-states from outcome (more than 50)
        statelist <- sort(unique(outcomeData$State))
        
        if(num=="best") {
                rankedall <- vapply(as.list(statelist),best, outcome, FUN.VALUE = character(1))
                out <- data.frame(hospital = rankedall,state = statelist)
                return(out)
                
        }
        if(num=="worst") { #worst is the opposite to best function (using max instead of min value)
                rankedall <- vapply(as.list(statelist),worst, outcome, FUN.VALUE = character(1))
                out <- data.frame(hospital = rankedall,state = statelist)
                return(out)
        }
                #sorting outcomedata by outcome value then by hosp name
        outranked <- outcomeData[with(outcomeData, order(outcomesubset, Hospital.Name )), ]
        rankbystate <- function (state, numb) {
                numb = num
                outranked[outranked$State==state,][numb,]["Hospital.Name"][1,]
        }
        rankedall <- vapply(as.list(statelist),rankbystate, FUN.VALUE = character(1))
        out <- data.frame(hospital = rankedall,state = statelist)

        
        return(out)
        
        
        
}