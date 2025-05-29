# Lab 6

library(MASS)
# Access painters Data set
?painters
View(painters)
ls(painters)

# 1) Find mean composition score of school C
painters$School == "C"
comp <- painters$Composition[painters$School == "C"]
mean(comp)

# 2) Find school with the highest composition scores
max(painters$Composition)
highest_comp <- which(painters$Composition == max(painters$Composition))
highest_comp
painters$School[highest_comp]

# 3) Find the percentage of painters whos color score is => 14
n <- nrow(painters)
color_scr14 <- sum(painters$Colour >= 14) # goes through every row and check >14. If true its "1", false "0" then adds them.
color_scr14 / n * 100
 
# 4) Construct a pie chart of painter schools
pie(painters$School) # ERROR 

school <- table(painters$School) # use on any frequency data set to AGGRAGATE 
school
pie(school, main = "Pie Chart of Painter Schools")

# 5) Instead of computing mean for each school manually, use tapply()
#     to compute them all at once
tapply(painters$Composition, INDEX = painters$School, FUN= mean)

# 6) bar graph of painter schools
barplot(table(painters$School), main = "Plot", xlab= "School")

# LEARN Parameters for BAR Plot (names.arg, col, main, xlab, ylab)

# Midterm Review: 
#  - Worksheet 4, know what table does (and output)
#  - does a data frame, and matrix (fill by row or column?)
#  - gsub and sub differences
#  - Qualatative (SD = can it be negative, domain, and what happens if you 
#                 have a distribution and you add outliter. Will it change?)
#  - Negative Corra
#  - rbind vs. cbind
#  - month.abb, month.name
#  - seq()
#  - summary () how many values does it return
# go over worksheet and homework

# Thursday 5-7pm Office Hours

# problem 1
# Suppose you have a vector 'a' and 'b' of different lengths (a=5, b=3). What
# will be the result of a+b, c(a+b), and sum(a,b)

# problem 2
# Are the following variable names valid or invalid?
# 12months (NAH)
# H99999 (yes)
# ....room (no)
# .33 (no)
# _name (no)
# classroom.winter123 (yes)

# problem 3
View(iris)
# using the iris dataset, use one line of code each and the subset() function
# to create a new dataframe containing only sepal length and width
# IN TWO DIFFERENT WAYS (select sepal length and width or use minus to delete all others)

# problem 4
x <- list(a=1:3, b=4:9, c=10:11)
# if i used lapply(x, sum), what is the type and values of the output.
# calcualte acc numbers that generate in function
# what about sapply(x,sum)


# problem 5
# how many values in the resulting sequence? 
seq(from=2, to=22, by=3)




#Analyze the 'painters' data frame
hist(painters$Composition, col = "yellowgreen")
head(painters)
summary(painters)
str(painters) #gives summary of variables as we;
#-------------------------------------------------------------------------------
mean(painters$Composition[17:22])

#-------------------------------------------------------------------------------
#find school with highest composition scores
max(painters$Composition)
hg_comp_scr <-  which(painters$Composition == max(painters$Composition))
painters$School[hg_comp_scr]

#-------------------------------------------------------------------------------
#Find percentage of painters whose color score is equal to or above 14
sum(painters$Colour >= 14)
n <- nrow(painters)
n #number of observations in data
round((sum(painters$Colour >= 14) /n)*100, 2)

#-------------------------------------------------------------------------------
#Construct a pie chart of the painters chools in the data set painters
painters$School
table(painters$School)
pie(table(painters$School), main = "Pie Chart of Painter Schools", 
    col = c("red", "blue", "green", "yellow",
            "white", "purple", "orange", "tan"))

#-------------------------------------------------------------------------------
#Instead of computing the mean composition score manually, for each school, use
#the tapply() function to compute them all at once. 
out <- tapply(painters$Composition, INDEX = painters$School, FUN = mean) 
out
#-------------------------------------------------------------------------------
#construct bar graph of the paintes schools in the data set
table(painters$School)
barplot(table(painters$School), main = "Barplot of Painter Schools", 
        col = c("beige", "cyan", "yellowgreen", "yellow",
                "white", "purple", "orange", "tan"))

