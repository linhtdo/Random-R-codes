#Lab Exercise 3

  #1 Exporting data frame
df <- read.csv('student_scores.csv')

  #2 Cleaning data
#a
#using paste
#df1 <- df
#df1$name <- paste(df$first_name,df$last_name,sep = " ")

#using unite
library(tidyr)
df1 <- unite(df,name,first_name,last_name,sep = ' ')

#b
df2<- separate(df1,name,into = c('first_name','last_name'))

#c
df3 <- gather(df1,'scores_c1','scores_c2','scores_c3','scores_c4',
       key = 'course', value = 'score')

#d
df4 <- spread(df3,course,score)
