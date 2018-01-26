#Create matrix

matrx <- function(){
  u <- readline(prompt = "Enter a number: ")
  is.integer(u)
  out <- matrix(m, nrow = u, ncol = u)
  m <- c()
  for (i in 1:u^2){
    m[i] <- sample(1:9,1, replace = T)
    i=i+1
    
  }
  
  #e <- 1
  #for (i in 1:u){
   # for (j in 1:u){
    #  out[i,j] <- m[e]
     # m <- sample(1:9,1)
      #e = e+1
    #}
  #}
  return(out)
}

print(matrx())
