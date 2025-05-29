# Homework 3

# Arrays in Practice!!!

# a) Create an array of 2 matricies, each with 2 rows, 2 cols
mtrx <- c(8, 98, 5, 115, 22, 76, 16, 69)
arr.clinic <- array(mtrx, dim = c(2,2,2))
arr.clinic
# b) Dimnames - given as a list of the names for each dimensions
# i) outcome (for rows)
rownames(arr.clinic) <- c("Deaths", "Survivors")

# second way
dimnames(arr.clinic)[[1]] <- c("Deaths", "Survivors")
arr.clinic

# ii) treatement (for columns)
colnames(arr.clinic) <- c("TOLB", "Placebo")
# second way
dimnames(arr.clinic)[[2]] <- c("TOLB", "Placebo")
arr.clinic

# iii) age group (matrix name)
dimnames(arr.clinic)[[3]] <- c("Age<55", "Age>=55")
arr.clinic

# c) Calculate
# i) total number of deaths and total number of survivors
apply(arr.clinic, MARGIN = 1, FUN=sum)

# ii) total number given tolbutamide and total number given placebo
apply(arr.clinic, MARGIN = 2, FUN=sum)


# iii) print row 2, col 2 of matrix 2
arr.clinic[2,2,2]

# d) Create a matrix of the Combined data (matrix1 + matrix2 = mtrx3)
combined <- apply(arr.clinic, MARGIN=c(1,2), FUN = sum)
combined

# ------
# Data Frames in Practice 

# a) Is VADeaths a data frame? if not, coerce to a data frame
is.data.frame(VADeaths) # FALSE

VADeaths.df <- as.data.frame(VADeaths)
is.data.frame(VADeaths.df)

# b) Create a new variable, showing the sum of each row
ttl.deaths <- apply(VADeaths.df, MARGIN = 1, FUN = sum)
ttl.deaths

# c) Create a suitable chart summarizing the data
summary(VADeaths.df)

# ------
# Working with Data Frames
# use state.x77 from state package

# a) What kind of R object is state.x77
state.x77
class(state.x77) #matrix array

# b) Create a data frame df1 using the state.x77 data
df1 <- as.data.frame(state.x77)
head(df1)

# c) using df1 determine how many states have an income of less than $4300
lw.income <- sum(df1["Income"] < 4300)
lw.income # 20 states

# ------
# Factors

# a) Create a factor, z, with elements: "Agree" , "Agree", "Strongly Agree", "Disagree" , "Agree"
x <- factor(c("Agree", "Agree", "Strongly Agree", "Disagree", "Agree"),
            levels = c("Disagree", "Agree", "Strongly Agree"))
x

# b) Write code to determine the number of levels in x
nlevels(x) # 3 levels

# c) Write code to determine the levels in x
levels(x)

# ------
# Create a Data Frame From Raw Data

# a) Create the following data frame using the data frame function
df <- data.frame(Subject = c("English", "Maths", "Chemistry", "Physics"),
                 Percentage = c(80, 100, 85, 95))
df

# b) Rename the columns as Course and Score respectively
colnames(df) <- c("Course", "Score")
df

# c) Write code to extract the Course column
df[1]
# Second Way
df["Course"]
# Does not show column name
df[,1]

# ------
# Create a data frame from an existing Data Frame
swiss

swiss.df <- swiss[c(1,2,3,10,11,12), 
                  c("Examination", "Education", "Infant.Mortality")]
swiss.df


