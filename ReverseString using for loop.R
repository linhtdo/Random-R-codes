#Reverse a string without using rev(v)

reverse <- function(){
  i <- readline(prompt = "Enter a string: ")
  splt <- strsplit(i, " ")
  v <- unlist(splt)
  
  n <- length(v)
  out <- c()
  
  for(u in 1:n){
    out[u] <- v[n]
    u = u+1
    n = n-1
  }
  
  return(out)
}
 print(reverse())
