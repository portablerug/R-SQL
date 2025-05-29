# Week 3
# Lecture 6: Data Frames

# Notes for Midterm
#  - 

# Constructing a data frame
d <- c(2,3,4,6) # numeric 
e <- c("red", "white", "red", "green") # character 
f <- c(TRUE,TRUE,TRUE,FALSE) # logic

my_df <- data.frame(d,e,f)
my_df

# **************************
# Define row names
rw_nms <- c("one", "two", "three", "four")
my_df <- data.frame(d,e,f, row.names=rw_nms)
my_df # rw_nms are printed on the left side WITHOUT QUOTES

#select columns d and f only
my_df2 <- my_df[,c("d","f")] # row , column
my_df2

# select column d and e
my_df3 <- my_df[,c(1,2)]
my_df3

# **********
# select a single column
my_df4 <- my_df[,c("e")]
my_df4 
# OUTPUTS -> "red" "white" "red" "green"
# Does not output in a column

my_df5 <- my_df[c("one", "two"),]
my_df5

# -------
# IRIS Data set
data('iris')
View(iris)
is.data.frame(iris)
dim(iris) # 150 observations & 5 variable
ls(iris) # gives names of objects (variables) "Petal.Length" "Petal.Width" ....
names(iris) # also shows names

# ------
# print first and last 5 rows of a data set
head(iris, n=5)
tail(iris, n=5)

# remove an object from data set
my_iris_ds <- subset(iris, select= -Petal.Width)
head(my_iris_ds, n=5)
# subset() used to get observations and objects


# removing two objects
my_iris_ds2 <- subset(iris, select = -c(Petal.Width, Species))
head(my_iris_ds2, n=5)

# KEEPING only  "n" objects (specific)
my_iris_ds3 <- subset(iris, select = c(Petal.Length, Species))
head(my_iris_ds3, n=5)

# removing (or keeping) many columns
my_iris_df4 <- subset(iris, select = -c(Sepal.Width:Species))
head(my_iris_df4, n=5)

summary(iris) # numeric summary

# histogram of petal length. Note the use of $
hist(iris$Petal.Length, col = "lightgreen")
mean(iris$Petal.Length)
median(iris$Petal.Length)
sd(iris$Petal.Length)

# create side-by-side boxplots to comapre
boxplot(Petal.Length~Species , data=iris,
        main=toupper("Petal.Length to Spcies"),
        xlab = "Species", ylab="Petal.Length", col='brown1')

# ------
# Combine Examples
frst_nm <- c("Ann", "Paul", "Bob")
lst_nm <- c("Smith", "Liu", "Lopez")
dep <- c("math", "Physics", "Bio")

# combine into an R object
fct_profile <- cbind(frst_nm, lst_nm, dep)
fct_profile
is.matrix(fct_profile)

# create a DATA FRAME w similar columns (NOTICE "=")
new_fct_profile <- data.frame(frst_nm = c("John", "Andrea", "Miguel"),
                              lst_nm = c("Wu", "Hern", "Juarez"),
                              dep = c("History", "CS", "Math"))
new_fct_profile # it is a data frame

# join BOTH fct profiles
all_fct_profiles <- rbind(fact_profile, new_fct_profile)
all_fct_profiles # it is a data frame

# ------
# write() , read(), getwd()
# export all_fact_profile as a csv file
write.csv(all_fct_profiles, "All_Factulty_Profile.csv")
getwd()

# import 
read.csv("All_Factulty_Profile.csv") # comes back with a column X and 1:n

# ------
# Missing Values in a data frame
missing <- data.frame(x = c("PSTAT", 2, TRUE) ,
                      y = c(5, NA, 8))
missing
is.data.frame(missing)
na.omit(missing) # remove row with NA values

# ------
# Old faithful Data Set (geyser in Yellow Stone)
data("faithful")
head(faithful, n=10)

# TWO DIFF ways to create a hist
duration <- faithful$eruptions
hist(duration, col = "darkslategray4")
hist(faithful$eruptions)

# define our own color pallet!! YAY
color <- c("brown1", "orange", "lightgreen", "cornflowerblue", "gold3",
           "brown1", "orange", "lightgreen")
hist(duration, col=color)

# STEMPLOT
stem(duration, scale=2)
summary(duration)
boxplot(duration, col = color)

# ------
# MIDTERM HINTS
#  - print function (what does it do when you print certain things)
#  - vector, matrix, array
#  - data frame() (a question on it)
#  - [] notation and [[]] (LAB THING)
#  - table() (notes)
#  - sub() & gsub() ()
#  - sample standard deviation (properties of sample SD, beginning of the course)
#  - rbind() & cbind()
#  - barplot() (SYNTAX)

#  - predefined constants (month.abb, letters (upper and lowercase))
#  - write.csv() , read.csv()
#  - seq() & rep()
#  - correlation (notes LECTURE 6, look at practice problems)
#  - summary() 
#  - select()
#  - list()
#  - levels of measurement 





