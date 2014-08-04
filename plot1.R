## Data Directories
RootDir  <- "./exdata-data-household_power_consumption/" 

#Load The data 
Data <- read.csv(paste0(RootDir, "household_power_consumption.txt"), header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

Data$Date <- as.Date(Data$Date, format="%d/%m/%Y")

## Subsetting the data
Subset_data <- subset(Data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

rm(Data)

## Converting dates

datetime <- paste(as.Date(Subset_data$Date), Subset_data$Time)
Subset_data$Datetime <- as.POSIXct(datetime)

png("plot1.png", width=480, height=480)

hist(Subset_data$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red")

dev.off()