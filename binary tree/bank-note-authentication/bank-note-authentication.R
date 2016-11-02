setwd("/Users/prasadsawant/Documents/Machine Learning/R/binary tree/bank-note-authentication")
library(ggplot2)
library(psych)
library(C50)
library(caret)

noteData <- read.csv("bank-note-authentication.txt")

colnames(noteData)[1] <- "variance"
colnames(noteData)[2] <- "skewness"
colnames(noteData)[3] <- "curtosis"
colnames(noteData)[4] <- "entropy"
colnames(noteData)[5] <- "class"

# noteData$entropy <- NULL
noteData$class <- as.factor(noteData$class)

inTrain <- createDataPartition(noteData$class, p = 0.7, list = FALSE)

trainingData <- noteData[inTrain, ]
testingData <- noteData[-inTrain, ]

model <- C5.0(trainingData[-5], trainingData$class)
summary(model)

predicted <- predict(model, testingData)

confusionMatrix(predicted, testingData$class)