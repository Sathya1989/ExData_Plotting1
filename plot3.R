plot3 <- function(){
  library(lubridate)
  elecdata <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".",na.strings = "?")
  elecdata_f <- elecdata[elecdata$Date %in% c("1/2/2007","2/2/2007"),]
  date_f <- dmy(elecdata_f$Date)
  datetime <- paste(date_f,elecdata_f$Time)
  ##time_f <- hms(elecdata_f$Time)
  datetime_f <- strptime(datetime,"%Y-%m-%d %H:%M:%S")
  s1 <- as.numeric(elecdata_f$Sub_metering_1)
  s2 <- as.numeric(elecdata_f$Sub_metering_2)
  s3 <- as.numeric(elecdata_f$Sub_metering_3)
  png('plot3.png',width=480,height=480)
  plot(datetime_f,s1,type="l",ylab="Energy sub metering",xlab="")
  lines(datetime_f,s2,col="red")
  lines(datetime_f,s3,col="blue")
  legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  dev.off()
}