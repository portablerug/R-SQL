# Week 2
# Loading state dataset
data("state")

# Remove unwanted datasets
rm(state.center)
rm(state.division, state.region, state.x77)

# Check if it is a demo
is.vector(state.area)

# gives QUOTE MARKS of state names
state.name
class(state.name)
state.abb

# print state area codes
print(state.area)
class(state.area)

#------
# Creating a histogram
hist(state.area, col="lightgreen")

# a BETTER histogram
hist(state.area, breaks = "Sturges", col="lightgreen",
     xlab = "State Areas (sq.miles)",
     ylab = "FREQUENCY",
     main = paste("Histogram of State Areas"))

# option to take off scientific notation
options(scipen = 999) # turn back on is scipen = 0

hist(state.area, breaks = "Sturges", col="lightgreen",
     xlab = "State Areas (sq.miles)", boarder = "lightblue",
     ylab = "FREQUENCY",
     main = paste("Histogram of State Areas"))

# stem plot of area codes
stem(state.area, scale=2)
# When you have a histogram, you lose some data. There is no way to reconstruct the raw
# dataset where it was produced. From the stem plot, you can reconstruct the dataset

#------
# Stem Plots

x <- c(12,15,24,29,30,31,52, 58, 60,63)
stem(x, scale=2)


#------
# Standard Deviation
#   - Do not ignore the outliers

#------
# Summary Function
#  - Gives the Min. , 1st Qu. Median, Mean, 3rd Qu., Max.
f <- c(12,3,4,56,78,18,46,78,100)
summary(f)

# five number summary
fivenum(f)

# ------
# Lecture 4 Matricies
# Create a 5 x 4 matrix
y <- matrix(1:20, nrow=5, ncol=4, byrow = F) # Sequence goes down when FALSE (fill by column)
y

y[,3] # 3rd column in matrix
      # output: 11 12 13 14 15

y[3,] # 3rd row of the matrix
      # output: 3 8 13 18

y[2:4, 1:3] # rows 2-4 and columns 1-3
dim(y)

# ------
# Construct a vector of the data to be used in the matrix
HEC <- c(32, 11, 10, 3, 53, 50, 25, 15, 3, 30, 5, 8)

HairEyeColor <- matrix(HEC, nrow = 3, ncol=4, byrow=T) # fills by row
HairEyeColor

# Adding names to rows and columns
rnames <- c("Black Hair", "Brown Hair", "Blond Hair")
cnames <- c("Brown Eyes", "Hazel Eyes", "Green Eyes", "Black Eyes")
HairEyeColor <- matrix(HEC, nrow=3, ncol=4, byrow=TRUE,
                       dimnames = list(rnames, cnames))
HairEyeColor

# Determine how many people with Blonde hair have Green eyes
HairEyeColor["Blond Hair", "Green Eyes"]

# Sum rows, sum columns
HairEyeColor_sum <- addmargins(HairEyeColor) # adds "Sum" Row and Column
HairEyeColor_sum

# ------
# apply(x, MARGIN, fun) Function
HairEyeColor
x <- apply(HairEyeColor, 1, sum) # sums the rows
y <- apply(HairEyeColor, 2, sum) # sums the columns
print(c(x,y))
# rows and columns
z <- apply(HairEyeColor, c(1,2), sum)
z # applies sum to each element so it retunrs the same matrix

# ------
# Modifying a Matrix
a <- c(1,2,4,5,6)
b <- c(3,2,4,1,9)
d <- c(7,5,5,6,4)

combine <- cbind(a,b,d) # combines by Column (columns labeled a b d, rows = [1,][2,]...)
combine # number of elements = rows

combine_1 <- rbind(a,b,d) # combines by Row
combine_1 # number of elements = columns (rows labeled a b d, columns = [,1][,2]...)

# Removing Matrix Elements
# removing column 'a' from a matrix
combine <- subset(combine, select = -a) 
combine

# overwriting
combine[2,] <- 1:2
combine

# replace second column of a matrix
combine[,1] <- 1:5
combine

# rbind matrix
combine_1[,2] <- 4:6
combine_1

# ------
# Arrays
vect1 <- c(5,9,3)
vect2 <- c(10,11,12,13,14,15)
result <- array(c(vect1, vect2), dim=c(3,3,2))
result

# Add names
col.nms <- c("COL1", "COL2", "COL3")
row.nms <- c("ROw1", "ROW2", "ROW3")
mtrx_nm <- c("Matrix1", "Matrix2")
result <- array(c(vect1, vect2),
                dim=c(3,3,2), dimnames = list(row.nms, col.nms, mtrx_nm))
result

# Calculations across arrays 
aaa <- c(2,3,)

