#Creating Plot 1
par(mfrow=c(1,1)) #resetting this as a good practice
hist(dateFiltData$Global_active_power,col="red",xlab = "Global Active Power(Kilowatts)", main = "Global Active Power")
#or
#To be used with the createPlot.R where I have created the underlying functions
createHistPlot(dateFiltData, "Global_active_power", colVal = "red", xlabVal = "Global Active Power(Kilowatts)", mainVal = "Global Active Power")
#or using generic function
createPlots("HIST", dateFiltData, yAxisData = "Global_active_power", colVal = "red", xlabVal = "Global Active Power(Kilowatts)", mainVal = "Global Active Power")
#Saving the File
fd<-data.table(fileName= "plot1.png",widVal=480,heiVal=480)
createFile(fd)