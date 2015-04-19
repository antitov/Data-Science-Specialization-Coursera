above10 <-function (y) {
  use <- y > 10
  y[use]
}

above <-function (y,n = 10) {
  use <- y > n
  y[use]
}


columnmean <- function (y, removeNA = TRUE) {
  nc <- ncol(y)
  means <- numeric(nc)
  for (i in 1:nc) {
    means[i] <- mean(y[i], na.rm = removeNA)
  }
  means
}