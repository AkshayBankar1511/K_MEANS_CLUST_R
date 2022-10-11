install.packages("cluster")
library(cluster)

install.packages("factoextra")
library(factoextra)

abalone <- read.csv("ABALONE_DATASET.csv", header= TRUE)

names(abalone)
head(abalone)
tail(abalone)
summary(abalone)
str(abalone)

nrow(abalone)
ncol(abalone)
dim(abalone)

abalone.labels= abalone$Rings
table(abalone.labels)
abalone_data <- abalone[2:4]

#scale the data.
abalone_data_scale <- scale(abalone_data)

#Distance
abalone_data <- dist(abalone_data_scale)

#Calculating the clusters
fviz_nbclust(abalone_data_scale, kmeans, method = "wss") + labs(subtitle = "Elbow method")

#K_means
km.out <- kmeans(abalone_data_scale, centers = 3, nstart = 100)
print(km.out)

#Visualizing the clustering
km.clusters <- km.out$cluster
rownames(abalone_data_scale) <- paste(abalone$Type, 1:dim(abalone)[1], sep = "_")
fviz_cluster(list(data=abalone_data_scale, cluster = km.clusters))
table(km.clusters, abalone$Type)



