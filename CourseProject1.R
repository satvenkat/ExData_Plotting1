#Computation of memory required
#memory required = no. of column * no. of rows * 8 bytes/numeric
2075259*9*8/(1024*1024*100) #1.42GB RAM required.

#LOADING DATA AND CLEANING UP DATA AS NEEDED

#library(lubridate)
#library(data.table)
#library(dplyr)
libs<-c("lubridate", "data.table", "dplyr")
lapply(libs, require, character.only = TRUE)

#Read the File
data<-fread("household_power_consumption.txt", blank.lines.skip=TRUE, header=TRUE, colClasses = c("character", "character","numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
data<-subset(data,Global_reactive_power!="?") #Cleanup and remove when i find ?

#Convert to proper classes for the various columns
data$Global_reactive_power<-as.numeric(data$Global_reactive_power)
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Global_intensity<-as.numeric(data$Global_intensity)
data$Voltage<-as.numeric(data$Voltage)
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)

#Combine the date and time columns into single column
## read in date/time info in format 'm/d/y h:m:s'
dates <- data$Date
times <- data$Time
data$dateNtime <- paste(dates, times)
rm(dates, times) # removing unnecessary environmental variables
#data$dateNtime <- strptime(data$dateNtime, "%d/%m/%Y %H:%M:%S")
data$dateNtime <- dmy_hms(data$dateNtime)
data$Date<-dmy(data$Date)

#Filter out the data with NA in 4th column
filtData<-data[rowSums(is.na(data[ , 4])) == 0, ] #filters out the NA
#issue data$Time<-hms(data$Time)
#Filter the data based on the date
dateFiltData<-subset(filtData,Date == "2007-02-01"  | Date == "2007-02-02")
#Adding Day to data
dateFiltData$Day<-lubridate::wday(dateFiltData$dateNtime, label=TRUE)
dateFiltData$Day <- factor(dateFiltData$Day) #removing unnecessary levels

