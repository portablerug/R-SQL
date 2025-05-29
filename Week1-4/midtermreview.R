# Midterm 1 review

# Examples from section TA
# What will be the output of the following code?

letters[1:3] # prints "a" "b" "c"

x <- c("Bob and Joe", "Bob and Bob")
sub("Bob", "Joe", x) # replaces the FIRST "Bob" with "Joe"
                     # prints "Joe and Joe" "Joe and Bob"

# Suppose you have a matrix
matrix(1:6, nrow=2, ncol=3)

# what will happen if 1:6 -> 1:10
matrix(1:10, nrow=2, ncol=3) # (NOT WORK) length is not a multiple of the number of columns

# now with 1:3
matrix(1:3, nrow=2, ncol=3) # (WORKS) prints   [,1] [,2] [,3]
                            #             [1,]    1    3   2
                            #             [2,]    2    1    3

# a non-integer value?
matrix(1:9.3, nrow=2, ncol=3)

# ------
#  - print function (what does it do when you print certain things)
# with quotes
print("PSTAT 10")
output <- "Welcome to PSTAT 10"
output

# without quotes
print("PSTAT 10", quote = FALSE)
print(noquote("PSTAT 10"))

# ------
#  - vector, matrix, array

# Vector
x <- c(1,2,3,4,5)
is.vector(x) # TRUE
x[2]

# Matrix
m <- matrix(1:6, nrow=2, ncol = 3)
m[1,2]
dim(m)

m1 <- apply(m, 1, sum) # sums all rows, output: 9 12
m1

m <- matrix(c(1, 2, "a", 4), nrow = 2)
print(m)
#      [,1] [,2]
# [1,] "1"  "a" 
# [2,] "2"  "4"
# changes everything into a CHARCTER

# Array 



# ------
# Tabel()
# used to count frequency of each unique value
colors <- c("red", "blue", "red", "green", "blue", "blue")
table(colors) 
# prints names ALPHABETICAL and their frequency

# Cross-tabulation
# Create two simple vectors
gender <- c("Male", "Female", "Female", "Male", "Female", "Male", "Male")
preference <- c("Tea", "Coffee", "Tea", "Coffee", "Tea", "Tea", "Coffee")

# Create a 2-way table
table(gender, preference) # sorted in ROW, COLUMN

# ------
# Lists
# the only thing that contain multiple variable types
my_lst <- list(1:3, "hello", matrix(1:9, 3,3))
my_lst # prints each one with header [[1]], for element in list

# PAY ATTENTION
my_lst[3] #will give the matrix (returns [[1]])
my_lst[[3]] # will return whatever is inside the third element

my_lst[[3]][2,1] # Will get element inside the list
my_lst[3][2,1] # WILL NOT WORK 

my_lst[[1]][3]

# Does a data frame, and matrix (fill by row or column?)
# Matrix fills by column BY DEFAULT
matrix(1:6, nrow=2,ncol=3)
matrix(1:6, nrow=2,ncol=3, byrow=TRUE) # fills by row

# Data Frame, each variable is treated as a column
# when you create a DF, you usually define it by columns
df <- data.frame(
  name = c("Alice", "Bob", "Cara"),
  age = c(25, 30, 22)
)
df



# ------
# cbind() and rbind()
# Two data frames with the same column names
df1 <- data.frame(name = c("Alice", "Bob"), age = c(25, 30))
df2 <- data.frame(name = c("Cara", "Dan"), age = c(22, 28))

# Combine by rows when they have the same column names
rbind(df1, df2)

# rbind() same number of column and column names (more vertical)
# cbind() same number of rows (more horizontal)

# ------
# Constants
month.abb
month.name
toupper(month.name[1:3])
month.abb[1:3]


letters
letters[1:3] # [1] "a" "b" "c"

LETTERS
LETTERS[1:3] # [1] "A" "B" "C"

state.abb #"CA" "FL"
state.name #"California" "Florida" 

# ------
# seq()
# generates sequences of numbers (num patters you can control)
seq(1,10) # 1-10

seq(1,10, by=2) # 1 3 5 7 9

seq(0,100, length = 5) # 0  25  50  75 100

seq(10,1, by= -1) # 10  9  8  7  6  5  4  3  2  1
# reversed when by = negative number

# ------
# summary()
# gives stat summary of a vector, column, or data-set
x <- c(3, 5, 7, 9, 11)
summary(x)
fivenum(x)

# with factors
colors <- factor(c("red", "blue", "red", "green", "blue"))
summary(colors) # counts frequency without name
table(colors) # counts frequency WITH variable name on top

# ------
# Barplots(x, names.arg, xlab, ylab, col)
products <- c("Apples", "Bananas", "Cherries")
sales <- c(100, 150, 200)

barplot(sales,
        names.arg = products, # labels for bars
        main = "Fruit Sales",
        xlab = "Fruit",
        ylab = "Units Sold",
        col = "skyblue")

# using table
colors <- c("Red", "Blue", "Red", "Green", "Blue", "Blue")
color_count <- table(colors)
color_count

barplot(color_count,
        main = "Favorite Colors",
        col = c("red", "blue", "green"))



# ------
# Qualitative vs. Quantitative Data
#  - Sd can never be negative
#  - Domain of Sd [0, INF)
#  - Only works with quantitative (numeric) data
#  - When you add an outlier to a distribution, SD will INCREASE

# ------
# write() read()




# -----
# Midterm Review Questions
a <- data.frame(v1=1:3, v2=LETTERS[1:3])
b <- data.frame(v1=6:8, v2=LETTERS[6:8])
m <- rbind(a, b) # makes more rows
m

m <- cbind(a,b) # makes more columns
m

# ---
m <- matrix(nrow=2, ncol=3) # output is NA
m1 <- matrix(nrow=2, ncol=3.5) # rounds to the whole number 
m2 <- mat(nrow=2, ncol=3) # ERROR 

# ---
y <- c(FALSE, 2)
class(y) # NUM

x <- c("hello",2, 4, TRUE)
class(x) # CHAR

# ---
m <- matrix(nrow = 2, ncol=3)
dim(m) # 2 3

# ---
s <- c(4,6,5,7,10,9,4,15)
f <- c(0,10,1,8,2,3,4,1)

s*f # multiplies each element w corresponding element

# ---
A <- 12
B <- 20
print(A,B) # only prints first variable
print(c(A,B)) # prints both

# ---
vect <- c(2,7,9,11,5)
vect[2]


# problem 1
# Suppose you have a vector 'a' and 'b' of different lengths (a=5, b=3). What
# will be the result of a+b, c(a+b), and sum(a,b)
a <- c(1,2,3,4,5)
b <- c(1,2,3)

a+b # ERROR: object lengths are not multiples
c(a+b) # ERROR 
sum(a+b)# ERROR 

a1 <- 5
b1 <- 3

a1+b1 # 8
c(a1+b1) # 8
sum(a1+b1) # ERROR: object lengths are not multiples

a2 <- c(1,2,3)
b2 <- c(4,5,6)

a2+b2 # 5 7 9 
c(a2+b2) # 5 7 9
sum(a2+b2) # 21


# problem 2
# Are the following variable names valid or invalid?
12months <- "hello"
H99999 <- "hello"
....room <- "hello"
.33 (no) <- "hello"
_name (no) <- "hello"
classroom.winter123 <- "hello"


# Correct
months12 <- "hello"
dot.33 <- "hello"
name_ <- "hello"
....room <- "hello"
classroom.winter123 <- "hello"

# problem 3
View(iris)
# using the iris data set, use one line of code each and the subset() function
# to create a new data-frame containing only sepal length and width
# IN TWO DIFFERENT WAYS (select sepal length and width or use minus to delete all others)
df1 <- subset(iris, select = c(Sepal.Length, Sepal.Width))

df2 <- subset(iris, select = -c(Petal.Length, Petal.Width, Species))
head(df2)


# problem 4
x <- list(a=1:3, b=4:9, c=10:11)
# if i used lapply(x, sum), what is the type and values of the output.
# calcualte acc numbers that generate in function
# what about sapply(x,sum)


# problem 5
# how many values in the resulting sequence? 
seq(from=2, to=22, by=3)



# ON MIDTERM (what happens when you set na.rm=FALSE vs na.rm=TRUE?)
vec <- c(2,3,3,3,4,2,5,NA,10)
mean(vec, na.rm=T)
mean(vec, na.rm=F)


# ----
# version A miderm
print(Welcome to PSTAT10, quote=T)


# output
Students <- c("Bob", "Ann", "bob", "ann", "chris")
table(Students)

# has to be exact
z <- c("pstat 10 , PSTAT 10 and pstat 8, PSTAT 8")
gsub("pstat 10", "pstat 8", z)

# Result
chick <- c(1,2,-1,6,2,9)
fried <- c(1,5,2)
chick + fried # will recycle 

# Corelation Coefficient is between -1 & 1

# nominal, ordinal, interval, ratio 
x <- c(1,2,2,3,4,4,4,5,5,12)
# the code 
which(x<2|x>4) # will return? 
