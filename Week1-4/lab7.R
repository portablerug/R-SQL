# Worksheet 7

# Calculate 32!
a <- 32
factorial(a)

# How many different ways can 5 ULA’s be assigned to 3 classes? (Assume 1 ULA per class)
# order matters. 
# Permutation vs Combination
#  nPr             
#  = n!/(n-r)!      
factorial(5)/factorial(5-3)


# How many different ways can a professor choose 10 out of 85 exam papers to review,
# assuming order does not matter! (nCx)
# = n!/ (x(n-x)!)
choose(85, 10)
factorial(85)/factorial(10(85-10))
