#Lab Exercise 4

 #A. Importing data
#1
df <- read.csv('Houseprices.csv')
View(df)

  #B. ggplot2
#2
library(tidyverse)
ggplot(data = df) + 
  geom_bar(mapping = aes(x = RoofStyle, fill = RoofStyle))

#3
ggplot(data = df) +
  geom_point(mapping = aes(x = GarageArea, y = SalePrice))

  #a. Faucet wrap
ggplot(data = df) +
  geom_point(mapping = aes(x = GarageArea, y = SalePrice)) +
  facet_wrap(~ RoofStyle, ncol = 2)

#4
ggplot(data = df) +
  geom_point(mapping = aes(x = GrLivArea, y = SalePrice))
  
  #a, b & c. Change labels and title
ggplot(data = df) +
  geom_point(mapping = aes(x = GrLivArea, y = SalePrice)) +
  labs(x='(GrLivArea) Above ground living area square feet',
       y='Sales Price',
       title='Comparison between GrLivArea and SalePrice')

#5 
ggplot(data = df) +
  geom_point(mapping = aes(x = TotalBsmtSF, y = SalePrice)) 
  
  #a
ggplot(data = df) +
  geom_point(mapping = aes(x = TotalBsmtSF, y = SalePrice)) +
  geom_smooth(mapping = aes(x = TotalBsmtSF, y = SalePrice))

#or  
ggplot(data = df, mapping = aes(x = TotalBsmtSF, y = SalePrice)) +
  geom_point() +
  geom_smooth()


