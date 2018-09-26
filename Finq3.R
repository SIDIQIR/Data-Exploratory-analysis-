
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
# filting data by city Baltimore
bal <- subset(nei, nei$fips == "24510")

typebaltotalyear <- aggregate(bal[c("Emissions")], by = list(year= bal$year,type = bal$type), sum)

#ploting Baltimore city Emissions by Type


ggplot(typebaltotalyear, mapping = aes(x = year, y = Emissions, color = type) ) + geom_line()+ggtitle("Baltimore city Emissions by Type")


dev.copy(png,'Finq3.png', width=480, height=480)
dev.off()

  
