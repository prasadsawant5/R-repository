setwd("/Users/prasadsawant/Documents/Machine Learning/R/binary tree/credit-data")
library(ggplot2)
library(psych)
library(caret)
library(C50)

creditData <- read.csv("credit-data.data")

creditData$X30.83 <- as.numeric(creditData$X30.83)
creditData$X30.83[is.na(creditData$X30.83)] <- mean(creditData$X30.83, na.rm = TRUE)

creditData$X00202 <- as.numeric(creditData$X00202)
creditData$X00202[is.na(creditData$X00202)] <- mean(creditData$X00202, na.rm = TRUE)

creditData$b <- NULL
creditData$v <- NULL
creditData$f <- NULL

str(creditData)

pairs.panels(creditData)

inTrain <- createDataPartition(creditData$X., p = 0.7, list = FALSE)
trainingData <- creditData[inTrain, ]
testingData <- creditData[-inTrain, ]

model <- C5.0(trainingData[-13], trainingData$X.)
summary(model)

predicted <- predict(model, testingData)

confusionMatrix(predicted, testingData$X.)