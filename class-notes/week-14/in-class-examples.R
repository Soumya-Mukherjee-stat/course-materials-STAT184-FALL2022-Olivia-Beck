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





## Question 5
# What are the 5 smallest Fibbonacci numbers that are divisible by 7? 






### Writing your own functions -----------------------------------

## Function 1
# Write a function that returns if a number is even or odd 




## Function 2
# Write a function that returns the mean and standard deviation of a vector
