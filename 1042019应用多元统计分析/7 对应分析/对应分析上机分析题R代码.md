# 对应分析上机分析题`R`代码

1. 中国科技论文

   + 代码：

     ```R
     library(ca)
     library(readxl)
     data <- read_excel("EXE7_1.xlsx")
     x <- as.data.frame(data[,2:4])
     row.names(x) <- data[,1]$SUBGECT
     out <- ca(x)
     summary(out)
     plot(out)
     ```
   
2. 地区生产总值

   + 代码：

     ```R
     library(ca)
     library(readxl)
     data <- read_excel("EXE7_2.xlsx")
     x <- as.data.frame(data[,2:4])
     row.names(x) <- data[,1]$region
     out <- ca(x)
     summary(out)
     plot(out)
     ```
   
3. 老年人

   + 代码：

     ```R
     library(ca)
     library(readxl)
     data <- read_excel("EXE7_3.xlsx")
     x <- as.data.frame(data[,2:4])
     row.names(x) <- data[,1]$健康情况
     out <- ca(x)
     summary(out)
     plot(out)
     ```

4. 心理健康状况

   + 代码：

     ```R
     library(ca)
     library(readxl)
     data <- read_excel("EXE7_4.xlsx")
     f.x <- ftable(as.data.frame(data))
     x <- as.data.frame.matrix(f.x)
     x <- as.data.frame(x)
     row.names(x) <- c("0", "1", "2", "3")
     colnames(x) <- c("A", "B", "C", "D", "E")
     out <- ca(x)
     summary(out)
     plot(out)
     ```

     