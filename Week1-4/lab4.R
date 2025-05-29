
x <- matrix(1:6, nrow=2, ncol=3)
x

rownames(x) <- c("R1", "R2")
x

rnames <- c("R1", "R2")
cnames <- c("c1", "c2")

y <- matrix(1:4, 2,2, dimnames=list(rnames, cnames))
y

y[2,2]
y["R2", "c2"]
y[2,2] <- 40
y

# ------
a <- 1:3
b <- 7:9

cbind(a,b)
rbind(a,b)

# constructing arrays
z <- array(1:18, dim=c(3,3,2))
z

z[1,2,2]

#vectors, matrix, and arrays can only contain one variable type.

# lists are the only thing that contain multiple variable types
my_lst <- list(1:3, "hello", matrix(1:9, 3,3))
my_lst

# PAY ATTENTION
my_lst[3] #will give the matrix (returns [[1]])
my_lst[[3]] # will return whatever is inside the third element

my_lst[[3]][2,1] # Will get element inside the list
my_lst[3][2,1] # WILL NOT WORK 

# NOTES: 
#   - Matrix fills by column
test <- matrix(1:6, nrow=2, ncol=3)
# What will happen if:
# - 1:10
# - 1:3
# - # rows to a non-integer value


# Suppose you have two defined vectors a and b. You run cbin(1,b)
# What will happen if...You change 'a' such that 'a' and 'b' are no longer the same lenght?

#---------
# Worksheet 4
#a) Using the matrix function, construct a 4X3 matrix m, containing 
# the elements 1 -12. Fill the matrix by column
elm <- c(1:12)
nw_mtrx <- matrix(elm, nrow=4, ncol=3)
nw_mtrx

#b) Add row names to a,b,c,d. and column names x-z to matrix
rnames <- c("a","b","c","d")
cnames <- c("x","y","z")
nw_mtrx <- matrix(elm, nrow=4, ncol=3,
                  byrow=TRUE, dimnames=list(rnames,cnames))
nw_mtrx

#c) Extract the elements in column one. COMMA BEFORE #
nw_mtrx[,1]

#d) Extract the element in row 3, column 1
nw_mtrx1 <- nw_mtrx["c", "x"]
print(nw_mtrx)
print(nw_mtrx1)

#--------------------------------------------------------------------
#Problem 2
a <- c(1,2,3)
b <- c(6,7,8)

#Write one line of code to generate the following result
nw_mthd <- cbind(a,b)
nw_mthd

#Check if its a matrix
is.matrix(nw_mthd)
#--------------------------------------------------------------------
#Problem 3
#Write an R program to create and print an empty 2x3 matrix
mat <- matrix(NA, nrow=2, ncol=3)
mat
matrix(nrow=2, ncol=3)


#--------------------------------------------------------------------
#Problem 4
#Write code to create an array of two 3x3 matricies, each with 3 
#rows and columns
v1 <- c(1,3,4,5)
v2 <- c(10,11,12,13,14,15)
arr <- array(c(v1,v2), dim = c(3,3,2))
arr

#--------------------------------------------------------------------
#Question 5
#Create numeric vector containg elements, find highest and lowest values
v <- c(10, 20, 30, 20, 20, 25, 9, 26)
max(v)
min(v)

#--------------------------------------------------------------------
#Question 6
#Create a list, write code to replace [4] with "ILP 1203"
nw_lst <- list("PSTAT 10", 2024, 300, "ILP 1202")
nw_lst

#Replacing elements
nw_lst[[4]] <- "ILP 1203"
nw_lst


