download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "raw.zip", "curl")
unzip("raw.zip")
df <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df_spec <- subset(df, Date=="2007-02-01" | Date=="2007-02-02")
df_spec$Time <- strptime(paste(df_spec$Date, df_spec$Time), "%Y-%m-%d %H:%M:%S")
df_spec$Global_active_power <- as.numeric(df_spec$Global_active_power)

# plot 1
png(file="plot1.png")
hist(df_spec$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", c="red")
dev.off()