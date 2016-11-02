setwd("/Users/prasadsawant/Documents/Machine Learning/R/linear regression/computer-hardware")
library(ggplot2)
library(psych)

hardware_data <- read.csv("machine.data")

colnames(hardware_data)[1] <- "vendor"
colnames(hardware_data)[2] <- "model_name"
colnames(hardware_data)[3] <- "machine_cycle_time"
colnames(hardware_data)[4] <- "min_main_memory"
colnames(hardware_data)[5] <- "max_main_memory"
colnames(hardware_data)[6] <- "cache_memory"
colnames(hardware_data)[7] <- "min_channels"
colnames(hardware_data)[8] <- "max_channels"
colnames(hardware_data)[9] <- "published_performance"
colnames(hardware_data)[10] <- "estimated_performance"

hardware_data$vendor <- NULL
hardware_data$published_performance <- NULL

ggplot(hardware_data, aes(factor(max_main_memory), estimated_performance)) + geom_boxplot(aes(fill=factor(max_main_memory)))

lm_model <- lm(hardware_data$estimated_performance ~ ., hardware_data[, -1])
summary(lm_model)

predicted <- predict.lm(lm_model, hardware_data)
summary(predicted)

plot(hardware_data$estimated_performance, predicted, col = c(1, 2), pch = c(1, 3))

cor(hardware_data$estimated_performance, predicted)