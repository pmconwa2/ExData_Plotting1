if(!dir.exists("./data")) dir.create("./data")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              destfile = "./data/watts.zip", method = "curl")

unzip("watts.zip", exdir = "C:/Users/petey/Documents/data")

power <- read.table("household_power_consumption.txt", na.strings = "?", 
                    header = TRUE, sep = ";", stringsAsFactors = FALSE)

power.f <- filter(power, Date == "1/2/2007" | Date == "2/2/2007")

power.f$date.time <- paste(power.f$Date, power.f$Time)
power.f$date.time <- strptime(power.f$date.time, format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png")
par(mfrow = c(2, 2))

with(power.f, {plot(date.time, Global_active_power, type = "l", lty = 1, 
                    xlab = "", ylab = "Global Active Power")
        plot(date.time, Voltage, type = "l", 
             xlab = "datetime", ylab = "Voltage")
        plot(date.time, Sub_metering_1, type = "l", col = "black", 
             xlab = "", ylab = "Energy sub metering")
                lines(date.time, Sub_metering_2, type = "l", col = "red")
                lines(date.time, Sub_metering_3, type = "l", col = "blue")
                legend("topright", lty = 1, col = c("black", "red", "blue"), 
                     legend = c("Sub_metering_1", "Sub_metering_2", 
                                "Sub_metering_3"), bty = "n", cex = 0.75)
        plot(date.time, Global_reactive_power, type = "l", 
             xlab = "datetime", ylab = "")})

dev.off()