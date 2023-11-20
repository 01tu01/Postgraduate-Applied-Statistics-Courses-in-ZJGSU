# 聚类分析上机分析题`R`代码

1. 高质量发展状况

   + 代码：

     ```R
     # 系统聚类法
     library(readxl)
     data <- read_excel("EXE3_1.xls")
     x <- as.data.frame(data[,2:21])
     row.names(x) <- data[,1]$region
     stdx <- scale(x, center=TRUE, scale=TRUE)
     d0 <- dist(stdx, method="euclidean", diag=TRUE, upper=FALSE)
     hcs <- hclust(d0, method="complete")
     plot(hcs, hang=-1)
     rect.hclust(hcs, k=4, h=NULL, border=2)
     
     # 快速聚类法
     library(readxl)
     data <- read_excel("EXE3_1.xls")
     x <- as.data.frame(data[,2:21])
     row.names(x) <- data[,1]$region
     stdx <- scale(x, center=TRUE, scale=TRUE)
     kmeans(stdx, 4, iter.max=10, algorithm="MacQueen")
     ```
   
2. 低碳社会发展状况

   + 代码：

     ```R
     # 系统聚类法
     library(readxl)
     data <- read_excel("EXE3_2.xlsx")
     x <- as.data.frame(data[,2:10])
     row.names(x) <- data[,1]$country
     stdx <- scale(x, center=TRUE, scale=TRUE)
     d0 <- dist(stdx, method="euclidean", diag=TRUE, upper=FALSE)
     hcs <- hclust(d0, method="ward.D")
     plot(hcs, hang=-1)
     rect.hclust(hcs, k=7, h=NULL, border=2)
     
     # 快速聚类法
     library(readxl)
     data <- read_excel("EXE3_2.xlsx")
     x <- as.data.frame(data[,2:10])
     row.names(x) <- data[,1]$country
     stdx <- scale(x, center=TRUE, scale=TRUE)
     kmeans(stdx, 7, iter.max=10, algorithm="MacQueen")
     ```
   