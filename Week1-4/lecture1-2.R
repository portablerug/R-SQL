#Week 1, Lecture 1
#-------------------------------------------------
print("Welcome to PSTAT 10")

# Works
print("PSTAT 10", quote = FALSE)

output <- "Welcome to PSTAT 10"
output

# Change command prompt, options(prompt = "R> ")
#-------------------------------------------------
# Section 1
getwd()

# a)
8/2-2*(2-3)

# b)
sqrt(1024)

# Q4, a)
options(prompt = "R> ")

# variable
rval <- "First Lab Section"
rval    # Call variable  
#-----------------------------------------------------
# Lecture 2
# numeric vector
x <- c(1,2,3,4)
x
class(x)
mean(x)
median(x)
# Character 
y <- c("cat", "dog", "monkey")
y  
class(y)

Test_Results <- c("Bob" = 8, "Alice" = 7, "Alex" = 8,
                  "Juan" = 10, "Amy" = 5)
class(Test_Results)
mean(Test_Results)
median(Test_Results)

Test_Results[1]
Test_Results[1:3]


# Repetition function (vector of repeated values)
rep(3, times=5)
rep(x=3, times=5)
rep(1:4, each = 2)
rep(1:4, each=2, length=4)

# Sort function (sort a vector with increasing as default)
h <- c(1,20,40,29,21, 2)
sort(h)
sort(h, decreasing=TRUE)

# "Any" function (checks the condition within the vector)
any(h<7)
any(h>7)
print(h>7)

# "All" function (checks if all elements in vector are true to the condition)
all(h<7)

#---------------------------------------------------



