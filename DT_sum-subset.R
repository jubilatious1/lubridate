# Download the data and unzip it
source <- "https://raw.githubusercontent.com/jubilatious1/lubridate/6247fcefe5649a8f7f149b4c83e00bf3b77c88b4/HPC.txt.zip"

library(RCurl)
library(lubridate)

# create a temporarily file
file_zipped <- tempfile()

# download file
download.file(url=source, destfile=file_zipped, method="curl", mode="wb")

# unzip file to the current working directory
unzip(zipfile=file_zipped, exdir="./")

# clean the temporarily file
rm(file_zipped)

HPC <- read.csv("./HPC.txt", header= TRUE, col.names = c("Date", "Time"), colClasses = c("character", "character"), dec = ".", stringsAsFactors = FALSE, na.strings = "?")

#str(HPC)
#summary(HPC)
#length(!is.na(HPC$Date))
#length(!is.na(HPC$Time))

TZ <- Sys.timezone()
HPC$Date2 <- dmy(HPC$Date, tz = "UTC")
HPC$Time2 <- hms(HPC$Time)

HPC$Date_Time <- (HPC$Date2 + HPC$Time2)

head(HPC)
#str(HPC_data)
#dtime <- difftime(as.POSIXct("2007-02-03"), as.POSIXct("2007-02-01"),units="mins")
feb_1st2nd_2007 <- subset(HPC, HPC$Date_Time >= "2007-02-01 00:00:00 UTC" & HPC$Date_Time < "2007-02-03 00:00:00 UTC")

head(feb_1st2nd_2007)
#str(feb_1st_2nd_2007)
#summary(feb_1st_2nd_2007)
#setting time zone to TZ works, but setting timezones(s) to UTC fails, alone in the dmy() call or with the subset() call. Get an 8 hour discrepancy, equivalent to tester's current timezone (PST = GMT+8)).

#try to correct everything to "TZ"
#>HPC$Time2 <- hms(HPC$Time, tz = TZ)
#Error in `$<-.data.frame`(`*tmp*`, "Time2", value = c(0, 0, 0, 0, 0, 0,  :
#replacement has 2075260 rows, data has 2075259
#Calls: $<- -> $<-.data.frame
