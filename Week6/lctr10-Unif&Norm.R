# Lecture 10 - Uniform and Normal Distribution

# ------
# Unifrom Distribution
# dunif(x, min= , max=)
# x = vector , min & max = the upper and lower bounds of distribution

# Returns a density
bus_ex <- dunif(x = 0:10, min=0, max=10)
bus_ex

hist(bus_ex, freq = FALSE, xlab= "x")

# punif() gives the CDF
# punif(q, min=0, max=10, lower.tail=TRUE)
# Probability of waiting 5 minutes OR LESS
punif(q=5, min=0, max=10, lower.tail=TRUE)

# now between 5 and 7 minutes?
# P(X ≤ 7)               P(X ≤ 5)
punif(7, min=0, max=10) - punif(5, min=0, max=10) # P(5 < X ≤ 7)

# Prob that the waiting time is MORE THAN 6 minutes?
punif(q=6, min=0, max=10, lower.tail=FALSE)

# ------
# Normal Distribution
# Plot of Standard Normal 
x <- seq(-4,4, length=200)
y <- 1/sqrt(2*pi)*exp(-x^2/2)
z <- plot(x,y, type="l", lwd = 2, col = "lightgreen") # lwd = line width ; type "l" = lines

# Using dnorm ^^^
x <- seq(-4,4, length=200)
y <- dnorm(x, mean=0, sd=1)
z <- plot(x,y, type="l", lwd=2, col="green")

# The Standard deviation - a measure of spread
y2 <- dnorm(x, mean=0, sd=2) 
lines(x,y2, type="l", lwd=2, col="orange") # used to add lines to existing plot
# bigger SD gives a bigger spread

# testing different SD
x <- seq(-8, 8, length=500)
y3 <- dnorm(x, mean=0, sd=0.5)
plot(x,y3,type="l", lwd=2, col="black")

y2 <- dnorm(x, mean=0, sd=2)
lines(x,y2, type="l", lwd=2, col="blue")

y1 <- dnorm(x, mean=0, sd=2)
lines(x, y2, type="l", lwd=2, col="red")

legend("topright", c("sigma = 1/2", "sigma=2", "sigma=1"),
        lty=c(1,1,1), col=c("darkseagreen3", "dodgerblue3", "firebrick2"))





