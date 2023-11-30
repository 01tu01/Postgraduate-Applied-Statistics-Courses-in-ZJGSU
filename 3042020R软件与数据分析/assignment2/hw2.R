sink("hw2.doc", append = TRUE, split = TRUE)

# 一
## 1
### (1)
ex1_1_1 <- dbinom(2, size = 2, prob = 2/3)
ex1_1_1
### (2)
ex1_1_2 <- dbinom(2, size = 2, prob = 2/3) + dbinom(2, size = 2, prob = 1/3)
ex1_1_2
### (3)
ex1_1_3 <- 1 - dbinom(2, size = 2, prob = 1/3)
ex1_1_3
## 2
### (1)
ex1_2_1 <- (choose(4, 1) * choose(3, 1)) / (choose(6, 1) * choose(5, 1))
ex1_2_1
### (2)
ex1_2_2 <- (choose(4, 1) * choose(3, 1) + choose(2, 1) * choose(1, 1)) / (choose(6, 1) * choose(5, 1))
ex1_2_2
### (3)
ex1_2_3 <- 1 - (choose(2, 1) * choose(1, 1)) / (choose(6, 1) * choose(5, 1))
ex1_2_3
# 二
x <- c(0, 0, 0, 0, 1, 1)
## 1
ex2_1 <- outer(x, x, "+")
prob1 <- as.vector(prop.table(table(ex2_1)))
### (1)
prob1[1]
### (2)
prob1[1] + prob1[3]
### (3)
1 - prob1[3]
## 2
x1 <- c(0,0,0,1,1)
x2 <- c(0,0,0,0,1)
prob2_1 <- outer(x, x1, "+")
prob2_2 <- outer(x, x2, "+")
result1 <- as.vector(prop.table(table(prob2_1)))
result2 <- as.vector(prop.table(table(prob2_2)))
### (1)
result1[1]
### (2)
result1[1] + result2[3]
### (3)
1 - result2[3]
