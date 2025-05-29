# Lab 10

# Notes: 
#   - Learn Normal(mean=median=mode) and Standard Normal (what is mean & SD?)
#   - Exponential <- time until the next occurence (rate)
#   - When to use "p", "q" and others


# 1) X is uniform random variable as follows: X ~ Unif(1,5)
# a) Determine the PDF of X
dunif(1:5, min=1, max=5) # any number between 1-5

a <- 1
b <- 5
pdf <- 1/(b-a)
pdf

# b) Determine the probability that X takes a value between 2.0 and 3.5
punif(3.5, 1, 5) # left of 3.5

punif(3.5, min=1, max=5) - punif(2.0, min=1, max=5)

# ------
# 2) The RV X is normally distributed w/ mean 80 & SD 12

# a) What is the prob that a value of X chosen at random will be BETWEEN 65 and 95
pnorm(95, mean=80, sd=12) - pnorm(65, mean=80, sd=12)

# b) What is the prob that a value of X chosen at random will be LESS THAN 74
pnorm(74, mean=80, sd=12)

# ------
# 3) IQ of a person is normally distributed w/ mean 100 and SD 16.

# a) What percentage of the pop have an IQ in interval(84,116)
pnorm(116, mean=100, sd=16) - pnorm(84, mean=100, sd=16)

# b) Find the top 2% IQ in the population
# Top 2% ? Right hand side of distribution, the rest is 98% on LEFT 
qnorm(0.98, mean=100, sd=16)
qnorm(0.02, mean=100, sd=16, lower.tail=F) # LEARN

# ------
# 4) 

# a) 
set.seed(23) # gives the same sample of data, (NOT RANDOM)
sample(1:100, size=5, replace=F)

# b)
set.seed(24)
sample(1:100, size=5, replace=F)

# ------
# 5a) Generate 100 RV variates w/ mean 75 and SD 10, round nearest whole number
set.seed(23) # Dont need to but good habbit
round(rnorm(100, mean=75, sd=10))

# b)
# looking for interval between (55, 95)
set.seed(23)
rand <- round(rnorm(100, mean=75, sd=10))

sum(rand >= 55 & rand <= 95)
which(rand>= 55 & rand<= 95) # will only give index number

# ------
# 6 (GOOD PRACTICE)
#

# looking for frequency of certain errors (interval doesnt have to be time but measurable)
# Poiss (counting withing a interval (fixed) or the observation is fixed)
# a) no errors
dpois(0, lambda=750/500)

# b) exactly 4 errors
dpois(4, lambda=750/500)

# ------
# 7) A new customer enters a shop every two minutes, on average. After a customer arrives,
#   find the probability that a new customer arrives in less than one minute.
pexp(1, rate=1/2)





# Students talk into the lb with a probability of 0.8. An average of 100 students walk into 
# the lib each hour. Which of the following distributions correctly models the number of 
# students that walk into the lib from 3-4pm? 

# Poisson (looking for number of students and a time interval)

# ------
# pnorm(0, mean=0, sd=1) = ?
# looking for everything to the left of the interval (Standard nomral parameters)

# ------


