#PLOT4
#To be used with the createPlot.R where I have created the underlying functions
par(mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
        createPlots("LINE",inpData=dateFiltData, xAxisData = "dateNtime", yAxisData = "Global_active_power","black", xlabVal = "", ylabVal = "Global Active Power", mainVal = ""  )
        createPlots("LINE",inpData=dateFiltData, xAxisData = "dateNtime", yAxisData = "Voltage","black", xlabVal = "datetime", ylabVal = "Voltage", mainVal = ""  )
       
        createMultiLinePlots("INIT",dateFiltData, xAxisData = "dateNtime", yAxisData = "Sub_metering_1","black", xlabVal = "", ylabVal = "Energy Sub Metering", mainVal = "")
        createMultiLinePlots("ADDITIONAL",inpData=dateFiltData, xAxisData = "dateNtime", yAxisData = "Sub_metering_2",colVal="red")
        createMultiLinePlots("ADDITIONAL",inpData=dateFiltData, xAxisData = "dateNtime", yAxisData = "Sub_metering_3",colVal="blue")
        colDF<-c("black", "red","blue")
        legDF<-c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        setLegend("topright",colDF,legDF,btyVal="n", cexVal=0.4)
        createPlots("LINE",inpData=dateFiltData, xAxisData = "dateNtime", yAxisData = "Global_reactive_power","black", xlabVal = "datetime", ylabVal = "Global_reactive_power", mainVal = ""  )
        fd<-data.table(fileName= "plot4.png",widVal=480,heiVal=480)
        createFile(fd)
