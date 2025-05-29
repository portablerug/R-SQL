# Lab 11

# 1) Write a for loop that iterates over the numbers 1-7 and prints the cube of each number
i <- 1
while(i < 7){
  print(i*i*i) #or i**3
  i = i+1
}

# 2) Using the follwing, write a REPEAT loop that breaks off the increment of i after 6
#    loops and prints the vector x at every increment

x <- c("PSTAT")
i <- 1

repeat{
  print(x)
  i = i+1
  if(i == 6){ #if(i > 6) works too
    break
  }
}

# 3) Write a function that returns the cube of a number (3 QUESTIONS ON MIDTERM)
cube <- function(a){
  b <- a^3
  return(b)
}

# call function w argument
cube(2)
cube(4)

# 4) Write a while loop that prints the square of the odd numbers from 13 through 17
i <- 13
while(i <= 17){
  if(i %% 2 !=0){ 
    print(i^2)
  }
  i <- i+1
}

# ------
getwd()
# read in all 9 files
CUSTOMER <- read.csv("/Users/eva-01/Documents/Spring2025/PSTAT 10/tinyclothes/CUSTOMER.txt")
DEPARTMENT <- read.csv("/Users/eva-01/Documents/Spring2025/PSTAT 10/tinyclothes/CUSTOMER.txt")
EMPLOYEE_PHONE.txt <- read.csv("/Users/eva-01/Documents/Spring2025/PSTAT 10/tinyclothes/CUSTOMER.txt")
EMPLOYEE <- read.csv("/Users/eva-01/Documents/Spring2025/PSTAT 10/tinyclothes/CUSTOMER.txt")
INVOICES <- read.csv("/Users/eva-01/Documents/Spring2025/PSTAT 10/tinyclothes/CUSTOMER.txt")
PRODUCT <- read.csv("/Users/eva-01/Documents/Spring2025/PSTAT 10/tinyclothes/CUSTOMER.txt")
SALES_ORDER_LINE <- read.csv("/Users/eva-01/Documents/Spring2025/PSTAT 10/tinyclothes/CUSTOMER.txt")
SALES_ORDER <- read.csv("/Users/eva-01/Documents/Spring2025/PSTAT 10/tinyclothes/CUSTOMER.txt")
STOCK_TOTAL <- read.csv("/Users/eva-01/Documents/Spring2025/PSTAT 10/tinyclothes/CUSTOMER.txt")

# Install packages
install.packages("DBI")
install.packages("RSQLite")
install.packages("sqldf")
library(DBI)
library(RSQLite)
library(sqldf)

# Connect to RSQLite
mydb <- dbConnect(RSQLite::SQLite(), "PSTAT10db.sqlite")

                  