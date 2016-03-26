set.seed(45)
tt <- data.table(matrix(sample(c(NA, rnorm(10)), 1e7*3, TRUE), ncol=3))
tracemem(tt)
# modifies value by reference - no copy
system.time({
for (i in seq_along(tt)) 
    set(tt, i=which(is.na(tt[[i]])), j=i, value=0)
})
#   user  system elapsed 
#  0.284   0.083   0.386 

# by copy - NOT the idiomatic way
set.seed(45)
tt <- data.table(matrix(sample(c(NA, rnorm(10)), 1e7*3, TRUE), ncol=3))
tracemem(tt)
# makes copy
system.time({tt[is.na(tt)] <- 0})
# a bunch of "tracemem" output showing the copies being made
#   user  system elapsed 
#  4.110   0.976   5.187 