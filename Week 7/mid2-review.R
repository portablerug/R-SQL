# Midterm Review

# ------------------------------------------------------------------------------
#### Distributions
## Binomial
# SYNTAX: dbinom(x , size, prob)
# x = successes, size = number of trials
#  - When interested in prob that an event will occur x times out of n trials

# Ex: toss coin 10 times, find prob of getting 5 heads
dbinom(x = 5, size=10, prob=.5) # P(X = 5)

# Ex: toss coin 10 times, find prob of getting 4 of fewer heads
x <- dbinom(0:4, size=10, prob=0.5)
sum(x) # P(X=0) + P(X=1) + P(X=2) + P(X=3) + P(X=4)

pbinom(4, size=10, prob=0.5) # P(X ≤ 4)

# ------
## Poisson 
# SYNTAX: dpois(x, lambda): 
# - counts how many times a random event occurred in an interval of time
# lower.tail: If TRUE (default) probabilities are P(X < = x), if FALSE then P(X > x)

# A small store receives on average 4 customers per hour. Assume the number of customers
# per hour follows a Poisson distribution with LAMBDA = 4

# What is the prob that EXACTLY 3 customers arrive in an hour? 
dpois(3, lambda=4) ## P(X = 3)

# What is the prob that 3 OR FEWER customers arrive? 
ppois(3, lambda=4) ## P(X <= 3)

# What is the prob that MORE THAN 3 customer arrive?
ppois(3, lambda=4, lower.tail=FALSE) ## P(X > 3)
1-ppois(3, 6) #????

# What is the smallest number of customers such that the probability of seeing THAT MANY
# OR FEWER is AT LEAST 90%
qpois(0.90, lambda=4) ## output: 7 -> P(X <= 7)

# Simulate the number of customers in 10 DIFFERENT HOURS
rpois(10, lambda=4)

# ------
## Uniform
# SYNTAX: dunif(x, min= , max= , log=FALSE)
# log=F logical. if T, probs are returned as log(p)
# SYNTAX: punif(q, min= , max= , lower.tail= T, log.p=F)
# lower.tail: logical, if T (default), probs are calculated P(X <= x), if F, P(X > x)

# Let X ~ UNIF(0, 10)
# what is the density at x = 4?
dunif(4, min=0, max=10)

# What is the prob that X <= 4?
punif(4, min=0, max=10)
# X > 4 ? 
punif(4, min=0, max=10, lower.tail=FALSE)

# What value cuts off the lowest 75% of the distribution?
qunif(0.75, min=0, max=10)

# Simulate 5 random values from a Uniform(0,10)
runif(5, min=0, max=10)

# ------
# Exponential
# SYNTAX: (x, rate= )
#  - time until the first event 

# Let Y ~ Exp(LAMBDA = 2), so mean = 1/LAMBDA = 0.5
# What is the density at x=1?
dexp(1, rate=2)

# What is P(Y <= 1)
pexp(1, rate=2)
# what is P(Y > 1)
pexp(1, rate=2, lower.tail=F)

# What value of y gives the CUM PROB 0.9?
qexp(0.9, rate=2)

# ------
## Normal
# SYNTAX: (x, mean, SD)
#  - models time it takes to complete a task (predicts time until firs success)
# Suppose the height of adult women is normally distributed with a mean of 64 inches
# and SD of 3 inches

# What is the height denstiy at EXACTLY 66 inches
dnorm(66, mean=64, sd=3)

# What is the prob that a woman is SHORTER THAN 66 inches?
pnorm(66, mean=64, sd=3)
# what is the prob she is TALLER THAN 66 inches
pnorm(66, mean=64, sd=3, lower.tail=FALSE)

# What height marks the 90th percentile?
qnorm(0.90, mean=64, sd=3)

# Simulate the heights of 5 women
rnorm(5, mean=64,sd=3)

# -----------------------------------------------------------------------------
# Control Structures

### if, if else. else
x <- 4
if(x > 0){
  print("Positive number")
}else if(x == 0){
  print("Zero")
}else{
  print("Negative number")
}

# ifelse(test expression, yes, no)
x <- 1:10
ifelse(x<5 | x>8, x, 0) # OR, returns 0 for elements of 'x' that do not meet condition

ifelse(x<3 | x>9, x, "Missing") # converts all to charcters "1" "2" "Missing" ... "10"

x <- c(10:2)
ifelse(x==5 | x>8, x, "PSTAT")
## AND
x <- 1:10
ifelse(x > 3 & x < 7, x, 0)

## NOT
x <- 1:10
ifelse(!(x %% 2 == 0), x, "even")

## %in%
x <- 1:10
ifelse(x %in% c(2, 4, 6, 8, 10), "even spot", "skip")

### for 
#  - repeats code for a FIXED number of times
for(i in 1:5){
  print(i)
}
# Nested FOR loop
x <- matrix(1:6, 2,3)
for(i in seq_len(nrow(x))){
  for(j in seq_len(ncol(x))){
    print(x[i,j])
  }
}

### while
#  - repeats code while a condition is true
y <- 1
while(y <= 5){
  print(y)
  y <- y+1
}

### repeat
#  - repeats code indefinitely until a break is encountered
x <- 1
repeat{
  print(x)
  x <- x + 1
  if(x > 5){
    break
  }
}

### %in% 
#  - logical operator, Used to determine if an element belongs to an R object
x <- c("hello")
if("hello" %in% x){
  print("hello is in the vector")
}else{
  print("it is not in the vector")
}


### %% modulus
# Returns a 0 if even, returns 1 if odd(reminder of dividing)
# count even numbers
x <- c(6,5,3,9,8,11,6)
count <- 0
for(i in x){
  if(i %% 2 == 0){
    count <- count+1
  }
}
print(count) # output: 3

### Functions
# prints squares of numbers in sequence
squares <- function(a){
  for(i in 1:a){
    b <- i^2
    print(b)
  }
}
# invoke function with argument 'a'
squares(4)
squares(-2)

# ---------------------------------------------------------------------------------
### Probability Rules
# 1) P(A) is a number between 0 and 1
# 2) probs must sum to 1
# 3) for mutually exclusive events
#    - P(A or(U) B) = P(A)+P(B)
#    - P(A and B) = 0
# 4) An event can either occur or not
# 5) Overlapping events
#   - P(A or B) = P(A) + P(B) - P(A and B)
# 6) Independent events
#   - P(A and B) = P(B)P(A) ; A and B cannot be mutually exclusive and independent

# ---------------------------------------------------------------------------------
# Levels of Measurements
# Nominal => frequency tables, bar charts
#  - NOT {ordered, numeric, true zero} ; Ex: bloodtype, color
# Ordinal => medians, rank-based tests
#  - NOT{numeric, true zero} ; IS{ordered} Ex: rating
# Interval/Ratio => mean, SD, t-tests, histograms, scatterplots
#  - IS{ordered, numeric}; interval is not true zero.
#. - Interval ex: temperature. Ratio ex: weight, distance, age

# ---------------------------------------------------------------------------------
#### SQL
# ---------------------------------------------------------------------------------
### Integrity Rules
# Entity Integrity
# i) that the primary key for each relation is unique
# ii) that the primary key values are unique and not NULL for each attribute(column)
# ensures there are no duplicate tuples in a given relation

# Referential Integrity
# constraint involving two relations(tables)
# requires all foreign keys to be either NULL or correspond to a primary key value
# ensures that cross-references to non-existing tuples cannot occur

# ---------------------------------------------------------------------------------
### Keys
# Super keys
#  - set of one or more attributes that uniquely identify a tuple inna relation

# Candidate keys
#  - selected from the set of SUPER KEYS, should not have redundant attributes

# Primary Key
#  - uniquely identifies any tuple in a gien relation
#  - Can only be 1 primary key chosen from CANDIDATE KEYS 

# Foreign Key
#  - An attribute or set of attributes which match PRIMARY KEY attributes
#  - in another relation
#  - should point to the Primary Key


# ---------------------------------------------------------------------------------
### Schema
# - relation consists of the relation name and the names of its attributes
# Ex: 
#  - Product(PName, Price, Category, Manufacturer) 
# ---------------------------------------------------------------------------------
### Data Manipulation Language (DML)
#  - commands used to interact with data itself
dbGetQuery(mydb, "SELECT * from EMPLOYEE") # retrieve all data from a table

# Select all attributes from mtcars but return only first 5 tuples
dbGetQuery(mydb, 'select * from mtcars LIMIT 5')

# select 'wt' and 'mpg' for cars with mpg > 30
dbGetQuery(mydb, 'select wt, mpg from mtcars WHERE mpg > 30')

# Find the number of cylinders cars in the survey have (DO NOT RETURN DUPLICATES)
dbGetQuery(mydb, 'select DISTINCT cyl from mtcars')

# ---------------------------------------------------------------------------------

### select average
avg () # 1 vector per avg function

### lapply & sapply

#  - data.frame ()
#  - rep()
#  - length()
# ------

# Name the following in both tables. Only allowed to check out once
# Super Keys
#  - check.out : {name, date, isbn} #need to tell me what the {MISSING} column is
#             {name, isbn}
#             {}

#  - book.info : {title, isbn, genre}
#                {title, isbn} ; can you match to one UNIQUE item
#                {isbn, genre}
#                {title, genre}
#                title} ; {genre}
# if you were given a genre, can you match to ONE title and ISBN
# Needs to uniquely identify a ROW


# Candidate Keys: choose from Super Key
#  - book.info : {title} , {isbn}
#  - check.out : {name , isbn}

# Primary Key
#  - check.out :
#  - book.info : {isbn}

# Foreign Key
#  - check.out : {isbn}
#  - book.info : 


# 5) Write a schema for BOOK_INFO
#   - {title, isbn, genre}

# 6) Define a suitable domain for GENRE in BOOK_INFO (at least 6 items)
#   - ...adventure, fiction, sci-fi... 

# 7) Suppose the tuple <James, NULL, FF-33>, is added. What integrity rule is violated?
#   - ref

# ------
### Section Hints
#  - what satisfies each distribution
#  - na.omit
#  - worksheet 8, #4
#  - DBMS, the acronyms
#  - 3 parts of the relational model
#  - FOREIGN and PRIMARY
# mutually exclusive events
# SQL: Select all, selevt avg, max min. Filter Criteria (lecture 13)


# Discrete distribution
suppose you shoot a basketball 10 times with an accurancy of 0.8. Find the probability
that you make more than 8 shots (use 4 different ways) # using compliment (d and p (lower.tail=T or F))

# Continuous Distributions
suppose a standard normal distribution
a) find the density at x=1
b) find the probability that x>=2 (use 2 different ways)
c) find the 80% percentile (use 2 different ways)
d) generat a random sample of size 100


# probability
a bag consists of 2 blue, 2 green, and 3 red marbles. You draw 2 marbles without replacement
 a) find the prob that both marbles are green
 b) find the prob that at least one marble is green
 c) find the probability that no marbles are green
 d) repeat if the experiment was done with replacement

# loops
write three different loops (for, repeat, while) that will print 1,2,3,.. until the 
number is greater than 6

# function 
Look at the function and describe what its doing. What is the output? 

unknown_fun <- function(my_vec){
  x <- 0
  for(i in 1:length(my_vec)){
    if(my_vec[i] %% 2 ==0){
      x <- x+ myvec[i]
    }
    print(i)
  }
  return(paste("The final value is", x))
}
unknown_fun(c(1:7))



aa <- 50
bb <- 55
val <- ifelse(aa >= 40 & bb <= 60, 'TRUE', "FALSE")
print(val)


c(T, F, T) & c(F,T,T)
c(TRUE, FALSE) && c(TRUE , FALSE)

