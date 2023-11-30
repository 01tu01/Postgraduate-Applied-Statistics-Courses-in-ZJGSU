sink("hw1.doc", append = TRUE, split = TRUE)

# 一
mytxt <- "
date age gender
20201101 25 1
20210601 68 2
20200801 32 1
20221001 36 1
20200201 70 2
"
group <- c("old","young")
## 1
ex1_1 <- read.table(text = mytxt, header = TRUE)
ex1_1
## 2
id <- c("a", "b", "c", "d", "e")
ex1_2 <- data.frame(ex1_1, id)
ex1_2
## 3
ex1_3 <- subset(ex1_2, age < 65, select = id)
ex1_3
## 4
ex1_4 <- ex1_2
ex1_4$group <- ifelse(ex1_2$age >= 65, "old", "young")
ex1_4
## 5
ex1_5 <- ex1_4
ex1_5$gender <- factor(ex1_4$gender, levels = c("1", "2"), labels = c("female", "male"))
ex1_5
## 6
ex1_6 <- subset(ex1_5, age < 65, select = gender)
ex1_6
## 7
ex1_7 <- ex1_5
ex1_7$date <- as.Date(as.character(ex1_5$date), format = "%Y%m%d")
ex1_7
## 8
ex1_8 <- ex1_7[order(ex1_7$date),]
ex1_8

# 二
x <- c(77, 56, 98, 69, 35, 37, 79, 33, 28, 36, 92, 50)
y <- order(x)
which(y == which(x == 36))
sort(x, decreasing = TRUE)[3]
order(x)[3]
