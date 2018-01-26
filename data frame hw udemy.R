#1
age <- c(Sam=22,Frank=25,Amy=26)
weight <- c(Sam=150,Frank=165,Amy=120)
sex <- c(Sam='M',Frank='M',Amy='F')

frame <- data.frame(age,weight,sex)
#2
is.data.frame(mtcars)
#3
mat <- matrix(1:25,nrow = 5)
as.data.frame(mat)
#4
df <- mtcars
#5
df[1:6,]
#6
summary(df)
mean(df$mpg)
#7
df[df$cyl==6,]
#8
df[,c('am','gear','carb')]
#9
df$performance <- df$hp/df$wt
head(df)
#10
req1 <- df[df$hp>100,]
req2 <- req1[req1$wt>2.5,]
mean(req2$mpg)
#11
df['Hornet Sportabout','mpg']



