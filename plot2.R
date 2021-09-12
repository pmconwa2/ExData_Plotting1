if(!dir.exists("./data")) dir.create("./data")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              destfile = "./data/watts.zip", method = "curl")

unzip("watts.zip", exdir = "C:/Users/petey/Documents/data")

power <- read.table("household_power_consumption.txt", na.strings = "?", 
                    header = TRUE, sep = ";", stringsAsFactors = FALSE)

power.f <- filter(power, Date == "1/2/2007" | Date == "2/2/2007")

power.f$date.time <- paste(power.f$Date, power.f$Time)
power.f$date.time <- strptime(power.f$date.time, format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png")

plot(power.f$date.time, power.f$Global_active_power, type = "l", lty = 1, 
     xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()

