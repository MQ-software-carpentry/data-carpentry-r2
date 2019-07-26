library(tidyverse)

interviews <- read_csv("data/SAFI_clean.csv", na="NULL")

View(interviews)
dim(interviews)
nrow(interviews)
ncol(interviews)

dim(interviews)[1] == nrow(interviews)

interviews
head(as.data.frame(interviews))
tail(as.data.frame(interviews))

names(interviews)
str(interviews)
summary(interviews)


interviews[1,1]
interviews[1, 6]
interviews[ , 1]
interviews[1]

1:3

interviews[1:3, 7]
interviews[3,]
interviews[1:6,]

interviews_no_id <- interviews[, -1]

interviews_no_id
interviews


# Exercise

#1
interviews_100 <- interviews[100, ]

#2
n_rows <- nrow(interviews)
interviews_last <- interviews[n_rows,]

tail(interviews, n=1)

#3
middle_idx <- ceiling(n_rows/2)
interviews[middle_idx,]

#4
interviews_head <- interviews[-(7:n_rows), ]


floor_type <- factor(c("earth", "cement", "cement", "earth"))
levels(floor_type)
nlevels(floor_type)

## Reordering
floor_type <- factor(c("earth", "cement", "cement", "earth"), 
                     levels=c("earth", "cement"))

levels(floor_type)[2] <- "brick"
levels(floor_type)
floor_type


as.character(floor_type)



year_fct <- factor(c(1990, 1983, 1977, 1998, 1990))
as.numeric(year_fct)
as.numeric(as.character(year_fct))


year_nmb <- as.numeric(levels(year_fct))[year_fct]
table(year_nmb)
table(year_fct)
summary(year_fct)


affect_conflicts <- interviews$affect_conflicts
affect_conflicts <- as.factor(affect_conflicts)
plot(affect_conflicts)

affect_conflicts <- interviews$affect_conflicts
affect_conflicts[is.na(affect_conflicts)] <- "undetermined"
affect_conflicts <- as.factor(affect_conflicts)
plot(affect_conflicts)
