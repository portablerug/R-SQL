# Lecture 11 - Control Structures

# Logical Test Conditions
# x == y "x is equal to y"
# | "OR"
# ------
# if, if else
x <- 3
x == 2 # is x, 3? (FALSE)

if(x==3){
  print("This is true")
}

if(x==2){
  print("This is true") # wont do nothing
}

# %in% logical operator, Used to determine if an element belongs to an R object
x <- c("hello")
if("hello" %in% x){
  print("hello is in the vector")
}else{
  print("it is not in the vector")
}

# if else
x <- c("hello", "goodbye")
if("goodbye" %in% x){
  print("works and is in x")
}else {
  print("see you later") 
}

x <- 5
if(x>0){
  print("positive number")
}else{
  print("negative number")
}

# ------
# ifelse(test expression, yes, no)

x <- 1:10
ifelse(x<5 | x>8, x, 0) # OR, retun 0 for elements of 'x' that do not meet condition

ifelse(x<3 | x>9, x, "Missing") # converts all to charcters "1" "2" "Missing" ... "10"

x <- c(10:2)
ifelse(x==5 | x>8, x, "PSTAT")

# ------
# REPAT loop
# repeats code until stop condition is met
# == used to compare if two things are EXACTLY EQUAL

# returns TRUE or FALSE
x <- 1
repeat{
  print(x)
  x = x+1
  if(x==4){
    break
  }
}

# ------
# WHILE loop
# test expression is evaluated, loop will stop if result is TRUE

i <- 1
while (i<6){
  print(i)
  i = i+1
}

# compute squares of the numbers 1-6
i <- 1
while(i <= 6){
  print(i*i)
  i=i+1
}

# 2-4
i <- 2
while(i <= 4){
  print(i*i)
  i=i+1
}

# ------
# FOR loop
# Need to use %% operator which returns the remainder or modulus
y <- 10
y %% 3 # output: 1

# count even numbers
x <- c(6,5,3,9,8,11,6)
count <- 0
for(i in x){
  if(i %% 2 == 0)
  count <- count+1
}
print(count) # output: 3

# how many elements of x are even and how many are odd?
x <- c(6,5,3,9,8,11,6)
evn_count <- 0
odd_count <- 0

for(i in x){
  if(i %% 2 ==0){
    evn_count <- evn_count + 1
  }else{
    odd_count <- odd_count+1
  }
}

print(evn_count)
print(odd_count)

# ------
# Loop that increases 'x' by 2 and decreases 'y' by 1, for each i

x <- 1
y <- 10
i <- c(1:5)

for(j in i){
  x <- x +2
  y <- y-1
}
x
y

# ------
# Write a function to convert Farhrenheit to Centigrade
far_to_cent <- function(temp_F){
  temp_C <- ((temp_F-32) * (5/9))
  return(temp_C)
}

# invoke an argument
far_to_cent(82)
far_to_cent(60)

# ------
# Function to print squares of numbers in sequence
squares <- function(a){
  for(i in 1:a){
    b <- i^2
    print(b)
  }
}

# invoke function with argument 'a'
squares(4)
squares(-2)

# ------
# Nested FOR loop
x <- matrix(1:6, 2,3)

for(i in seq_len(nrow(x))){
  for(j in seq_len(ncol(x))){
    print(x[i,j])
  }
}

# using BREAK
for(i in 1:100){
  print(i)
  if(i>20){
    break # will stop after 20 iterations
  }
} # will still print 21

# BREAK to exit loop
# applying mean() to all elements
x <- list(a=1:5, b=rnorm(10))
lapply(x, mean)

# using R function in user-defined function
mean_median <- function(vct){
  mean <- mean(vct)
  median <- median(vct)
  return(c(mean, median))
}
print(mean_median(c(1,1,1,2,3)))




