myName <- "Hao He"

#-----------------------
## Vector
# problem 1
# a)
v1 <- c(1:20)
v1

# b)
v2 <- c(20:1)
v2

# c)
v3 <- seq(from = 1, to = 19, b = 2)
v3

# d)
v4 <- rep(c(3,7,11), times = 10)
v4

# e)
v5 <- rep(c(3,7,11),length = 31)
v5

# Problem 2
tmp <- seq(3.0,6.0, by = 0.1)
x1 <- exp(tmp)*sin(tmp)
x1

# Problem 3
i <- 10:100
sum1 <- sum(i^3+4*i^2)
sum1

# Problem 4
# a)
str1 <- paste("label", 1:30)
str1

# b)
str2 <- paste("function", 1:30, sep = "")
str2

# Problem 5
vs <- paste(c(1,'function',NA, seq(1,5,2), 0.125), collapse = "," )
vs

#-----------------------
## Matrix
# Problem 6
A <- matrix(1:9,3,3)
m1_ans <- A%*%A%*%A

# Problem 7
B <- matrix(c(12,-12,12), nrow = 17, ncol = 3,byrow = TRUE)
m2_ans <- crossprod(B)
# or USE: t(B)%*%B

# Problem 8

matA <- matrix(0, nrow = 5, ncol = 5)
matA <- abs(col(matA)-row(matA))+1
yvector <- c(7,-1,-3,5,17)
m3_ans <- solve(matA, yvector)
#check 
matA%*%m3_ans 

#-----------------------
## Functions
# Problem 9
xv <- c(seq(0.0,1.0, by = 0.1))
# a)
function1 <- function(x) {
    x^(1:length(x))
}
func1_ans <- function1(xv)
func1_ans

# b)
function2 <- function(x) {
  x^(1:length(x))/(1:length(x))
}
func2_ans <- function2(xv)
func2_ans

# c)
function3 <- function(x,n) {
  if (n>0) {
    1 + sum(x^(1:n)/(1:n))
  }else 1
}
func3_ans <- function3(xv,length(xv))

# Problem 10
cel_to_far <- function(C=27.5){
  (C* 9/5) +32
}

far_to_cel <- function(F=78.6){
  (F-32)*5/9
}

# Problem 11 
odd_function <- function(x){
  j <- x%%2 == 1 
  x[j]
}
odd_ans <- odd_function(c(1:2000))
odd_ans

# Problem 12
#Create a function which takes a single argument r and calculates
#Then write a function which uses sapply to calculate the sum when 𝑟 = 10, Name: sum_ans.

func_4<- function(n) {
   sum_r <- function(r){sum(((1:r)^0.5/(11+3.5*r^1.2)))}
sum(sapply(n,sum_r))
}
sum_ans <- func_4(10)
sum_ans

# Problem 13
modNumber<-function(x,y) {
   if (x %% y == 0){
     x 
   }else { 
     modNumber(x+1, y)
     }
}
#check
modNumber(50,16) == 64
modNumber(64,16) == 64
modNumber(500,6) == 504

# Problem 14
numberOfWheels<-function(x){
  switch(x, 
         unicycle = 1, 
         motorcycle = , 
         bike = 2,
         car = , 
         truck = 4,
         tricycle = 3,
         stop("Unknown input"))
}
#check
numberOfWheels("motorcycle")

# Problem 15
myFactorial <- function(n) {

Factorial <- 1
  
if((n == 0)|(n==1))
    {Factorial <- 1
  
}else {
    for(i in 1:n) {
      Factorial = Factorial * i
    }
return(Factorial)
  }
}
#check
myFactorial(5) == factorial(5) 
# Problem 16
myCustomFactorial <- function(x,y){
  CustomFactorial <- 1
  if (x == 1 & y > x) {
   for (i in x:y) {
     CustomFactorial = CustomFactorial * i
   }
    return(CustomFactorial)
  }
}
#check
myCustomFactorial(1,6) ==factorial(6)
# Problem 17
?rivers

customRiverMean <-function(x){
  crivermean = vector()
  for ( i in 1:length(rivers))
  {if (rivers[i] < x)
    crivermean = append(crivermean, rivers[i])
  }
  return(mean(crivermean))
}
customRiverMean(400) == 300.125
#Loops and Apply
# Problem 18

longTeeth =vector()

for ( i in 1:length(ToothGrowth$len))
  {if (ToothGrowth$len[i] >= 15)
  longTeeth = append(longTeeth, ToothGrowth$len[i])
  }
print(longTeeth)

# Or a simple way:
for ( i in 1:length(ToothGrowth$len))
longTeeth<- ToothGrowth[ToothGrowth$len >= 15,]$len
# Put in a vector
# longTeeth = append(longTeeth, ToothGrowth$len[i])
# longTeeth[length(longTeeth)+1] <- ToothGrowth$len[i]

# Problem 19

colaverage<- apply(mtcars,2,mean)
averageHorsePower <- colaverage["hp"]
averageWeight <- colaverage["wt"]
#check
averageHorsePower <- mean(mtcars$hp)
averageWeight <- mean(mtcars$wt)

# Problem 20
#A function that uses sapply where given a vector (𝑥1 , ..., 𝑥𝑛 ) and a vector (𝑦1 , ..., 𝑦𝑚 ) and returns the vector (𝑧1, ..., 𝑧𝑛) where 𝑧1 = number(𝑦𝑗 < 𝑥1), 𝑧2 = number(𝑦𝑗 < 𝑥2), ... , 𝑧𝑛 = number(𝑦𝑗 < 𝑥𝑛)
sapplyFunction <- function(xvector,yvector){
  numbery <- function(y){
    y<xvector
    }
rowSums(sapply(yvector, FUN = numbery))}
#check
sapplyFunction(x=c(2,5,6,10,12),y=c(4,8,6,10))
