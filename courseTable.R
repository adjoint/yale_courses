library(xlsx)
dat <- read.xlsx("courseTable.xlsx", sheetName="Sheet1")

a <- aggregate(dat[, 10:12], list(dat$ACCT), mean, na.rm = TRUE)
a$total1 <- aggregate(dat[, 10], list(dat$ACCT), length, na.rm = TRUE)

b <- table(dat$ACCT)
b["AMTH"]
a$total <- b
a$average_score <- (a$X3.3+a$X3.3.1+a$X3.3.2)/3
a$goodness <- sqrt(a$total)*a$average_score