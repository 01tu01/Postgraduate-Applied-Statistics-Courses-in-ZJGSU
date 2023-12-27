setwd("D:\\postgraduate\\R软件与数据分析\\hw")
sink("hw4.doc", append = TRUE, split = TRUE)

# 1
data <- read.table('mydata1.txt', header=TRUE)
## (1)
data[,1] <- gsub('Q1', '-03-01', data[,1])
data[,1] <- gsub('Q2', '-06-01', data[,1])
data[,1] <- gsub('Q3', '-09-01', data[,1])
data[,1] <- gsub('Q4', '-12-01', data[,1])
data[,1] <- as.Date(data[,1], format='%Y-%m-%d')
## (2)
data[,1]
## (3)
par(mfrow=c(2,2))
attach(data)
### pic1
plot(time, puk, type='b', pch=16, lty=1, main='line plot', ylab='')
lines(time, pus, type='b', pch=17, lty=3)
legend('topleft', title='country', c('UK', 'US'), lty=c(1,3), pch=c(16,17))
### pic2
library(reshape2)
data2 <- melt(data, id='time')
boxplot(data2[,3]~data2[,2], data, main='box plot', ylab='value', xlab='variable', col='white')
### pic3
hist(puk, freq=F, main='Histogram and Density Curve', xlab='puk', col='white')
lines(density(puk))
### pic4
h <- hist(pus, freq=T, main='Histogram with Normal Curve', xlab='pus', col='white')
x <- seq(min(pus), max(pus), length=40)
y <- dnorm(x, mean(pus), sd(pus))
y <- y * diff(h$mids[1:2]) * length(pus)
lines(x,y)
detach(data)

# 2
data <- read.table('mydata1.txt', header=TRUE)
attach(data)
## (1)
q <- quantile(puk, 0.05)
q
## (2)
d <- density(puk)
plot(d, main='density.default(x = puk)')
x_shade <- c(min(d$x), d$x[d$x <= q], q)
y_shade <- c(0, d$y[d$x <= q], 0)
polygon(x_shade, y_shade, density = 14)
detach(data)
