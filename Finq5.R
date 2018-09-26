
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
# merging two files by key column
newdata <- merge(nei,scc)
#filtering data by vehicle and city baltimore
vehicledata <- dplyr :: filter(newdata,grepl('Vehicle',EI.Sector))
balvehdata <- dplyr::filter(vehicledata, grepl('24510', fips))

balvehem <- with(balvehdata, aggregate(Emissions, by = list(year), sum))
# ploting 
plot(balvehem, type = "l", xlab = "Year", ylab = "Emission", main = "Motor Vehicle Emissions from 1999 to 2008 ")

dev.copy(png,'Finq5.png', width=480, height=480)
dev.off()


