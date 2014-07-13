plot4 <- function() {

myFile<-read.csv("./household_power_consumption.txt",sep=";",header=T,na.strings="?")
extract<-myFile[myFile$Date=="1/2/2007" | myFile$Date=="2/2/2007",]
newtime <-(strptime(paste(extract$Date, extract$Time), "%d/%m/20%y %H:%M:%S"))
extract<-cbind(extract,newtime)

par(mfrow = c(2, 2), mar = c(4, 4, 0, 0))

with(extract, plot(newtime ,Global_active_power, type="l",xlab="",ylab="Global active power"))

with(extract, plot(newtime ,Voltage, type="l",xlab="datetime",ylab="Voltage"),breaks=100)

with(extract, plot(newtime ,Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering"))
with(extract, lines(newtime ,Sub_metering_2,col="red", type="l",xlab="",ylab="Energy Sub Metering"))
with(extract, lines(newtime ,Sub_metering_3,col="blue", type="l",xlab="",ylab="Energy Sub Metering"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(extract, plot(newtime ,Global_reactive_power, type="l",xlab="datetime",ylab="Global_reactive_power"),breaks=10000)

dev.copy(png,file="plot4.png")
dev.off()

}