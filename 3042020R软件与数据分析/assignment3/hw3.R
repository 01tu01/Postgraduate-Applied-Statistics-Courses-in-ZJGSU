# 函数不唯一，我直接拿了本科编过的一个函数来用
# 编写绘制箱型图的函数
self_boxplot <- function(x) {
  q.quantile <- quantile(x);
  # 上下分位数、中位数、上下截断点
  Q1 <- q.quantile[2];
  Q3 <- q.quantile[4];
  R1 <- Q3 - Q1;
  Qu <- Q3 + 1.5 * R1;
  Qd <- Q1 - 1.5 * R1;
  # 绘图+注释，显示每条线的数值和名称
  plot(1, q.quantile[3], xlim = c(0.6, 1.4), ylim = c(floor(Qd) - 1, ceiling(max(x)) + 1), cex = 0.01, ylab = "");
  lines(c(0.8, 1.2), c(q.quantile[3], q.quantile[3]), lwd = 2);
  text(1.3, q.quantile[3], "median");
  text(0.7, q.quantile[3], q.quantile[3]);
  lines(c(0.8, 1.2), c(q.quantile[2], q.quantile[2]));
  text(1.3, q.quantile[2], "lower-quantile");
  text(0.7, q.quantile[2], q.quantile[2]);
  lines(c(0.8, 1.2), c(q.quantile[4], q.quantile[4]));
  text(1.3, q.quantile[4], "upper-quantile");
  text(0.7, q.quantile[4], q.quantile[4]);
  lines(c(0.8, 0.8), c(q.quantile[2], q.quantile[4]));
  lines(c(1.2, 1.2), c(q.quantile[2], q.quantile[4]));
  lines(c(0.9, 1.1), c(Qu, Qu));
  text(1.2, Qu, "upper-truncation");
  text(0.7, Qu, Qu);
  lines(c(0.9, 1.1), c(Qd, Qd));
  text(1.2, Qd, "lower-truncation");
  text(0.7, Qd, Qd);
  lines(c(1.0, 1.0), c(Qu, q.quantile[2]), lty = 2);
  lines(c(1.0, 1.0), c(Qd, q.quantile[4]), lty = 2);
  title("Self-Boxplot");
  n <- length(x);
  # for循环遍历，if判断是否位于上下截断点之外，绘制极端值
  for (i in 1:n) {
    if (x[i] < Qd | x[i] > Qu) {
      points(1.0, x[i])
    }
  }
}

# 使用数据输出
data <- c(18.0,15.3,20.6,16.3,19.1,19.5,16.7,17.4,17.8,
          15.9,15.6,15.3,17.3,16.1,15.2,15.1,19.9,19.5,
          17.0,17.5,18.9,17.7,17.3,19.2,15.2,16.4,17.2,
          15.8,14.4,18.8,17.5,18.2,18.3,15.2,15.1,14.7,
          16.6,16.6,16.2,13.9,14.7,13.0,15.0,19.5,20.0,
          19.3,24.6,21.8,19.7,18.8,19.3,18.2,17.2,20.0,
          15.9,16.7,25.1,22.9,20.8,20.5,18.1,20.0,20.9,
          21.0,22.8,18.3,17.5,17.5,17.5,16.3,21.0,16.9,
          15.3,22.0,13.6,14.9,19.1,16.0,17.6,15.1,17.7,
          16.1,24.8,18.3,24.4,21.8,17.3,18.0,16.4,24.3,
          30.0,21.3,25.6,21.5,17.9,16.1)
self_boxplot(data)