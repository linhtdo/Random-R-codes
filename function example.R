#Write a program to: Ask user to enter n. 
#Create a matrix n by n. 
#Fill the matrix with numbers from 1 to 9 randomly. 
#Print the matrix. 
#Print the sum of all numbers in row a 
#where a is entered by user

matrx <- function(){
  n <- readline(prompt = 'Enter a random number ')
  print(n)
  a <- as.numeric(n)
  i <- sample(1:9, (a*a), replace = T)
  out <- matrix(i,nrow = a)
  return(out)
}

print(matrx())
