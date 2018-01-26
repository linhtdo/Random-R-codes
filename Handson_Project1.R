# Deal a card from deck

deal <- function(){
  s <- deck[sample(1:52,1,replace = T), ]
  return(s)
}

print(deal())

# Shuffle the deck

random <- sample(1:52,52)

newdeck <- deck[random, ]
print(newdeck)