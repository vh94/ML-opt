#IRIS <- as.matrix(iris)
levels(iris$Species)<-1:3
write.csv(iris,"./IRIS.csv",row.names = FALSE)
message("Exported Data from R")
