# Lecture 8 - Distributions
# Probability 
#  - the chance an event will occur (Theoretical)

# Proportion
#  - the relative frequency that an event occurred (Empirical)

# ------
# prop.table(x, margin =) returns a table of proportions (all add to 1)
# proportions() does the same thing!

mtrx <- matrix(c(1,3,1,7,3,5), ncol=3, nrow=2,
               byrow = TRUE)
mtrx
sum(mtrx)
proportions(mtrx)

# implementing prop.table()
prop.table(mtrx)
prop.table(mtrx, margin=NULL) # NULL gives same thing without adding margins

rowSums(mtrx)
prop.table(mtrx, margin=1) # divides each cell value by the row sum
# mtrx[1,1]/rowSums(mtrx) = 1/5 
# mtrx[2,3]/rowSums(mtrx) = 3/15

# ------
# Contingency Table
data <- data.frame(
  A = c("a1", "a1", "a1", "a2", "a2", "a2"),
  B = c("b1", "b1", "b2", "b1", "b2", "b2")
)
# create Cont. Table which usually shows frequencies!!!!!
cond_table <- table(data$A, data$B)
cond_table

# calculate the conditional prob table P(B | A)
# margin = 1 indicates rows
cond_prob_table <- prop.table(cond_table, margin=1)
cond_prob_table
# P(a1 | a2) = 2/3 = 0.6666
# P(a1 | b2) = 1/3 = 0.3333

# ALT (NOTE)
# can also use proportions(cond_table, margin = 1)

# ------
# Conditional Probability in R
# CDF using SmallTown data
outcomes <- c(0,1,2,3,4)

probs <- c(0.07,0.20,0.38,0.22, 0.13)
barplot(probs, ylim=c(0, 0.38), names.arg=outcomes,
        space = 0.5, xlab="Number of Children per Household",
        ylab = "Probability", main="BARPLOT", col="lightgreen")

# Notes: 
# - 
# - Probability Distribution gives the prob of each 
#   outcome of a random variable

# Produce the CUM SUM of the probs
smltwn_cum <- cumsum(probs)
smltwn_cum

# Plot the CUM DIST
barplot(smltwn_cum, names.arg = outcomes,
        space = 0.5, xlab="Number of Children per Household",
        ylab = "Cumulative Probability", col= "orange")
# ------
# Expected Value SUM x * p(x) 

#   - When evaluating long-term results of a stat experiment, the "long-term average"
#     is known as the expected value of the experiment.
#   - Law of Large Numbers: as the number of trials in a prob eperiment INCREASES,
#     the difference between the theoretical prob and relative frequency of an event 
#     approaches ZERO

# ------
# PMF with Missing Values
sum(c(0.07, 0.20, 0.38, NA, 0.13)) # does not give what we require
probs_2 <- c(0.07, 0.20, 0.38, NA, 0.13)

# the argument "na.rm" in sum() allows to remove or keep Missing Values
sum(probs_2, na.rm = TRUE) # returns SUM (0.78)
1 - sum(probs_2,na.rm=T)   # returns missing value (0.22)
# 0.78 + 0.22 = 1

# mean of distribution is the sum of (x values * respective. probs)
outcomes <- c(0,1,2,3,4)
probs <- c(0.07, 0.20, 0.38, 0.22, 0.13)
mean_smltwn <- sum(outcomes * probs) # like this
mean_smltwn # output: 2.14

# ------
# Simulation: sample(x, size, replace = FALSE, prob = NUll)
# prob = vector of probability weights

# RV Smalltown
smltwn_probs <- c(0.07, 0.20, 0.38, 0.22, 0.13)
sample(x = 0:4, 10, replace = TRUE, prob = smltwn_probs)

# simulate LARGE NUMBER of samples
smltwn_lrg_samp <- sample(x = 0:4, 1000000, replace = TRUE, prob = smltwn_probs)

# find the mean for several values
mean(smltwn_lrg_samp > 0) # gives the proportion of times the vector is TRUE
mean(smltwn_lrg_samp >= 0)

# create PMF (TABLE FUNCTION)
table(smltwn_lrg_samp)/100000

# ------
# Simulation
# simulate 10 fair coin flips
sample(x = c("H", "T"), # values of coin
       size = 10,       # num of trials
       replace = TRUE)

# Biased coin for Heads
sample(x = c("H", "T"),
       prob = c(0.8, 0.2), size = 10, replace = T)

# ------
# An urn contains 20 red, 30 blue and 50 green counters.
# use rep()

urn <- c(rep("red", 20), rep("blue", 30), rep("green", 50))
length(urn)

# Randomly select 10 counters from urn
sample(x = urn, size = 10)

# ------
# MORE 
# probability of getting heads when flipping a fair coin
outcomes <- c("Heads", "Tails")
ttl_outcomes <- length(outcomes) # total possible outcomes
favorable_outcomes <- length(outcomes[outcomes == "Heads"]) # favorable!

classical_prob <- favorable_outcomes / ttl_outcomes
classical_prob

# Prob if drawing a spade from a standard deck of 52 cards
deck <- rep(c("Spades", "Hearts", "Diamonds", "Clubs"), each = 13)
ttl_crds <- length(deck)
spades <- length(deck[deck == "Spades"])

prob_spade <- spades / ttl_crds
prob_spade
