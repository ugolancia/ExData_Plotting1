setwd("/Users/ugolancia/Desktop/Data_Science_Specialization/Exploratory_data_analysis")

pow<- read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings= "?", stringsAsFactors = FALSE)
head(pow)

library(dplyr)
powlyr<- tbl_df(pow)
powlyrsub<- filter(powlyr, Date == "1/2/2007" | Date == "2/2/2007")

hist(powlyrsub$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.copy(png, file = "plot1.png")
dev.off()
