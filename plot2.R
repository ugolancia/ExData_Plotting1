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

par(bg = "gray95")
plot(powlyrsub$date_time, powlyrsub$Global_active_power, type = "l", xlab= "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png")
dev.off()
