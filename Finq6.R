
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
# filtering data by vehicle
vehicledata <- dplyr :: filter(newdata,grepl('Vehicle',EI.Sector))
# adding baltimore filter
balvehdata <- dplyr::filter(vehicledata, grepl('24510', fips))
# adding los angeles filter
losvehdata <- dplyr::filter(vehicledata, grepl('06037', fips))

# combining rows by los angeles and baltimore
com1 <- rbind(balvehdata,losvehdata)


typebaltotalyear1 <- aggregate(com1[c("Emissions")], by = list(year= com1$year,fips = com1$fips), sum)

#ploting Baltimore city Emissions by Type


gg <- ggplot(typebaltotalyear1, mapping = aes(x = year, y = Emissions, color = fips) ) + geom_line()+ggtitle("Los Angeles and Baltimore Emission for Vehicle sources")

plot(gg)
dev.copy(png,'Finq6.png', width=480, height=480)
dev.off()
