########################
### In class examples
#########################

#### for versus while loops ---------------------------

#answer each question with either a for or a while loop

## Question 1
# Calculate the first 100 Fibonacci numbers

fib <- rep(NA, 100)

fib[1] <- 0
fib[2] <- 1

for(index in 3:100){
  
  fib[index] <- fib[index-1] + fib[index-2]
}



## Question 2
# Sum the first 20 Fibonacci numbers

fib.sum20 <- 0
for(index in 1:20){
  fib.sum20 <- fib[index]  + fib.sum20
}

sum(fib[1:20])



## Question 3 
# What is the first Fibbonacci number that is greater than 100

index <- 1
current.numb <- fib[index]

while(current.numb < 100){
  index <- index + 1
  current.numb <- fib[index]
}
current.numb


## Question 4
# Which of the first 100 Fibbonacci numbers are divisible by 4?


div.by.4 <- c()

for(i in 1:100){
  current <- fib[i]
  remainder <- current %% 4
  if(remainder == 0){
    div.by.4 <- c(div.by.4, current)
  }
  
}

## Question 5
# What are the 5 smallest Fibbonacci numbers that are divisible by 7? 

div.by.7 <- c()

i <- 1

while(length(div.by.7) < 5) {
  current <- fib[i]
  remainder <- current %% 7
  if(remainder == 0){
    div.by.7 <- c(div.by.7, current)
  }
  
  i <- i+1
}



### Writing your own functions -----------------------------------

## Function 1
# Write a function that returns if a number is even or odd 

even_or_odd <- function(num){
  
  if(!is.integer(num)){
    return("Not an integer.")
  }
  
  rem <- num %% 2
  if(rem == 0){
    return("Even")
  }else{
    return("Odd")
  }
  
  
}

even_or_odd(100.25)


## Function 2
# Write a function that returns the mean and standard deviation of a vector

mean_sd <- function(vec){
  
  m <- sum(vec) / length(vec)
  s <- stats::sd(vec)
  
  ret <- list(mean = m,
              sd = s)
  
  return(ret)
  
}

vec1 <- rnorm(100, mean = 8, sd = 2)

mean_sd(vec1)







