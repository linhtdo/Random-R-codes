#Find divisors of an input

divisors <- function(){
  i <- readline(prompt = "Enter a number: ")
  as.integer(i)
  n <- c(1:i)
  a <- 1
  
  for (u in n){
    if(i %% u == 0){
      v[a] <- u
      a=a+1
    }
  }
  return(v)
}
print(divisors())