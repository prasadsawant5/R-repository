setwd("/Users/prasadsawant/Documents/Machine Learning/R/linear regression/electric-power-plant")
library(ggplot2)
library(psych)
library(readxl)
library(caret)

df <- read_excel("data.xlsx")
str(df)
summary(df)

trainigIndex <- createDataPartition(df$PE, p = 0.7, list = FALSE)

trainingData <- df[trainigIndex, ]
testingData <- df[-trainigIndex, ]

nrow(trainingData)
nrow(testingData)

pairs.panels(trainingData)

model <- lm(PE ~ ., trainingData)
summary(model)

predicted <- predict.lm(model, testingData)
plot(testingData$PE, predicted, col = c(1, 2), pch = c(1, 3))
cor(testingData$PE, predicted)