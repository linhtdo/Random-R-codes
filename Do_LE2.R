  #1.Lists
X <- list(a=5:7,b="Hello World",c=FALSE)

#a: Adding new item to list
X$d <- 'New Element'

#b
X <- list(10,11,12)
X[1]
      #Output:[[1]]
            # [1] 10

#c
X <- list(10,11,12)
X[[1:2]]
      #Output: Error in X[[1:2]] : subscript out of bounds

  #2.Data frames
A = c(1,2,3)
B = c('a','b','c')
C = c(TRUE,FALSE,TRUE)
df = data.frame(A,B,C)

#a
df[1,3]
      #Output: [1] TRUE

#b
df$C <- NULL
df
      #Output: A B
            #1 1 a
            #2 2 b
            #3 3 c
      #This code assigns the value NULL to all elements 
      #of column C in data frame df. Thus when printing 
      #the data frame again, column C is not displayed 
      #since all of its elements are NULL

  #3.Import Datasets
#a
library(utils)
df_comma_seperated <- read.csv('movie_metadata.csv', header = TRUE)

#b
library(readr)
read_table('movie_metadata_Tab_Seperated.txt')
read_tsv('movie_metadata_Tab_Seperated.txt', col_names = TRUE)

#c
library(data.table)
fread('movie_metadata_Tab_Seperated.txt', nrows = 10, header = T)

  #4. Export Datasets
write.csv(df_comma_seperated,file = 'df_comma_seperated')

  #5. Advanced Import functions
#a
library(readxl)
read_excel('movie_metadata_excel.xlsx',sheet = 1,range = 'D5:F10',col_names = T)

#b
read_excel('movie_metadata_excel.xlsx',sheet = 1,range = cell_rows(1:10), col_names = T)






