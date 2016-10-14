library(xlsx)
library(plyr)
dat <- read.xlsx("courseTable.xlsx", sheetName="Sheet1", header=FALSE)
colnames(dat)[c(3,10,11,12,15)] <- c("Subject","Rated", "RatedClass", "RatedProf", "Work")

a <- aggregate(dat[, c(10,11,12,15)], list(dat$Subject), mean, na.rm = TRUE)
colnames(a)[1] <- "Subject"

coursesBySubject <- table(dat$Subject)
a$Courses <- coursesBySubject
a$AverageScore <- (a$Rated+a$RatedClass+a$RatedProf)/3

a$Goodness <- ((a$Courses)^(1/3))*a$AverageScore/a$Work
result <- arrange(a,desc(Goodness))
print(result[1:10,])