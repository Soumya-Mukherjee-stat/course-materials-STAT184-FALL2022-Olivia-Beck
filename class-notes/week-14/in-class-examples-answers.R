########################
### In class examples
#########################

#### for versus while loops ---------------------------

#answer each question with either a for or a while loop

## Question 1
# Calculate the first 100 Fibonacci numbers

fib <- rep(NA, 100)
fib[1] <- fib[2] <- 1
for(i in 3:100){
  fib[i] <- fib[i-1] + fib[i-2]
}


## Question 2
# Sum the first 20 Fibonacci numbers
fib.sum <- 0
for(i in 1:20){
  fib.sum <- fib.sum + fib[i]
}
fib.sum

## Question 3 
# What is the first Fibbonacci number that is greater than 100
index <- 1
current.fib <- fib[1]
while(current.fib < 100){
  index <- index +1
  current.fib <- fib[index]
}
current.fib

## Question 4
# Which of the first 100 Fibbonacci numbers are divisible by 4?
fib.4 <- c()
for(i in 1:100){
  if(fib[i] %% 4 == 0){
    fib.4 <- c(fib.4, fib[i])
  }
  
}
fib.4

## Question 5
# What are the 5 smallest Fibbonacci numbers that are divisible by 7? 
fib.7 <- c()
index <- 1
while(length(fib.7) < 5){
  if(fib[index] %% 7 ==0){
    fib.7 <- c(fib.7, fib[index])
  }
  index <- index + 1
}
fib.7




### Writing your own functions -----------------------------------

## Function 1
# Write a function that returns if a number is even or odd 

even_odd <- function(n){
  if(!is.numeric(n)){
    return("Not a number!")
  }
  
  parity <- n %%2 
  if(parity == 1){
    return("odd")
  }else{
    return("even")
  }
  
}
even_odd(9)
even_odd("Hello world")

## Function 2
# Write a function that returns the mean and standard deviation of a vector

mean_sd <- function(vec){
  m <- mean(vec)
  s <- sd(vec)
  
  ret <- list(mean = m,
              sd = s)
  
  return(ret)
}

vec1 <- runif(100, min = 0, max = 4)
mean_sd(vec1)

vec2 <- rpois(100, lambda = 8)
vec.2.results <- mean_sd(vec2)
vec.2.results$mean
vec.2.results$sd^2
