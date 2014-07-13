plot1 <- function() {

myFile<-read.csv("./household_power_consumption.txt",sep=";",header=T,na.strings="?")
extract<-myFile[myFile$Date=="1/2/2007" | myFile$Date=="2/2/2007",]
G<-as.numeric(extract$Global_active_power)
hist(G, main ="Global Active Power" ,col ="red",xlab="Global Active Power(kilowatts)")

dev.copy(png,file="plot1.png")
dev.off()
}