# 主成分分析上机分析题`R`代码

1. 城市工业主体结构

   + 代码：

     ```R
     library(readxl)
     data <- read_excel("EXE5_1.xlsx")
     x <- as.data.frame(data[,2:9])
     row.names(x) <- data[,1]$industry
     std.x <- scale(x)
     prin1 <- princomp(std.x)
     summary(prin1)
     loadings(prin1)
     pre <- predict(prin1)
     pre[order(pre[, 2], decreasing = TRUE), 1:3]
     biplot(prin1)
     ```

2. 犯罪比率

   + 代码：

     ```R
     library(readxl)
     data <- read_excel("EXE5_2.xlsx")
     x <- as.data.frame(data[,2:8])
     row.names(x) <- data[,1]$state
     std.x <- scale(x)
     prin1 <- princomp(std.x)
     summary(prin1)
     loadings(prin1)
     screeplot(prin1, type="lines")
     biplot(prin1)
     ```

3. 高新技术产业竞争力

   + 代码：

     ```R
     library(readxl)
     data <- read_excel("EXE5_3.xlsx")
     x <- as.data.frame(data[,2:14])
     row.names(x) <- data[,1]$region
     std.x <- scale(x)
     prin1 <- princomp(std.x)
     summary(prin1)
     loadings(prin1)
     screeplot(prin1, type="lines")
     biplot(prin1)
     ```

4. 区域创新能力

   + 代码：

     ```R
     library(readxl)
     data <- read_excel("EXE5_4.xlsx")
     x <- as.data.frame(data[,2:11])
     row.names(x) <- data[,1]$region
     std.x <- scale(x)
     prin1 <- princomp(std.x)
     summary(prin1)
     loadings(prin1)
     screeplot(prin1, type="lines")
     biplot(prin1)
     ```

5. 旅游

   + 代码：
   
     ```R
     library(readxl)
     data <- read_excel("EXE5_5.xlsx")
     x <- as.data.frame(data[,2:5])
     row.names(x) <- data[,1]$year
     cor(x)
     lm.1 <- lm(y~x1+x2+x3, data=x)
     summary(lm.1)
     lm.prin <- princomp(~x1+x2+x3, data=x, cor=T)
     summary(lm.prin)
     pre <- predict(lm.prin)
     x$z1 <- pre[,1]
     x$z2 <- pre[,2]
     x$z3 <- pre[,3]
     lm.sol <- lm(y~z1+z2+z3, data=x)
     summary(lm.sol)
     beta <- coef(lm.sol)
     A <- loadings(lm.prin)
     x.bar <- lm.prin$center
     x.sd <- lm.prin$scale
     coef <- (beta[2]*A[,1])/x.sd
     beta0 <- beta[1] - sum(x.bar * coef)
     c(beta0, coef)
     ```
   