# Function for Plot 1 and Plot 2
createPlots <- function(plotType, inpData,xAxisData,yAxisData,colVal, xlabVal, ylabVal, mainVal) {
        #with (inputData,hist(inputData$inpVariable,width= widVal, height = heiVal,col=colVal,xlab = xlabVal, main = mainVal))
        #temp<-data.frame(inpData)
        if (plotType == "HIST") hist(inpData[[yAxisData]],col=colVal,xlab = xlabVal, main = mainVal)
        else if (plotType == "LINE") plot(inpData[[xAxisData]],inpData[[yAxisData]],ylab=ylabVal, xlab=xlabVal,type="l")
}

#createFile <- function(fileName, heiVal,widVal){
createFile <- function(fileDetails) {
        dev.copy(png, width= fileDetails$widVal, height = fileDetails$heiVal, file = fileDetails$fileName) ## Copy my plot to a PNG file
        dev.off() ## Close the PDF file device  
}

#Function for Plot 1 - Initial Version
createHistPlot<-function(inpData,inpVariable,colVal, xlabVal, mainVal) {
        #with (inputData,hist(inputData$inpVariable,width= widVal, height = heiVal,col=colVal,xlab = xlabVal, main = mainVal))
        #   temp<-data.frame(inpData)
        hist(inpData[[inpVariable]],col=colVal,xlab = xlabVal, main = mainVal)
}

#Function for Plot 3
createMultiLinePlots<-function(lineType, inpData,xAxisData,yAxisData,colVal, xlabVal, ylabVal, mainVal){
        if (lineType=="INIT"){
           plot(inpData[[xAxisData]],inpData[[yAxisData]],ylab=ylabVal, col=colVal, xlab=xlabVal,type="l", pch=1)     
        }
        else if (lineType == "ADDITIONAL"){
           lines(inpData[[xAxisData]],inpData[[yAxisData]], col=colVal, pch=1)   
        }
}

setLegend<-function(legLoc,colDF,legDF, btyVal="o", cexVal=0.75){
        legend(legLoc, lty=1, col=colDF, legend=legDF, cex = cexVal, bty=btyVal)
#        dev.copy(png, width= fileDetails$widVal, height = fileDetails$heiVal, file = fileDetails$fileName) ## Copy my plot to a PNG file
#        dev.off()
}
 