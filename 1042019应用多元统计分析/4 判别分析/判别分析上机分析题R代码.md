# 判别分析上机分析题`R`代码

1. 城镇居民的生活质量

   + 代码：

     ```R
     # 距离判别法，线性判别法
     library(readxl)
     library(MASS)
     data <- read_excel("EXE4_1.xlsx", sheet = "Sheet1")
     x <- as.data.frame(data[,3:7])
     row.names(x) <- data[,2]$地区
     test.data <- read_excel("EXE4_1.xlsx", sheet = "Sheet2")
     test.x <- as.data.frame(test.data[,3:6])
     row.names(test.x) <- test.data[,2]$地区
     linear.z <- lda(类别~., x)
     p.linear.disc <- predict(linear.z, test.x)
     cbind(test.data[,2]$地区, p.linear.disc$x, p.linear.disc$class)
     # 距离判别法，非线性判别法
     quad.z <- qda(类别~., x)
     p.quad.disc <- predict(quad.z, test.x)
     cbind(test.data[,2]$地区, p.quad.disc$x, p.quad.disc$class)
     
     # Bayes判别
     library(readxl)
     library(MASS)
     data <- read_excel("EXE4_1.xlsx", sheet = "Sheet1")
     x <- as.data.frame(data[,3:7])
     row.names(x) <- data[,2]$地区
     test.data <- read_excel("EXE4_1.xlsx", sheet = "Sheet2")
     test.x <- as.data.frame(test.data[,3:6])
     row.names(test.x) <- test.data[,2]$地区
     discrim <- lda(类别~., x, priors=c(0.2, 0.8))
     p.disc <- predict(discrim, test.x)
     cbind(test.data[,2]$地区, p.disc$x, p.disc$class)
     ```
   
2. 农村经济类型

   + 代码：

     ```R
     # Fisher判别
     library(readxl)
     library(MASS)
     data <- read_excel("EXE4_2.xlsx")
     x <- as.data.frame(data[,2:7])
     discrim <- lda(类别~., x)
     p.disc <- predict(discrim)
     plot(discrim)
     ```
   