plot2 <- function() {

myFile<-read.csv("./household_power_consumption.txt",sep=";",header=T,na.strings="?")
extract<-myFile[myFile$Date=="1/2/2007" | myFile$Date=="2/2/2007",]
newtime <-(strptime(paste(extract$Date, extract$Time), "%d/%m/20%y %H:%M:%S"))
extract<-cbind(extract,newtime)
G<-as.numeric(extract$Global_active_power)
with(extract, plot(newtime ,Global_active_power, type="l",xlab="",ylab="Global active power(kilowatts)"))
dev.copy(png,file="plot2.png")
dev.off()
}