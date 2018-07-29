#Calling Plot #2
par(mfrow=c(1,1)) #resetting this as a good practice

#Method 1
with(dateFiltData, plot(dateNtime,Global_active_power,ylab="Global Active Power(Kilowatts)", xlab="",type="l"))
#or
#Method 2
#To be used with the createPlot.R where I have created the underlying functions
createPlots("LINE",inpData=dateFiltData, xAxisData = "dateNtime", yAxisData = "Global_active_power","black", xlabVal = "", ylabVal = "Global Active Power(Kilowatts)", mainVal = ""  )
#Saving the File
fd<-data.table(fileName= "plot2.png",widVal=480,heiVal=480)
createFile(fd)