# A.Get a feel for the data

#   1.Load the dataset "RhodeIsland_climate.xlsx" and save the result as climate
library(readxl)
climate <-read_excel("RhodeIsland_climate.xlsx")

head(climate)
View(climate)
#   2.Check that it's a data frame using the function class()
class(climate)

#   3.Print the dimensions and take a look at the column names
dim(climate)
names(climate)


# B.Summarize and look at the data

#   4.Print the structure and summary
str(climate)
summary(climate)

#   5.Print the first 15 rows, and last 10 rows
head(climate, 15)
tail(climate, 10)


# C.Tidy data

#   6.Load the readr and tidyr packages.
library(readr)
library(tidyr)
library(tidyverse)

#   7.Convert dataset into tibble and save the tibble as climate1
climate1 <- tbl_df(climate)

#   8.Gather columns V1- V31 as day, and value. Save the result as climate2
climate2 <- gather(climate, day, value, V1:V31, na.rm = TRUE)
View(climate2)
#   9.First remove column of row names
climate2 <- select(climate2,-V)
View(climate2)
climate2 <- climate2[, -1]

#   10.Spread the data
climate3 <- spread(climate2, metric, value)

#   11.View the head
View(climate3)
head(climate3)


# D.Using lubridate and stringr for date and string manipulations

#   12.Load the stringr and lubridate packages
library(stringr)
library(lubridate)

#   13.Use stringr's str_replace() to remove the V's from the day column of climate3.
climate3$day <- str_replace(climate3$day, "V", "")
View(climate3)
climate3$day <- str_replace(climate3$day, "2__1",'3')
climate3$day <- as.numeric(climate3$day)

#   14.Create a new column called date. Use the unite() function from tidyr to 
#       paste together the year, month, and day columns in order, using - as a separator (see?unite if you need help).
climate4 <- unite(climate3, date, year, month, day, sep = "-")

#   15.Convert date column to proper date format using lubridates's ymd()
climate4$date <- ymd(climate4$date)
View(climate4)



# Rearrange columns using dplyr's select()
climate5 <- select(climate4, date, Prediction, PrecipitationIn, CloudCover:WindDirDegrees)



# View the head of climate5
head(climate5)
View(climate5)

# warning message saying that R introduced an NA in the process of coercing to numeric 
as.numeric(c(4, 6.44, "some string", 222))

# View the structure of climate5
str(climate5)

# Examine the first 20 rows of climate5. Are most of the characters numeric?
head(climate5, 20)
View(climate5)

# See what happens if we try to convert PrecipitationIn to numeric
as.numeric(climate5$PrecipitationIn)

## The dplyr and stringr packages are already loaded

# Replace T with 0 (T = trace)
climate5$PrecipitationIn <- str_replace(climate5$PrecipitationIn, "T", "0")

# Convert characters to numerics
?mutate_each
climate6 <- mutate_each(climate5, funs(as.numeric), PrecipitationIn:WindDirDegrees)

# Look at result
str(climate6)
View(climate6)
# Count missing values
sum(is.na(climate6))

# Find missing values
summary(climate6)

# Find indices of NAs in Max.Gust.SpeedMPH
?which # gives indices of logical object
ind <- which(is.na(climate6$Max_Gust_SpeedMPH))
ind
# Look at the full rows for records missing Max.Gust.SpeedMPH
View(climate6[ind, ])
# Review distributions for all variables
summary(climate6)

# Find row with Max.Humidity of 1000
ind2 <- which(climate6$Max_Humidity == 1000)
ind2
# Look at the data for that day
climate6[ind2, ]

# Change 1000 to 100
climate6$Max_Humidity[ind2] <- 100


# Look at summary of Mean_VisibilityMiles
summary(climate6$Mean_VisibilityMiles)

# Get index of row with -1 value
ind3 <- which(climate6$Mean_VisibilityMiles == -1)

# Look at full row
View(climate6[ind3, ])

# Set Mean.VisibilityMiles to the appropriate value
climate6$Mean_VisibilityMiles[ind3] <- 10

# Review summary of full data once more
summary(climate6)

# Look at histogram for MeanDew_PointF
hist(climate6$MeanDew_PointF)

# Look at histogram for Min_TemperatureF
hist(climate6$Min_TemperatureF)

# Compare to histogram for Mean_TemperatureF
hist(climate6$Mean_TemperatureF)

# Clean up column names
new_colnames <- c("date","events","cloud_cover",
                  "max_dew_point_f","max_gust_speed_mph","max_humidity",
                  "max_sea_level_pressure_in","max_temperature_f",
                  "max_visibility_miles","max_wind_speed_mph",
                  "mean_humidity","mean_sea_level_pressure_in",
                  "mean_temperature_f","mean_visibility_miles",
                  "mean_wind_speed_mph","mean_dew_point_f","min_dew_point_f" ,
                  "min_humidity"  ,  "min_sea_level_pressure_in" , "min_temperature_f"  ,
                  "min_visibility_miles"   ,   "precipitation_in"   ,"wind_dir_degrees")
# Clean up column names
names(climate6) <- new_colnames
View(climate6)

# Replace empty cells in events column
climate6$events[climate6$events == ""] <- "None"

# Print the first 6 rows of climate6
head(climate6)
View(climate6)
