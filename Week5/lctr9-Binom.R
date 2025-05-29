# Lecture 9 - Binomial and Poisson
# Binomial : gives probability that an event will occus x times out of n trials
# SYNTAX: dbinom(x , size, prob)
# x = number of successes
# size = number of trials

# Flip a fair coin 3 times. What is the prob of getting 3 tails
dbinom(x=3, size=3, prob=.5)

# ------
# PMF 
# flip fair coin 3 times. Construct the PMF for 'tails'
pmf <- dbinom(0:3, size=3, prob=.5)
pmf

# ------
# P(X <= x)
# toss fair coin 10 times, find prob of obtaining 4 or fewer heads
x <- dbinom(0:4, size=10, prob=.5)
sum(x)

# or pbinom(q , size, prob)
# q = number of successes or fewer

pbinom(4, size=10, prob=.5)

# ------
# Prob BETWEEN two numbers
# toss coin 10 times. Prob of obtaining between 5 and 8 heads inclusive
sum(dbinom(5:8, size=10, prob=0.5))
# P(5 ≤ X ≤ 8)
pbinom(8, size=10, prob=0.5) - pbinom(4, size=10, prob=0.5)

# toss coin 10 times, find prob that the number of heads is > than 7
sum(dbinom(8:10, size=10, prob=0.5))
1 - pbinom(7, size=10, prob=0.5)

# ------
# A manufacturing process creates 3.4% defective parts. A sample of 10 parts from 
# the production process is selected. What is the probability that the sample contains
# exactly 3 defective parts? 
dbinom(3, size=10, prob=0.034)

# ------
# Poisson: counts how many times a random event occured in an interval of time
# SYNTAX: dpois(x, LAM)
# x = number of occurrences of an event in a given interval 
# LAM = expected number of occurrences in a given time period

# - finds the probability that a certain number of successes occur
#   based on an average rate of success.

# It is known that a certain website makes 10 sales/hr
# in a given hour, what is the prob that the site makes exactly 8 sales?
dpois(x=8, lambda=10)

# If there are twelve cars crossing a bridge per minute on average,
# find the prob of having seventeen or more cars crossing the bridge in a particular minute

# 16 or fewer P(X ≤ 16)
ppois(16, lambda = 12, lower.tail=TRUE) # when TRUE, probs are P(X ≤ x) is default (NOT ANSWER)
ppois(16, lambda = 12, lower.tail=FALSE) # alt

# 17 or more P(X ≥ k) = 1-P(X ≤ k-1)
1-ppois(16, lambda=12, lower.tail=TRUE)














