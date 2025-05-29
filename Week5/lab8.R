# Lab 8

# set.seed()
#  - Different samples give different results
#  - Having the same sample gives more accurate answers
sample(1:5, size = 5, replace = T) # will always give random sample

set.seed(10) # will give the same sequence of random samples
sample(1:5, size = 5, replace = T)

# Sample of 100 fair coin flips. zero and one represent Heads or Tails
set.seed(123)
fair_coin <- sample(c(0,1), 100, replace=T)




# Create a vector 5-20 and create a reproducible sample of 5 integers
vct <- c(5:20)
set.seed(vct)

# i) Allow sample ot have repeated values
repvls <- sample(vct, 5, replace=T)
repvls

# ii) Do not allow repeated values
non_repvls <- sample(vct, 5, replace = F)
non_repvls
# ------
#probability distribution
#      x    1   2    3    4     5
# P(X=x). 0.0   A  0.4  0.1  0.03

# a) Find the missing value of x
probs <- c(0.0, 0.4, 0.1, 0.03)
sum(probs)
A <- 1-sum(probs)
A

# b) P(X < 2)
probs[1]

# c) Find the mean of a random variabe X
x <- c(1,2,3,4,5)
probs <- c(0.0, A, 0.4, 0.1, 0.03)
sum(x*probs) # expected value?

# d) Construct the CDF of X
cumsum(probs)
# P(X<= 0) P(X<=1) ....P(X<=x)

# ------
# Calculate the probability of scoring a 4 when rolling a fiar 6-sided die
die_outcomes <- c(1,2,3,4,5,6)
ttl_outcomes <- length(die_outcomes)
favorable_outcomes <- length(die_outcomes[die_outcomes == 4])

clsc_prob <- favorable_outcomes/ ttl_outcomes
clsc_prob

