# installing libraries
install.packages("dplyr")
# installing libraries
install.packages("dplyr")
install.packages("lubridate")
install.packages("ggplot2")
library(lubridate)
library(ggplot2)
library(dplyr)
# setting up directory
setwd("C:/Coursera/DATA_SCIENCE/Exploratory_data_analysis/exdata%2Fdata%2FNEI_data")
getwd()

#loading data 
nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

totalyear <- with(nei, aggregate(Emissions, by = list(year), sum))

plot(totalyear, type = "o", xlab = "Year", ylab = "Emissins", main = "Total Emissions in the US from 1999 to 2008" )

dev.copy(png,'Finq1.png', width=480, height=480)
dev.off()


