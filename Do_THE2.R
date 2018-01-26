#THE-2

#A. Get the feel for the data
  #1
library(readxl)
climate <- read_excel('RhodeIsland_climate.xlsx')
View(climate)

  #2
class(climate) 
      #Result: [1] "tbl_df"     "tbl"        "data.frame"
  #3
names(climate)

#B. Summarize and look at the data
  #4
str(climate)
summary(climate)

  #5
head(climate,15)
tail(climate,10)

#C. Tidy data
  #6
library(readr)
library(tidyr)

  #7. Convert data set into tibble
library(tibble)
climate1 <- as_tibble(climate)

  #8
climate2 <- gather(climate1, 'V1','V2','V3','V4',
                   'V5','V6','V7','V8','V9',
                   'V10','V11','V12','V13',
                   'V14','V15','V16','V17',
                   'V18','V19','V20','V21',
                   'V22','V23','V24','V25',
                   'V26','V27','V28','V29',
                   'V30','V31',key = 'day',
                   value = 'value')
#There were 2 V2 columns in the original file,
#so I went on and change one to V3; it's easier for 
#the later questions

#Shorter version: using V1:V31
#climate2 <- gather(climate1, V1:V31, key = 'day',value = 'value')
View(climate2)

  #9. Removing the first column
climate2 <- climate2[,-1]
View(climate2)

  #10
climate3 <- spread(climate2,metric,value)
View(climate3)

  #11
head(climate3)

#D. Using lubridate and stringr
  #12
library(lubridate)
library(stringr)

  #13
climate3$day <- str_replace(climate3$day,'V','')

  #14
climate4 <- unite(climate3, year,month,day,col = 'date',sep = '')
climate4$date
View(climate4)

  #15
climate4$date <- ymd(climate4$date)
climate4$date
class(climate4$date)
  #Result: [1] "Date"

