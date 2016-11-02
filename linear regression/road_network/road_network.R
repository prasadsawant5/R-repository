setwd("/Users/prasadsawant/Documents/Machine Learning/R/linear regression/road_network")
library(ggplot2)
library(psych)
library(caret)

data <- read.csv("data.txt")

summary(data)

trainIndex <- createDataPartition(data$X17.0527715677876, p = .7, list = FALSE)

trainingData <- data[trainIndex, ]
testingData <- data[-trainIndex, ]

linear_model <- lm(X17.0527715677876 ~ ., trainingData)
summary(linear_model)

predicted <- predict.lm(linear_model, testingData)
cor(testingData$X17.0527715677876, predicted)