#Calling Plot #3
par(mfrow=c(1,1)) #resetting this as a good practice
#Method 1
with(dateFiltData, plot(dateNtime,Sub_metering_1, col="black",type="l", ylab = "Energy Sub Metering"))
with(dateFiltData, lines(dateNtime,Sub_metering_2, col="red"))
with(dateFiltData, lines(dateNtime,Sub_metering_3, col="blue"))
legend("topright", pch = 1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#or
#Method 2
#To be used with the createPlot.R where I have created the underlying functions
createMultiLinePlots("INIT",dateFiltData, xAxisData = "dateNtime", yAxisData = "Sub_metering_1","black", xlabVal = "", ylabVal = "Energy Sub Metering", mainVal = "")
createMultiLinePlots("ADDITIONAL",inpData=dateFiltData, xAxisData = "dateNtime", yAxisData = "Sub_metering_2",colVal="red")
createMultiLinePlots("ADDITIONAL",inpData=dateFiltData, xAxisData = "dateNtime", yAxisData = "Sub_metering_3",colVal="blue")
colDF<-c("black", "red","blue")
legDF<-c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
setLegend("topright",colDF,legDF)
#Saving File
fd<-data.table(fileName= "plot3.png",widVal=480,heiVal=480)
createFile(fd)