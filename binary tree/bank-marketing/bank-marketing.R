setwd("/Users/prasadsawant/Documents/Machine Learning/R/binary tree/bank-marketing")
library(ggplot2)
library(psych)
library(C50)
library(caret)

marketingData <- read.table("bank-additional-full.csv", sep = ";", header = TRUE)

# marketingData$job <- NULL
# marketingData$age <- NULL
# marketingData$contact <- NULL
# marketingData$month <- NULL
# marketingData$duration <- NULL

# summary(marketingData)

# pairs.panels(marketingData)

inTrain <- createDataPartition(marketingData$y, p = 0.7, list = FALSE)

trainingData <- marketingData[inTrain, ]
testingData <- marketingData[-inTrain, ]

model <- C5.0(trainingData[-21], trainingData$y)
summary(model)

predicted <- predict(model, testingData[-21])

confusionMatrix(testingData$y, predicted)