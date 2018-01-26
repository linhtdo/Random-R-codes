#Linh Do

  #A. CASE STUDY: Sales in Donut shop

#1
Name <- c('Chocolate Long John','Maple Long John','Glazed'
          ,'Chocolate Frosted','Maple Frosted','Sprinkles',
          'Boston Creme','Chocolate Creme','Vanilla Creme',
          'Buttermilk Cake','Apple Spice Cake','Blueberry Cake',
          'Lemon Creme','Cinnamon Crunch')
Shape_Round <- c('FALSE','FALSE','TRUE','TRUE','TRUE','TRUE'
                 ,'TRUE','TRUE','TRUE','TRUE','TRUE','TRUE'
                 ,'TRUE','TRUE')
Day_Start_Count <- c(16,14,48,30,12,24,12,12,12,6,6,6,3,2)
Day_End_Count <- c(4,3,0,21,2,14,2,0,0,1,4,1,2,1)
Price_per_donut <- c(.97,.97,.97,.97,.97,.97,.97,.97
                     ,.97,.97,.97,.97,.97,.97)
#2
mean(Day_Start_Count) #Mean = 14.5
median(Day_Start_Count) #Median = 12
sd(Day_Start_Count) #Standard Deviation = 12.35843

mean(Day_End_Count) #Mean = 3.928571
median(Day_End_Count) #Median = 2
sd(Day_End_Count) #Standard Deviation = 6.056964

#3
#i
Price_per_donut_practice <- rep('.97',14)
Shape_Round_practice <- c(rep('FALSE',2),rep('TRUE',12))
#ii
Day_Start_Count_practice <- seq(from = 6, to = 50,
                                length.out = 14)
#I'm a bit confused on this one, since the Day_Start_Count
#column in the table consists of random numbers,
#but the seq() function does not return random numbers

#4
factor(Shape_Round)
    #Result: [1] FALSE FALSE TRUE  TRUE  TRUE  TRUE  TRUE  TRUE 
            #[9] TRUE  TRUE  TRUE  TRUE  TRUE  TRUE 
          #Levels: FALSE TRUE 

#5: Create a matrix
mymatrix <- matrix(c(Name,Shape_Round,Day_Start_Count,
         Day_End_Count,Price_per_donut), ncol = 5)

#6
colnames(mymatrix) <- c('Name','Shape_Round','Day_Start_Count',
                        'Day_End_Count','Price_per_donut')

#7
random <- sample(1:20,5)
mymatrix_prac <- rbind(mymatrix,random)

#8: Explain what is cbind:
#cbind function taking a sequence of vector, matrix, 
#or dataframe and combining by columns 

#9
myframe <- data.frame(Name,Shape_Round,Day_Start_Count,
                      Day_End_Count,Price_per_donut)

#10
head(myframe)
tail(myframe)
summary(myframe)

#11
total_Sale <- (Day_Start_Count - Day_End_Count)*Price_per_donut
#Total sale was calculated by taking the total number of 
#donuts sold times price per donut
myframe_total <- cbind(myframe,total_Sale)

#12
neworder <- order(myframe_total$total_Sale,decreasing = T)
myframe_total[neworder,]

#13
mylist <- list(Name,Shape_Round,Day_Start_Count,Day_End_Count,Price_per_donut,
               total_Sale,mymatrix,mymatrix_prac,myframe_total)

  #B. PLAYING WITH DATA FRAMES

#1
install.packages('plyr')
library(plyr)
myset <- baseball

#2
myset[myset[,'year']<1954,'sf']=0
myset[myset[,'sf']==0,'hbp']=0
exclude <- myset[myset[,'ab']<50,]

#3
obp <- (myset$h+myset$bb+myset$hbp)/(myset$ab+myset$bb+myset$hbp+myset$sf)
mynewset <- cbind(myset,obp) #Adding the new obp variable to the old data frame

#4
ord <- order(mynewset$obp,decreasing = T)
mynewset[ord,]

#5
head(mynewset)
