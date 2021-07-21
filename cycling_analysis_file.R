library(tidyverse)

# Loading four Quaters datasets as below
cycle_data1 <- read.csv("C:\\Users\\srijan\\Desktop\\Data Analysis\\Course8\\Datasets\\cycling\\2019\\Divvy_Trips_2019_Q1\\Divvy_Trips_2019_Q1.csv")
cycle_data2 <- read.csv("C:\\Users\\srijan\\Desktop\\Data Analysis\\Course8\\Datasets\\cycling\\2019\\Divvy_Trips_2019_Q2\\Divvy_Trips_2019_Q2.csv")
cycle_data3 <- read.csv("C:\\Users\\srijan\\Desktop\\Data Analysis\\Course8\\Datasets\\cycling\\2019\\Divvy_Trips_2019_Q3\\Divvy_Trips_2019_Q3.csv")
cycle_data4 <- read.csv("C:\\Users\\srijan\\Desktop\\Data Analysis\\Course8\\Datasets\\cycling\\2019\\Divvy_Trips_2019_Q4\\Divvy_Trips_2019_Q4.csv")

head(cycle_data1)
head(cycle_data2)
head(cycle_data3)
head(cycle_data4)


# print(is.data.frame(cycle_data1))
# print(is.data.frame(cycle_data2))
# print(is.data.frame(cycle_data3))
# print(is.data.frame(cycle_data4))

# converting cycle_data2 columns name according to other datasets
cycle_data2 <- cycle_data2 %>% 
  rename(
          trip_id = X01...Rental.Details.Rental.ID,
          start_time = X01...Rental.Details.Local.Start.Time,
          end_time = X01...Rental.Details.Local.End.Time,
          bikeid = X01...Rental.Details.Bike.ID,
          tripduration = X01...Rental.Details.Duration.In.Seconds.Uncapped,
          from_station_id = X03...Rental.Start.Station.ID,
          from_station_name = X03...Rental.Start.Station.Name,
          to_station_id = X02...Rental.End.Station.ID,
          to_station_name = X02...Rental.End.Station.Name,
          usertype = User.Type,
          gender = Member.Gender,
          birthyear = X05...Member.Details.Member.Birthday.Year
        )

#let us check that columns name are same across all datasets
colnames(cycle_data1)
colnames(cycle_data2)
colnames(cycle_data3)
colnames(cycle_data4)



# After some cleaning we have nice data with common columns but we have some violation
# such as date is referred as character Let bind all three dataset first and then do some basic cleaning.
data_merged <- rbind(cycle_data1,cycle_data2,cycle_data3,cycle_data4)
str(data_merged)

# let us convert date from chr to POSIXct object
data_merged<-transform(data_merged, start_time = as.POSIXct(start_time), 
          end_time = as.POSIXct(end_time))

# now lets convert time duration from char to double
# data_merged<-transform(data_merged, tripduration = as.double(tripduration))
# so we have some NA here we will deal with it later



# let see our data now
str(data_merged)




# let us same it into a file

write.csv(data_merged,"2021_07_18_Formatted_Cycling.csv")



#cleaning console
cat("\014")
