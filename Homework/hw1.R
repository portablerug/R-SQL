# Homework 1

# 1) Working with []
x <- c(5,7,3,10,1)

# extract the 3rd element
x[3]

# extract all elements of x except the second element of x
x[-2]

# extract 2nd, 3rd and 5th elements of x
x[c(2,3,5)]

# add 17 to the 4th element
x[4] <- 17
x

# Replace 1st and 3rd elements of x with the number 4
x[c(1,3)] <- 4
x

# ------
# a) Create a vector
x <- c(1, 2, 3, 7, 6, 8, 3,12, 0, 17)
length(x)

# b) Sort x in descending order
sort(x)
sort(x, decreasing = T) # Max to min

# c) Find the mean x
mean(x)

# ------
# Print PSTAT 10 HW1 Question 3. without quotes
print(noquote("PSTAT 10 HW 1 Question. 3"))
print("PSTAT 10 HW 1 Question. 3", quote=F)

# ------
# Use seq() to construct the sequence 2.25, 2.50, 2.75, 3.0
seq(2.25, 3.0, by = .25)
seq(2.25, 3.0, length=4)

# ------
# Use the rep() function to create the vector 1 1 1 2 2 2 3 3 3 4
rep(1:4, each=3, length=10)

# -------
# Use the sum function to find sum of 10 -100
sum(10:50, 75:100)

# ------
# Create 2 vectors and print x+y. Explain results
x <- c(1,2,3,4,5,6)
y <- c(10,20,30,40,50,60)
print(x+y) # GIVES ERROR

x <- 1:6
y <- seq(10,60, by=10)
x+y
# Prints 11 22 33 44 55 66

# ------
z <- c(1.0,2.0,4.6,5.5)
class(z)

# Coerce z into integer using as.integer
as.integer(z)

# Now into logic using as.logical
as.logical(z)

# as.character
as.character(z) # prints out with quotes

# ------
# use paste to join two strings
a <- c("PSTAT 120B")
h <- c("Sucks")
paste(a,h)

# checks if strings are of equal values (capitals and spaces)
a == h




