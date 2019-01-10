install.packages("Hmisc"); install.packages("ggm"); install.packages("ggplot2"); install.packages("polycor")
install.packages("dplyr"); install.packages("gmodels"); install.packages("MASS")
library(dplyr)
library(MASS)

# Read data
MyData <- read.csv(file="Liander.csv", header=TRUE, sep=";")
summary(MyData)

# Preprocess data

# Convert to categorical data - remove last since its missing in elektriciteit and gas
bouwjaar <- c(factor(c(MyData[,"Bouwjaar"])))[-1]
gezinssamenstelling <- c(factor(c(MyData[,"gezinssamenstelling"])))[-1]
typewoning <- c(factor(c(MyData[,"type.woning"])))[-1]
elektriciteit <- c(MyData[,"elektriciteit"])[-1]
gas <- c(MyData[,"gas"])[-1]

# Perform tests

# 1. Correlation
# elektriciteit
cor(bouwjaar, elektriciteit, use = "complete.obs")
cor(gezinssamenstelling, elektriciteit, use = "complete.obs")
cor(typewoning, elektriciteit, use = "complete.obs")

#gas
cor(bouwjaar, gas, use = "complete.obs")
cor(gezinssamenstelling, gas, use = "complete.obs")
cor(typewoning, gas, use = "complete.obs")

# Correlation is not causation - so let's perform the chi-square test

# 2. Chi-square test
# elektriciteit
chisq.test(bouwjaar, elektriciteit, simulate.p.value = TRUE)
chisq.test(gezinssamenstelling, elektriciteit, simulate.p.value = TRUE)
chisq.test(typewoning, elektriciteit, simulate.p.value = TRUE)

# gas
chisq.test(bouwjaar, gas, simulate.p.value = TRUE)
chisq.test(gezinssamenstelling, gas, simulate.p.value = TRUE)
chisq.test(typewoning, gas, simulate.p.value = TRUE)
