
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

# loading data
nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")
# merging two file by key column
newdata <- merge(nei,scc)
# filtering data by coal
coaldata <- bvdata <- dplyr :: filter(newdata,grepl('Coal',EI.Sector))

baltotalyear <- with(coaldata, aggregate(Emissions, by = list(year), sum))


# ploting 
plot(baltotalyear, type = "l", xlab = "Year", ylab = " Coal Emissions", main = "Emissions from coal combustion-related sources")

dev.copy(png,'Finq4.png', width=480, height=480)
dev.off()
