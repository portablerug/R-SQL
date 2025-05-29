# Lab 9

# Identifying the distribution
# Poission - frequency over a given interval
# ex. How many students walked into lib from 2-4pm?

# Binomial - Independent trials, fixed number of 'n' trials, two outcomes
#            probability doesnt change


# dbinom (x, size, prob) (P(X=x)) PDF
# when asked "what is the prob of EXACTLY 3 successes?" 

# pbinom(x, size, prob) (P(X<= x)) CDF
# when asked "what is the prob of 3 OR LESS successes?"
# lower tail = T. flips it to find GREATER than

# qbinom(x, size, prob) (opposite of pbinom)
# For what k does P(X <= x) = 0.9375
# IS EQUAL to 

# rbinom(x, size, p)

# ------
# Twenty percent of college students cook at least 4 nights a week. You randomly select 8 college students. 
# What is the probability that exactly 5 of college students cook at least 4 nights a week?
dbinom(5, size=8, prob = 0.2)

# ------
# A bakery produces 200 donuts each day. Mis-shaped donuts are thrown away. From previous data, we know that
# there is a 3% rate of mis-shaped donuts. Estimate how many donuts will we need to throw away each day this week.
# (Assume a 7-day week)
set.seed(23)
week <- rbinom(7, size=200, p=0.03)
mean(week)

# ------
# Simulate rolling a fair six-sided die 5 times, counting the number of 3's you observe.
rbinom(1, size=5, prob=1/6)

# ------
par(mfrow=c(2,1)) # 2 rows, 1 col
k <- c(1:30)
plot(k, dbinom(k, size=30, prob=.15), type="h") # "l", "p"
plot(k, dbinom(k, size=30, prob=.4), type="h")

# a) 
k <- 1:25
plot(k, dbinom(k, size=25, prob=.4), type="h")
data.frame(prob=dbinom(k, size=25, prob=.4))



# Suppose Joe makes it to class on time with prob 0.7. Over a period of 10 classes,
# what is the prob he is late to class no more than 2 times?
# a) dbinom(0, size=10, p=.7) + dbinom(1, size=10, p=.7) + dbinom(2, size=10, p=0.7)
# b) 1 - pbinom(2, size=10, p=.7)
# c) pbinom(8, size=10, p=.3, lower.tail=FALSE)
# d) pbinom(2, size=10, p=.3) (CORRECT)

# we are finding the P(late no more than 2 times)
# P(late 0 times) + P(late 1) + P(late 2)
# = dbinom(0,10,.3) +


# ------
# For a given probability q, which is a possible output to the code?
qbinom(q, size=5, p=0.7)
# a) 0.7
# b) 0.4
# c) 5 (CORRECT)
# d) 8

# output will be a number from 0 to SIZE (5). should be giving a dicrete number




