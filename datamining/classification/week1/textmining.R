library(tm)
t1 <- "one sees clearly only with the heart anything essential is invisible to the eyes"
t2 <- "let my soul smile through my heart and my heart smile through my eyes that I may scatter rich smiles in sad hearts"
corpsourcet1 <- VectorSource(t1)
corpsourcet2 <- VectorSource(t2)
corpt1 <- VCorpus(corpsourcet1)
corpt2 <- VCorpus(corpsourcet2)
#corpt1 <- tm_map(corpt1, content_transformer(tolower))
#corpt2 <- tm_map(corpt2, content_transformer(tolower))
#corpt1 <- tm_map(corpt1)
#corpt2 <- tm_map(corpt2)
dtmt1 <- DocumentTermMatrix(corpt1,control=list(wordLengths=c(1,Inf)))
dtmt1mat <- as.matrix(dtmt1)
dtmt2 <- DocumentTermMatrix(corpt2,control=list(wordLengths=c(1,Inf)))
dtmt2mat <- as.matrix(dtmt2)
freqt1 <- colSums(dtmt1mat)
freqt2 <- colSums(dtmt2mat)
#freqt1 <- sort(freqt1, decreasing = TRUE)
#freqt2 <- sort(freqt2, decreasing = TRUE)
#uninames <- sort(unique(c(names(freqt1), names(freqt2))))
uninames <- unique(c(names(freqt1), names(freqt2)))
outmat <- matrix(rep(0,length(uninames)), nrow = 2, ncol = length(uninames))
for (i in 1:length(uninames)) {
        for (j in 1:length(freqt1)) {
                if (uninames[i] == names(freqt1[j])) {
                        outmat[1,i] <- freqt1[[j]]
                }
                
        }
        for (k in 1:length(freqt2)) {
                if (uninames[i] == names(freqt2[k])) {
                        outmat[2,i] <- freqt2[[k]]
                }
                
        }
        
}

norm_vec <- function(x) sqrt(sum(x^2))
cosine_similarity <- sum(outmat[1,] * outmat [2,])/(norm_vec(outmat[1,])*norm_vec(outmat[2,]))




t1 <- "language is the source of misunderstandings"
t2 <- "language is the soul of a nation"

