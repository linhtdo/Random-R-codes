#Final Exam

  #PART I
  #1. Basic Operations

A <- c(3,9,2,16,25)

#a 
p <- mean(A)  #Result: 11

#b
x <- A[A%%2!=0]
x
q <- 3*9*25 #Result: 675

#c
r <- sqrt(q)  #Result: 25.98076

#d Standard Deviation
sd(c(p,q,r))

#e
#See the list of packages currently loaded into R
installed.packages()

#Install and call ggplot2
install.packages('ggplot2')
library(ggplot2)

#Remove package
remove.packages('ggplot2')

#check working directory
getwd()

  #2. Vector sequencing and indexing
#a
a <- seq(1:50)
b <- seq(from =50, to=1)
c <- rep(c('boomer','sooner'),25)
d <- seq(from = 0,to = 1,length.out = 50)
e <- rep(1.97,50)

#b	Print out the values of d, which are 
#   less than 0.2 or greater than 0.8
#d[(d < 0.2)||(d > 0.8)]
d1 <- d[d<0.2]
d2 <- d[d>0.8]
d3 <- c(d1,d2)
d3
#c
e2 <- as.integer(e)

  #3. Matrix
#a
mat <- matrix(1:25,nrow = 5,ncol = 5)

#b Insert new row
mat <- rbind(mat,c(26,27,28,29,30))

#c
mean(mat[,1])

#d
mat_mul <- mat*5

#e
mat[1:2,3:4]

  #4. Lists
list_1 <- list(a = 3:5,b = "string",c = 9.9,
               d = list(-4,-8))
#a
list_1$d

#b
list_1$d[1]

#c List containing lists
list_2 <- list(a=list(c(3,5)), b=list(c(2,1)))

  #PART II
library(readr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(lubridate)
library(stringr)
library(readxl)

  #1
#a
mta <- read_excel('mta.xlsx',skip = 1)

#b
str(mta)
names(mta)
colnames(mta)

#c
head(mta,5)
tail(mta,5)

#d
str(mta)
View(mta)

  #2
#a
mta2 <- mta[-c(1,8),]

#b
mta2 <- mta2[,-1]

  #3
#a
mta3 <- gather(mta2,2:59,key='YearMonth', value='NumRiders')

#b
View(mta3)
str(mta3)
typeof(mta3$NumRiders)
#Result: [1] "character"

  #4
#a
mta3$NumRiders <- as.numeric(mta3$NumRiders)
typeof(mta3$NumRiders)

  #5
#a
mta4 <- spread(mta3,method,NumRiders)
#b
View(mta4)

  #6
#a
mta5 <- separate(mta4,YearMonth,into = c('Year','Month'))
#b
View(mta5)

  #7
#a
Day <- sample (1:30, 58, replace = TRUE)
mta6 <- cbind(mta5,Day)
View(mta6)

  #8
#a
mta7 <- unite(mta6,Year,Month,Day,col='Date',sep = '-')
View(mta7)

  #9
#a
str(mta7)
typeof(mta7$Date) #[1] "character"

#b
mta7$Date <- ymd(mta7$Date)

#c
str(mta7)
typeof(mta7$Date)
View(mta7)

  #10
mta8 <- select(mta7,-TOTAL)
mta9 <- rename(mta8,DateofRide=Date,PublicBus=Bus)

View(mta9)

  #11
summary(mta9)

ggplot(data = mta9) + 
  geom_point(mapping = aes(x = Bike, y=PublicBus))

  #12
ggplot(data = mta9) + 
  geom_point(mapping = aes(x = Taxi, y=PublicBus, size=Ferry))

ggplot(data = mta9) + 
  geom_smooth(mapping = aes(x = Bike, y=Truck))

ggplot(data = mta5) + 
  geom_point(mapping = aes(x = Bike, y=Truck))+
  facet_grid(Month~Year)







