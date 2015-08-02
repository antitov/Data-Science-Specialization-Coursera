setwd("c:/Users/a.titov/rprog/datamining/pattern discovery/week1/")
#loadaing Mining Association Rules and Frequent Itemsets package
#Apriori and Eclat
library("arules", "arulesViz")
#random transaction generation code
set.seed(998)
Itemlist<-c("Beer","Coffee","Nuts","Diapers","Milk","Bread",
            "Wine","Cheese","HotDogs","Steak","Ketchup","Mustard")
N <- 40
numOfTrans <- sample(2:7, N, replace = TRUE)
TransList <- list()
for (i in 1:N) {
  TransList[i] <- list(sample(Itemlist, numOfTrans[i], replace = FALSE))
  
}
#lets convert our list to transactions with arules
Transactions <- as(TransList, "transactions")
freqPatternsEC <- eclat(Transactions,  list(supp = 0.2, maxlen = 10))
freqPatternsAP <- apriori(Transactions, parameter=list(supp=0.2, conf=0.5))