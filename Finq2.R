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



#filtering by city of Baltimore
bal <- subset(nei, nei$fips == "24510")

baltotalyear <- with(bal, aggregate(Emissions, by = list(year), sum))

# ploting
plot(baltotalyear, type = "o", main  = "Baltimore Emission from 1999 to 2008", xlab ="Years", ylab = "Emissions")

dev.copy(png,'Finq2.png', width=480, height=480)
dev.off()
