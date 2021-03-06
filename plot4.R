download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "raw.zip", "curl")
unzip("raw.zip")
df <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df_spec <- subset(df, Date=="2007-02-01" | Date=="2007-02-02")
df_spec$Time <- strptime(paste(df_spec$Date, df_spec$Time), "%Y-%m-%d %H:%M:%S")
df_spec$Global_active_power <- as.numeric(df_spec$Global_active_power)

# plot 4
df_spec$Voltage <- as.numeric(df_spec$Voltage)
df_spec$Global_reactive_power <- as.numeric(df_spec$Global_reactive_power)

png(file="plot4.png")
par(mfrow=c(2,2))
plot(df_spec$Time, df_spec$Global_active_power, "l", main="", xlab="", ylab="Global Active Power")
plot(df_spec$Time, df_spec$Voltage, "l", main="", xlab="datetime", ylab="Voltage")
plot(df_spec$Time, df_spec$Sub_metering_1, "l", main="", xlab="", ylab="")
lines(df_spec$Time, df_spec$Sub_metering_2, col="red", main="", xlab="", ylab="")
lines(df_spec$Time, df_spec$Sub_metering_3, col="blue", main="", xlab="", ylab="")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, cex=1, box.lty=0)
title(main="", xlab="", ylab="Energy sub metering")
plot(df_spec$Time, df_spec$Global_reactive_power, "l", main="", xlab="datetime", ylab="Global_reactive_power")
dev.off()