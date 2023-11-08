# 因子分析上机分析题`R`代码

1. 面试

   + 代码：

     ```R
     library(readxl)
     data <- read_excel("EXE6_1.xls")
     x <- as.data.frame(data[,1:15])
     fact <- factanal(x, 5, scores="regression", rotation="varimax")
     fact
     fact$scores
     ```
   
2. 地区福利水平差异

   + 代码：

     ```R
     library(readxl)
     data <- read_excel("EXE6_2.xlsx")
     x <- as.data.frame(data[,2:9])
     row.names(x) <- data[,1]$region
     fact <- factanal(x, 3, scores="regression", rotation="varimax")
     fact
     fact$scores
     result <- data.frame(x, fact$scores)
     attach(result)
     plot(Factor1, Factor2, type='n', xlab='Factor1 Scores', ylab='Factor2 Scores')
     text(Factor1, Factor2, labels=row.names(result), cex=0.7)
     abline(h=0, lty=2)
     abline(v=0, lty=2)
     ```
   
3. 经济转型升级状况

   + 代码：

     ```R
     library(readxl)
     data <- read_excel("EXE6_3.xlsx")
     x <- as.data.frame(data[,2:9])
     row.names(x) <- data[,1]$地区
     fact <- factanal(x, 4, scores="regression", rotation="varimax")
     fact
     fact$scores
     result <- data.frame(x, fact$scores)
     attach(result)
     plot(Factor1, Factor2, type='n', xlab='Factor1 Scores', ylab='Factor2 Scores')
     text(Factor1, Factor2, labels=row.names(result), cex=0.7)
     abline(h=0, lty=2)
     abline(v=0, lty=2)
     ```

