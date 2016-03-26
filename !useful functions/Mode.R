Mode <- function(x) {week
      ux <- unique(x)
      ux[which.max(tabulate(match(x, ux)))]
}