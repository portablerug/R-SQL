# WEEK 3
# Lecture 5 (Logical Values, Factors)

# REVIEW of apply function
x <- c(1:9)
y <- c(1:12)
z <- c(1:15)

my_lst <- list(x,y,z)

# using lapply() on a list returns a list
lapply(my_lst, sum)

# using sapply() on a list returns a vector of the data
sapply(my_lst, sum)

# ------
# Logical Values
data(state)
# remove unwanted data sets
rm(state.center)
rm(state.division)
rm(state.region)
rm(state.x77)

state.area
# How many US states have an area less than 10 000 sq miles?
sm_st <- state.area < 10000 # returns T or F to the logic statement
sm_st
sum(sm_st) # Gives number of states true to the logic
class(sm_st) # is of class "logical" (DOUBLE PARENTHESIS)

# States greater than 100 000 sq miles?
lrg_st <- state.area > 100000
lrg_st
sum(lrg_st)

# ------
# How many US states have area < 10 000 OR > 100 000 sq miles?
sm_st | lrg_st
sum(sm_st | lrg_st)

# How many US states have area < 10 000 AND > 100 000 sq miles?
# this is an impossible statement
sum(sm_st & lrg_st)

# ------
# which() function returns index positions
state.name # "Alabama" "Alaska"
state.abb # "CA" "CO" "FL" ...
which(state.name=="Alaska") # returns 2 because its second of states in ALPHA ORDER

x <- sort(state.area) # gives smallest to largest in order 
x
which(x>=158000)

which(state.area==5009)

# ------
# FACTORS
gender <- factor(c("male", "female", "female", "male"))
gender

# what are the levels?
levels(gender) # given in DOUBLE QUOTES they are character

# how many levels are there?
nlevels(gender) # sum up the number in each level

# table returns a frequency table
table(gender) # PAY ATTENTION (alphabetical order, no quotes)

# bar chart
plot(gender)

# ------
# Ordinal Data
# ordered() creates function for ordinal data
# factor() need the argument "ordered = TRUE"

clss_grd <- factor(c("A", "B"))
nlevels(clss_grd)
is.factor(clss_grd)

# now with switched
clss_grd_1 <- factor(c("B", "A"))
clss_grd_1 # levels come out alphabetical

# now using ordered() to create a factor
clss_grd_2 <- ordered(c("A", "B"))
clss_grd_2 # gives A < B
is.factor(clss_grd_2)

clss_grd_3 <- ordered(c("B", "A"))
clss_grd_3 # A < B is the same 
is.ordered(clss_grd_3)

# now with 3 levels
clss_grd_4 <- ordered(c("B", "3", "A"))
clss_grd_4  
  
# ------
# using sub() to replace the first match only in a string
# syntax: sub(old, new, string)
y <- c("Hello again PSTAT 10")
y
sub("PSTAT 10", "PSTAT 8", y)

# gsub() replaces ALL in global
x <- c("Hello, Hello world")
x
gsub("Hello", "hi", x)



# ------
letters[1:4] # prints: "a" "b" - "d"
month.name[1:4] # prints: "January" "February" "March" "April"
month.abb[10:12] # prints: "Oct" "Nov" "Dec"

# which()
z <- c(7,3,9,8)
which(z > 3)

library(statip)
x <- c(10,20,30,20,20,25,29,26)
mfv(x)

# 'DescTools' 
install.packages('DescTools')
library(DescTools)
Mode(x) # uppercase for this library


