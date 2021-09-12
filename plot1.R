if(!dir.exists("./data")) dir.create("./data")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              destfile = "./data/watts.zip", method = "curl")

unzip("watts.zip", exdir = "C:/Users/petey/Documents/data")

power <- read.table("household_power_consumption.txt", na.strings = "?", 
                    header = TRUE, sep = ";", stringsAsFactors = FALSE)

power.f <- filter(power, Date == "1/2/2007" | Date == "2/2/2007")

png(filename = "plot1.png")

hist(power.f$Global_active_power, breaks = 11, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
     col = "red", xlim = c(0,6))

dev.off()

