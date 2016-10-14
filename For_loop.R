Data <- read.csv(file = "NYPD_Motor_Vehicle_Collisions.csv", header = TRUE)
View(Data)
names(Data)

Var_data <- Data[c(1,5,6,8)]
View(Var_data)

Var_data[Var_data==""] <- NA

Var_clean <- na.omit(Var_data)
View(Var_clean)

colnames(Streets) <- c("Street", "Count")

Streets <- data.frame(table(Var_clean$ON.STREET.NAME))
View(Streets)


library(data.table)
setDT(Streets)[, z := sqrt(Freq/sum(Freq))]
View(Streets)


