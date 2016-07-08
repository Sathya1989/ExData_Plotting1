plot2 <- function(){
  library(lubridate)
  elecdata <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".",na.strings = "?")
  elecdata_f <- elecdata[elecdata$Date %in% c("1/2/2007","2/2/2007"),]
  date_f <- dmy(elecdata_f$Date)
  datetime <- paste(date_f,elecdata_f$Time)
  ##time_f <- hms(elecdata_f$Time)
  datetime_f <- strptime(datetime,"%Y-%m-%d %H:%M:%S")
  globalap <- as.numeric(elecdata_f$Global_active_power)
  png('plot2.png',width=480,height=480)
  plot(datetime_f,globalap,type="l",xlab="",ylab="Global Active Power(kilowatts)")
  dev.off()
} 