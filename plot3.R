setwd("/Users/ugolancia/Desktop/Data_Science_Specialization/Exploratory_data_analysis")

pow<- read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings= "?", stringsAsFactors = FALSE)
head(pow)

library(dplyr)
powlyr<- tbl_df(pow)
powlyrsub<- filter(powlyr, Date == "1/2/2007" | Date == "2/2/2007")

library(lubridate)
x<- powlyrsub$Date
y<- powlyrsub$Time
xtime<- dmy(x)
ytime<- hms(y)
date_time<- xtime+ytime
powlyrsub<- cbind(date_time, powlyrsub)

par(bg = "gray96")
with(powlyrsub, plot(date_time, Sub_metering_1, type = "l", xlab= "", ylab = "Energy sub metering"))
with(powlyrsub, lines(date_time, Sub_metering_2, col = "red"))
with(powlyrsub, lines(date_time, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"), x.intersp = 1, cex = 0.5)

dev.copy(png, file = "plot3.png")
dev.off()
