require(boot)
# Simple example of bootstrapping mean from 100 random numbers
x <- rnorm(100)
y <- tsboot(x, mean, R=10, l=20, sim=”fixed”)
# histogram of R number of statistic (index = t of interest from tsboot output)
plot(y, index=1)
# matrix of the data index (column) occurring in bootstrap replicate (row)
y.array <- boot.array(y)
# Write to CSV
write.csv(y.array,”/yourdirectory/yourfile1.csv”)
write.csv(x,”/yourdirectory/yourfile2.csv”)
