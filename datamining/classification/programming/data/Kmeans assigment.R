library(data.table)
library(ggplot2)
library(kernlab)

clusterdata <- read.table('self_test.data')
cdata <- clusterdata[2:nrow(clusterdata),]

#basic graphics plot
plot(cdata[,1], cdata[,2])

#using gglot2 
png(filename = "rawdata.png", width = 640, height = 640)
g <- ggplot(cdata, aes(V1,V2))
p <- g + geom_point() +   
  labs(title = "Dataset for clustering") +
  labs(y = "y", x = "x")
print(p) 
dev.off()
#making Kmeans clustering using built in functions
datakmeansObj <- kmeans(cdata, centers = 4)
#plotting clusters
png(filename = "kmdata.png", width = 640, height = 640)
g <- ggplot(cdata, aes(V1,V2, color = factor(datakmeansObj$cluster)))
p <- g + geom_point() + scale_color_discrete(name="clusters")+
  labs(title = "Clustered by K-Means") +
  labs(y = "y", x = "x") 
print(p) 
dev.off()

