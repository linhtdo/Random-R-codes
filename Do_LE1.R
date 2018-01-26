#1. Basic operations, assignments

#a
5+7
    #output: 12
12*8
    #output: 96
sqrt(2)*log(2)
    #output: 0.9802581
#b
x <- sqrt(10)
y <- log(5)
#c
x <- 5
y <- 2
z1 <- x*y
z2 <- x/y
z3 <- x^y
    #output: z1 = 10; z2 = 2.5, z3 = 25
#d
b1 <- 12-4/2^3
b2 <- (12-4)/2^3
    #output: b1 = 11.5; b2 = 1
#e
library()
    #This code calls out the list of R packages 
    #available
install.packages("VIM")
    #to call VIM package, use library()
library(VIM)
#f
getwd()
    #to check working directory

#2. Sequencing

#a
seq(1,9)
    #output: 1 2 3 4 5 6 7 8 9
rep(c('m','w'),5)
    #output: "m" "w" "m" "w" "m" "w" "m" "w" "m" "w"
#b
seq(1,5,length.out = 10)
#c
rep(4:2, each=3)

#4. Vector

X <- c(1,4,3,2,5)
Y <- c(2:10,2)
V <- Y[2:5]

#a
Z <- X+Y
    #output: 3  7  7  7 11  8 12 12 12  7
#b
X[X>3|X==3]
    #output: 4 3 5
#c
X[-5]
    #output: 1 4 3 2
#d
V
    #ouput: 3 4 5 6

#5. Matrices
#a
X <- matrix(c(2:9,1),nrow = 3,ncol = 3)
#b
X[X<5] <- 2
#c
Y <- matrix(c(X[,2],X[,3]),ncol=2)
    #output: [,1] [,2]
      #[1,]    5    8
      #[2,]    6    9
      #[3,]    7    2
