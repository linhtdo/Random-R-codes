# HW1: Reverse string

reverse <- function(){
input <- readline(prompt = "Enter a phrase: ")
splt <- strsplit(input," ")
v <- unlist(splt)

revout <- rev(v)
return(revout)
}

print(reverse())
