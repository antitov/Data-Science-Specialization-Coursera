con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlcode = readLines(con)
close(con)

library(XML)
url <- "http://biostat.jhsph.edu/~jleek/contact.html"
htmlcode1 <- htmlTreeParse(url,useInternalNodes = T)
htmlcode2 <- htmlTreeParse(url)

%% this one worked
webpage <- getURL("http://biostat.jhsph.edu/~jleek/contact.html")
webpage <- readLines(tc <- textConnection(webpage)); close(tc)
nchar(webpage[10])
nchar(webpage[20])
nchar(webpage[30])
nchar(webpage[100])
