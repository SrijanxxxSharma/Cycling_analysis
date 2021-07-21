# POSIXct stores date and time in seconds with the number of seconds beginning at 1 January 1970. 
# Negative numbers are used to store dates prior to 1970. Thus, the POSIXct format stores each date and time a single value in units of seconds. Storing the data this way,
# optimizes use in data.frames and speeds up computation, processing and conversion to other formats.


# Data Tip: The unclass method in R allows you to view how a particular R object is stored.




# installing dependencies

install.packages("psych")
install.packages("lubridate")

library(lubridate)
library(tidyverse)
library(psych)
url="2021_07_18_Formatted_Cycling.csv"
data_raw=as.data.frame(read.csv(url))
head(data_raw)



# Using data and describing it and casting it in datetime.
describe(data_raw)

data_raw<-transform(data_raw, start_time = as.POSIXct(start_time), 
                       end_time = as.POSIXct(end_time))



# Creating few columns weekday, week number and month for datetime start and end 

data_raw$weekday_start <- weekdays.POSIXt(data_raw$start_time)
data_raw$week_num_start <- lubridate::week(data_raw$start_time)
data_raw$month_start <- months.POSIXt(data_raw$start_time)


data_raw$weekday_end <- weekdays.POSIXt(data_raw$end_time)
data_raw$week_num_end <- lubridate::week(data_raw$end_time)
data_raw$month_end <- months.POSIXt(data_raw$end_time)

head(data_raw)
str(data_raw)

# Dropping column X

to_drop=c("X")
data_raw <- data_raw[,!(names(data_raw) %in% to_drop)]


# writing data to csv

write.csv(data_raw,"2021_07_19_Engineered_unclean.csv",row.names = FALSE)

cat("\014")