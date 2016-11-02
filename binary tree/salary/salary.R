setwd('/Users/prasadsawant/Documents/Machine Learning/R/binary tree/salary')
library(psych)
library(C50)
library(caret)
library(ggplot2)

salaryData <- read.csv("adult.data")

salaryData$X77516 <- NULL
salaryData$Bachelors <- NULL
salaryData$Adm.clerical <- NULL
salaryData$State.gov <- NULL
salaryData$White <- NULL
salaryData$United.States <- NULL

colnames(salaryData)[1] <- "age"
colnames(salaryData)[3] <- "marital_status"
colnames(salaryData)[4] <- "family_status"
colnames(salaryData)[5] <- "gender"
colnames(salaryData)[9] <- "salary"

summary(salaryData)

# pairs.panels(salaryData)

inTraining <- createDataPartition(salaryData$salary, p = 0.7, list = FALSE)
trainingData <- salaryData[inTraining, ]
testingData <- salaryData[-inTraining, ]

model <- C5.0(trainingData[-9], trainingData$salary)
summary(model)

predicted <- predict(model, testingData)
confusionMatrix(predicted, testingData$salary)

