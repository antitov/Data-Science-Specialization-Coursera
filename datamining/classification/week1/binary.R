#Dara for q5
plants <- list(x1 = c(0,1,1,0,0,0,1,1,1,1), x2 = c(0,1,0,0,1,0,1,0,0,1))
head(plants)
#funtions for contig table, distances for sym and asym bin values + jacc similarity
contigtable <- function (data, x1, x2) {
      contab <- matrix(c(0,0,0,0), ncol = 2, nrow = 2)
      contab[1,1] <- sum(data[[x1]] == 1 & data[[x2]] == 1)
      contab[1,2] <- sum(data[[x1]] == 1 & !data[[x2]] == 1)
      contab[2,1] <- sum(!data[[x1]] == 1 & data[[x2]] == 1)
      contab[2,2] <- sum(!data[[x1]] == 1 & !data[[x2]] == 1)
      contab
}
jaccarsim <- function(cont) cont[1,1]/(sum(cont)-cont[2,2])
dissym <- function(cont) (cont[1,2] +cont[1,2])/sum(cont)
disasym <- function(cont) (cont[1,2] +cont[1,2])/(sum(cont)-cont[2,2])


#here goes data for question 6
namcarc <- c("Case", "buying", "maint", "doors", "persons", "lug_boot", "safety")
car1 <- c("Car 1", "med", "v-high", "3", "more", "small", "med")
car2 <- c("Car 2", "high", "v-high", "4", "4", "big", "med")

buying <- c("v-high", "high", "med", "low")
maint <- c("v-high", "high", "med", "low")
doors <- c("2", "3", "4", "5-more")
persons <- c("2", "4", "more")
lug_boot <- c("small", "med", "big")
safety <- c("low", "med", "high")



dfcars <- data.frame(rbind(as.list(car1), as.list(car2)))
names(df) <- namcarc
dfcar1 <- df[df$Case == "Car 1", ]
dfcar2 <- df[df$Case == "Car 2", ]
carbinmatrix1 <-  c(dfcar1$buying == buying, dfcar1$maint == maint, dfcar1$doors == doors, dfcar1$persons == persons,
                    dfcar1$lug_boot == lug_boot, dfcar1$safety == safety) 

carbinmatrix2 <-  c(dfcar2$buying == buying, dfcar2$maint == maint, dfcar2$doors == doors, dfcar2$persons == persons,
                    dfcar2$lug_boot == lug_boot, dfcar2$safety == safety) 
carbinmatrix <- list(carbinmatrix1,carbinmatrix2)
fractions(dissym(contigtable(carbinmatrix,1,2)))



#library(MASS)
# fractions(jaccarsim(conto))