# Worksheet 2
# 1) 
x <- c(5, 7, 3, 10, 1, 7, 19, 5, 2)
 # extract 4th element
x[4]

# 5-7 elements
x[5:7]

#median
median(x)

#length
length(x)

# 2)
rep(6, times=7)
y <- c(3,4,6)
rep(y, each=3)

# 3)
p <- c(2,3,4,6,6)
q <- c(7,2,4,3,2)
p+q
sum(p+q)
# Difference between the two is that p+q adds each element with the corresponding
# element place in the second one so p[1] + q[1] = 9, where as sum(p+q) gives you 
# the sum of both p and q together. 

# 4)
x <- c(-50:-54, -53:-50)
x

# 5) 
rep(1:3, each=2, length = 5)

