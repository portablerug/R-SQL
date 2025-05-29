# Lecture 13

# Connect to Database
getwd()
# read in all 9 files
CUSTOMER <- read.csv("/Users/eva-01/Documents/Spring2025/PSTAT 10/tinyclothes/CUSTOMER.txt")
DEPARTMENT <- read.csv("/Users/eva-01/Documents/Spring2025/PSTAT 10/tinyclothes/DEPARTMENT.txt")
EMPLOYEE_PHONE <- read.csv("/Users/eva-01/Documents/Spring2025/PSTAT 10/tinyclothes/EMPLOYEE_PHONE.txt")
EMPLOYEE <- read.csv("/Users/eva-01/Documents/Spring2025/PSTAT 10/tinyclothes/EMPLOYEE.txt")
INVOICES <- read.csv("/Users/eva-01/Documents/Spring2025/PSTAT 10/tinyclothes/INVOICES.txt")
PRODUCT <- read.csv("/Users/eva-01/Documents/Spring2025/PSTAT 10/tinyclothes/PRODUCT.txt")
SALES_ORDER_LINE <- read.csv("/Users/eva-01/Documents/Spring2025/PSTAT 10/tinyclothes/SALES_ORDER_LINE.txt")
SALES_ORDER <- read.csv("/Users/eva-01/Documents/Spring2025/PSTAT 10/tinyclothes/SALES_ORDER.txt")
STOCK_TOTAL <- read.csv("/Users/eva-01/Documents/Spring2025/PSTAT 10/tinyclothes/STOCK_TOTAL.txt")


# Install packages
install.packages("DBI")
install.packages("RSQLite")
install.packages("sqldf")
library(DBI)
library(RSQLite)
library(sqldf)
mydb <- dbConnect(RSQLite::SQLite(), "PSTAT10db.sqlite")

# Write, overwrite or append dataframe to a database relation
# SYNTAX: dbWriteTable(conn, dataframe name, relation name, overwrite, append)
dbWriteTable(mydb, "DEPARTMENT", DEPARTMENT, overwrite=TRUE)
dbWriteTable(mydb, "CUSTOMER", CUSTOMER, overwrite=TRUE)
dbWriteTable(mydb, "INVOICES", INVOICES, overwrite=T)

dbWriteTable(mydb, "EMPLOYEE", EMPLOYEE, overwrite=TRUE)
dbWriteTable(mydb, "EMPLOYEE", EMPLOYEE)


# Show the relation in the console
dbReadTable(mydb, "DEPARTMENT")
dbReadTable(mydb, "EMPLOYEE")
dbReadTable(mydb, "CUSTOMER")
dbListTables(mydb)

# ------
# Select all tuples from a relation
dbGetQuery(mydb, 'select * from EMPLOYEE')
dbGetQuery(mydb, 'select * from DEPARTMENT')

# result of query is a data frame
is.data.frame(DEPARTMENT)

# ------
# we can add data frames from RStudio packages to the database directly
dbWriteTable(mydb, "mtcars", mtcars , overwrite=T)
dbWriteTable(mydb, "iris", iris, overwrite=T)
dbListTables(mydb) # check they have been added (prints relations in " ")

# mtcars df has 32 overvations
# Select all attributes from mtcars but return only first 5 tuples
dbGetQuery(mydb, 'select * from mtcars LIMIT 5')

# select 'wt' with the condition that mpg > 30
dbGetQuery(mydb, 'select wt from mtcars WHERE mpg > 30')

# select 'wt' and 'mpg' for cars with mpg > 30
dbGetQuery(mydb, 'select wt, mpg from mtcars WHERE mpg > 30')

# ------
# cyl refers to number of cylinders
dbGetQuery(mydb, 'select cyl from mtcars')


# Find the number of gears and the corresponding number of cylinders
dbGetQuery(mydb, 'select gear, cyl from mtcars')

# Find the number of cylinders cars in the survey have (DO NOT RETURN DUPLICATES)
dbGetQuery(mydb, 'select DISTINCT cyl from mtcars')

# ------
# CAUTION : when working with DISTINCT
dbGetQuery(mydb, 'select * from EMPLOYEE')
dbGetQuery(mydb, 'select DISTINCT name from EMPLOYEE')
dbGetQuery(mydb, 'select DISTINCT name, age, dept_no from EMPLOYEE') # still gives duplicate names
dbGetQuery(mydb, 'select DISTINCT name, dept_no from EMPLOYEE')

# NOTE: the following returns an error 
dbGetQuery(mydb, 'select DISTINCT name, DISTINCT age, dept_no from EMPLOYEE')
# cannot build DISTINCT like this ^^^

# ------
# LIKE: pattern matching on strings (% for any sequence of characters) (_ stands for any single character)
dbGetQuery(mydb, 'select * from EMPLOYEE where name LIKE "B%"')
dbGetQuery(mydb, 'select name, age from EMPLOYEE where name 
           LIKE "%N%" AND AGE > 60')
dbGetQuery(mydb, 'select name, age, emp_no from EMPLOYEE where name
           LIKE "%N%" AND age>20')


# % stands for any sequence of characters _ stands for any single character
dbGetQuery(mydb, 'select name, age from EMPLOYEE where name LIKE "%R%"')
dbGetQuery(mydb, 'select name, age from EMPLOYEE where name LIKE "%N%"')
dbGetQuery(mydb, 'select name, age from EMPLOYEE where name LIKE "%_R_E%"')
# SQL has single quotes and still works
dbGetQuery(mydb, "select name, age from EMPLOYEE where name LIKE '_R_E%' ")

# order of operations
dbGetQuery(mydb, 'select * from EMPLOYEE')
dbGetQuery(mydb, 'select * from EMPLOYEE where NOT (NAME = "SMITH")
           AND (EMP_NO = "E1" OR EMP_NO = "E5")')
# NOT is evaluated before AND OR
# expression is evaluated left to right



# ------
# Range Checks
# Retrieve the details of all employees whose age is between 21 and 31
dbGetQuery(mydb, 'select * from EMPLOYEE where (age BETWEEN 21 AND 31)')

# Employees whose age is not 21. Three equivalent queries
dbGetQuery(mydb, 'select * from EMPLOYEE where (AGE != 21)')
dbGetQuery(mydb, 'select * from EMPLOYEE where AGE != 21')
dbGetQuery(mydb, "select * from EMPLOYEE where AGE != 21")

# ------
# Summarizing Functions
# AVG : what is average number of items currently ordered?
# MAX : how many items is the biggest order
# MIN : how many items is the smallest order?
# COUNT : how many invoices are there? 

dbListTables(mydb)
dbGetQuery(mydb, 'select AVG (QUANTITY) from INVOICES')
dbGetQuery(mydb, 'select MAX (QUANTITY) from INVOICES')
dbGetQuery(mydb, 'select AVG (QUANTITY), MIN (QUANTITY) from INVOICES')

# SUMMARY
# data definition language - DDl
# data manipulation language - DML



