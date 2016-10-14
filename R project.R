
Crash <- read.csv(file = "NYPD_Motor_Vehicle_Collisions.csv", header = TRUE)
View(Crash)
names(Crash)

Filter_crash <- data.frame(Crash$ï..DATE,Crash$TIME,Crash$ZIP.CODE,Crash$LATITUDE,Crash$LONGITUDE,Crash$ON.STREET.NAME,Crash$UNIQUE.KEY)
View(Filter_crash)

Final_crash <- Filter_crash[!(is.na(Filter_crash$Crash.ZIP.CODE) | (Filter_crash$Crash.ON.STREET.NAME=="")),]
View(Final_crash)

Final_crash$Crash.ï..DATE <- as.Date( Final_crash$Crash.ï..DATE, format = "%d/%m/%Y")

crash_Date_2016 <- subset(Final_crash, Crash.ï..DATE > "2015/01/01")

names(crash_Date_2016)

colnames(crash_Date_2016)[1] <- "Date"
colnames(crash_Date_2016)[2] <- "Time"
colnames(crash_Date_2016)[3] <- "Zip Code"
colnames(crash_Date_2016)[4] <- "Latitude"
colnames(crash_Date_2016)[5] <- "Longitude"
colnames(crash_Date_2016)[6] <- "Street Name"
colnames(crash_Date_2016)[7] <- "Unique Key"

View(crash_Date_2016) 

Crash_Date_1_Avenue <- subset(crash_Date_2016, crash_Date_2016$`Street Name`== "1 AVENUE")

View(Crash_Date_1_Avenue)

library(ggmap)
map <- get_map(location = "New York", zoom = "auto" , source = "google", scale="auto")
ggmap(map)


mapPoints <- ggmap(map) +  geom_point(data = Crash_Date_1_Avenue, aes(x = as.numeric(LONGITUDE), y = as.numeric(LATITUDE), colour = "red", fill = ON.STREET.NAME), alpha =0.8, size = 1, shape = 21)
mapPoints


