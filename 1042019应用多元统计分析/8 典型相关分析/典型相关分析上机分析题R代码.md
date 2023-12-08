# 典型相关分析上机分析题`R`代码

1. 经济高质量发展

   + 代码：

     ```R
     corcoef.test = function(r, n, p, q){ 
     m = length(r); W = rep(0, m); lambda = 1 
     P.value = rep(0, m); k = c(m:1)
       for (i in m:1){ 
         lambda = lambda*(1-r[i]^2); 
         W[i] = -log(lambda) 
       } 
       for (i in 1:m){ 
         W[i] = (n-i+1-1/2*(p+q+3) )*W[i] 
         P.value[i] =  pchisq(W[i], (p-i+1)*(q-i+1), lower.tail=F)  
         P.value[i] = round( P.value[i],3)
      W[i] = round(W[i],3)
       }
     W.chisquare = round(W, 3)
     A = cbind(k, W.chisquare, P.value)
     A
     }
     
     corcoef.Atest = function(r, n, p, q){ 
        m = length(r); W = rep(0, m); lambda = 1 
        P.value = rep(0, m); k = c(m:1)
       for (i in m:1){ 
         lambda = lambda*(1-r[i]^2); 
         W[i] = -log(lambda)} 
       s = 0;  
       for (i in 1:m){ 
         W[i] = (n-i+1-1/2*(p+q+3)+s )*W[i] 
         P.value[i] = pchisq(W[i], (p-i+1)*(q-i+1), lower.tail=F) 
         s = s+1/r[i]^2 
         P.value[i] = round(P.value[i], 3)
         W[i] = round(W[i], 3)}
      W.adjust = round(W, 3)
      A = cbind(k,  W.adjust, P.value)
      A
      }
     
     cancor2 = function(x, y, dec=4){
       x = as.matrix(x); y = as.matrix(y)
       n = dim(x)[1]; q1 = dim(x)[2]; q2 = dim(y)[2]; q = min(q1, q2)
       S11 = cov(x); S12 = cov(x,y); S21 = t(S12); S22 = cov(y)
       E1 = eigen(solve(S11)%*%S12%*%solve(S22)%*%S21)
       E2 = eigen(solve(S22)%*%S21%*%solve(S11)%*%S12)
       rsquared = E1$values[1:q]
       lengthx = diag(diag(t(E1$vectors)%*%S11%*%E1$vectors)) 
       lengthy = diag(diag(t(E2$vectors)%*%S22%*%E2$vectors)) 
       a = round(E1$vectors%*%solve(sqrt(lengthx)),dec)
       b = round(E2$vectors%*%solve(sqrt(lengthy)),dec)  
       r = sqrt(rsquared)
     list(cor=round(r,dec), Bartlett.test = corcoef.test(r, n, q1, q2),
          Adjusted.Bartlett.test = corcoef.Atest(r, n, q1, q2),
          a.Coefficients = a, b.Coefficients = b)
        }
     ```
     ```R
     library(haven)
     data <- read_sas("exe8_1.sas7bdat")
     z <- as.data.frame(data[,2:7])
     row.names(z) <- data[,1]$region
     scale.z <- scale(z)
     # 相关系数矩阵
     cor(scale.z[,1:3])
     cor(scale.z[,4:6])
     cor(scale.z[,1:3], scale.z[,4:6])
     # 典型相关分析
     ca <- cancor(scale.z[,1:3], scale.z[,4:6])
     ca2 <- cancor2(scale.z[,1:3], scale.z[,4:6])
     # 典型载荷分析
     rho_X_U <- cor(scale.z[,1:3]) %*% ca2$a.Coefficients
     rho_Y_V <- cor(scale.z[,4:6]) %*% ca2$b.Coefficients
     rho_X_V <- cor(scale.z[,1:3], scale.z[,4:6]) %*% ca2$b.Coefficients
     rho_Y_U <- cor(scale.z[,4:6], scale.z[,1:3]) %*% ca2$a.Coefficients
     # 典型冗余分析
     apply(rho_X_U^2, 2, sum) / 3
     cumsum(apply(rho_X_U^2, 2, sum)) / 3
     apply(rho_Y_V^2, 2, sum) / 3
     cumsum(apply(rho_Y_V^2, 2, sum)) / 3
     apply(rho_X_V^2, 2, sum) / 3
     cumsum(apply(rho_X_V^2, 2, sum)) / 3
     apply(rho_Y_U^2, 2, sum) / 3
     cumsum(apply(rho_Y_U^2, 2, sum)) / 3
     ```
2. 地区

   + 代码：

     ```R
     corcoef.test = function(r, n, p, q){ 
     m = length(r); W = rep(0, m); lambda = 1 
     P.value = rep(0, m); k = c(m:1)
       for (i in m:1){ 
         lambda = lambda*(1-r[i]^2); 
         W[i] = -log(lambda) 
       } 
       for (i in 1:m){ 
         W[i] = (n-i+1-1/2*(p+q+3) )*W[i] 
         P.value[i] =  pchisq(W[i], (p-i+1)*(q-i+1), lower.tail=F)  
         P.value[i] = round( P.value[i],3)
      W[i] = round(W[i],3)
       }
     W.chisquare = round(W, 3)
     A = cbind(k, W.chisquare, P.value)
     A
     }
     
     corcoef.Atest = function(r, n, p, q){ 
        m = length(r); W = rep(0, m); lambda = 1 
        P.value = rep(0, m); k = c(m:1)
       for (i in m:1){ 
         lambda = lambda*(1-r[i]^2); 
         W[i] = -log(lambda)} 
       s = 0;  
       for (i in 1:m){ 
         W[i] = (n-i+1-1/2*(p+q+3)+s )*W[i] 
         P.value[i] = pchisq(W[i], (p-i+1)*(q-i+1), lower.tail=F) 
         s = s+1/r[i]^2 
         P.value[i] = round(P.value[i], 3)
         W[i] = round(W[i], 3)}
      W.adjust = round(W, 3)
      A = cbind(k,  W.adjust, P.value)
      A
      }
     
     cancor2 = function(x, y, dec=4){
       x = as.matrix(x); y = as.matrix(y)
       n = dim(x)[1]; q1 = dim(x)[2]; q2 = dim(y)[2]; q = min(q1, q2)
       S11 = cov(x); S12 = cov(x,y); S21 = t(S12); S22 = cov(y)
       E1 = eigen(solve(S11)%*%S12%*%solve(S22)%*%S21)
       E2 = eigen(solve(S22)%*%S21%*%solve(S11)%*%S12)
       rsquared = E1$values[1:q]
       lengthx = diag(diag(t(E1$vectors)%*%S11%*%E1$vectors)) 
       lengthy = diag(diag(t(E2$vectors)%*%S22%*%E2$vectors)) 
       a = round(E1$vectors%*%solve(sqrt(lengthx)),dec)
       b = round(E2$vectors%*%solve(sqrt(lengthy)),dec)  
       r = sqrt(rsquared)
     list(cor=round(r,dec), Bartlett.test = corcoef.test(r, n, q1, q2),
          Adjusted.Bartlett.test = corcoef.Atest(r, n, q1, q2),
          a.Coefficients = a, b.Coefficients = b)
        }
     ```
     ```R
     library(haven)
data <- read_sas("exe8_2.sas7bdat")
     z <- as.data.frame(data[,2:9])
     row.names(z) <- data[,1]$`_COL0`
     scale.z <- scale(z)
     # 相关系数矩阵
     cor(scale.z[,1:4])
     cor(scale.z[,5:8])
     cor(scale.z[,1:4], scale.z[,5:8])
     # 典型相关分析
     ca <- cancor(scale.z[,1:4], scale.z[,5:8])
     ca2 <- cancor2(scale.z[,1:4], scale.z[,5:8])
     # 典型载荷分析
     rho_X_U <- cor(scale.z[,1:4]) %*% ca2$a.Coefficients
     rho_Y_V <- cor(scale.z[,5:8]) %*% ca2$b.Coefficients
     rho_X_V <- cor(scale.z[,1:4], scale.z[,5:8]) %*% ca2$b.Coefficients
     rho_Y_U <- cor(scale.z[,5:8], scale.z[,1:4]) %*% ca2$a.Coefficients
     # 典型冗余分析
     apply(rho_X_U^2, 2, sum) / 4
     cumsum(apply(rho_X_U^2, 2, sum)) / 4
     apply(rho_Y_V^2, 2, sum) / 4
     cumsum(apply(rho_Y_V^2, 2, sum)) / 4
     apply(rho_X_V^2, 2, sum) / 4
     cumsum(apply(rho_X_V^2, 2, sum)) / 4
     apply(rho_Y_U^2, 2, sum) / 4
     cumsum(apply(rho_Y_U^2, 2, sum)) / 4
     ```
     
     