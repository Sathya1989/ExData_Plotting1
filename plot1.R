plot1 <- function(){
elecdata <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".",na.strings = "?")
elecdata_f <- elecdata[elecdata$Date %in% c("1/2/2007","2/2/2007"),]
png('plot1.png',width=480,height=480)
hist(elecdata_f$Global_active_power,xlab="Global Active Power(kilowatts)",col="red",main ="Global Active Power")
##dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()
}