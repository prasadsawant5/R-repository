setwd("/Users/prasadsawant/Documents/Machine Learning/R/linear regression/forest-fires")
library(ggplot2)
library(psych)
library(caret)

forestFiresData <- read.csv("forestfires.csv", header = TRUE)

months <- integer()
days <- integer()
for (i in 1:length(forestFiresData$month)) {
  x <- switch(
    forestFiresData[i, 3],
    "jan" = 1,
    "feb" = 2,
    "mar" = 3,
    "apr" = 4,
    "may" = 5,
    "jun" = 6,
    "jul" = 7,
    "aug" = 8,
    "sep" = 9,
    "oct" = 10,
    "nov" = 11,
    "dec" = 12
  )
  
  y <- switch(
    forestFiresData[i, 4],
    "sun" = 1,
    "mon" = 2,
    "tue" = 3,
    "wed" = 4,
    "thu" = 5,
    "fri" = 6,
    "sat" = 7
  )
  
  months[i] <- x
  days[i] <- y
}

forestFiresData$month <- months
# forestFiresData$month <- cut(forestFiresData$month, c(1, 3, 6, 9, 12))
# forestFiresData$temp <- cut(forestFiresData$temp, c(1, 5, 10, 15, 20, 25, 30))

forestFiresData$day <- days

boxplot(area ~ temp, data = forestFiresData, col = c(1, 2, 3, 4, 5, 6, 7))

inTrain <- createDataPartition(forestFiresData$area, p = 0.7, list = FALSE)
trainingData <- forestFiresData[inTrain, ]
testingData <- forestFiresData[-inTrain, ]

summary(trainingData$month)

lmModel <- lm(trainingData$area ~ ., trainingData[, -13])
summary(lmModel)

predicted <- predict.lm(lmModel, testingData)
cor(testingData$area, predicted)