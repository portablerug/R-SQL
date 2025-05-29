# Lecture 14 - SQL
library(DBI)
library(RSQLite)
library(sqldf)

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

# Connect to DB
mydb <- dbConnect(RSQLite::SQLite(), "PSTAT10db.sqlite")

# overwrite database
dbWriteTable(mydb, "CUSTOMER", CUSTOMER, overwrite=T)
dbWriteTable(mydb, "DEPARTMENT", DEPARTMENT, overwrite=T)
dbWriteTable(mydb, "EMPLOYEE_PHONE", EMPLOYEE_PHONE, overwrite=T)
dbWriteTable(mydb, "EMPLOYEE", EMPLOYEE, overwrite=T)
dbWriteTable(mydb, "INVOICES", INVOICES,overwrite=TRUE)
dbWriteTable(mydb, "PRODUCT", PRODUCT, overwrite=T)
dbWriteTable(mydb, "SALES_ORDER", SALES_ORDER, overwrite=T)
dbWriteTable(mydb, "SALES_ORDER_LINE", SALES_ORDER_LINE, overwrite=T)
dbWriteTable(mydb, "STOCK_TOTAL", STOCK_TOTAL, overwrite=T)

getwd()
setwd("/Users/eva-01/Documents/Spring2025/PSTAT 10/week8")
getwd()
# list table and done.
dbListTables(mydb)

# ------------------------------------------------------------------------------
# Does tinyclothes have any orders for products p1,p2 or p3

# SELECT all attributes
# FROM the relation SALES_ORDER_LINE
# WHERE FORD_NO is p1,p2 or p3 (can use Logical Operator "IN")

# look at the sales line
dbGetQuery(mydb, 'select * from SALES_ORDER_LINE')

# use where condition
dbGetQuery(mydb, 'select * from SALES_ORDER_LINE 
           where PROD_NO IN ("p1","p2","p3")') #double quotes

# leave out quantity
dbGetQuery(mydb, 'select ORDER_NO, PROD_NO from SALES_ORDER_LINE where PROD_NO
           in ("p1", "p2", "p3")')

# any other products that