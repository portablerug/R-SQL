# Lab 13 

# Load RSQLite libraries and connect
library(DBI)
library(RSQLite)
library(sqldf)
mydb <- dbConnect(RSQLite::SQLite(), "PSTAT10db.sqlite")

# Import 'tinyclothes' files into RStudio
CUSTOMER <- read.csv("/Users/eva-01/Documents/Spring2025/PSTAT 10/tinyclothes/CUSTOMER.txt")
DEPARTMENT <- read.csv("/Users/eva-01/Documents/Spring2025/PSTAT 10/tinyclothes/DEPARTMENT.txt")
EMPLOYEE_PHONE <- read.csv("/Users/eva-01/Documents/Spring2025/PSTAT 10/tinyclothes/EMPLOYEE_PHONE.txt")
EMPLOYEE <- read.csv("/Users/eva-01/Documents/Spring2025/PSTAT 10/tinyclothes/EMPLOYEE.txt")
INVOICES <- read.csv("/Users/eva-01/Documents/Spring2025/PSTAT 10/tinyclothes/INVOICES.txt")
PRODUCT <- read.csv("/Users/eva-01/Documents/Spring2025/PSTAT 10/tinyclothes/PRODUCT.txt")
SALES_ORDER_LINE <- read.csv("/Users/eva-01/Documents/Spring2025/PSTAT 10/tinyclothes/SALES_ORDER_LINE.txt")
SALES_ORDER <- read.csv("/Users/eva-01/Documents/Spring2025/PSTAT 10/tinyclothes/SALES_ORDER.txt")
STOCK_TOTAL <- read.csv("/Users/eva-01/Documents/Spring2025/PSTAT 10/tinyclothes/STOCK_TOTAL.txt")


# Copy in R data frames (^^) into an RSQLite database with dbWriteTable()
# dbWriteTable(conn , table name, df name load in)
dbWriteTable(mydb, "INVOICES", INVOICES, overwrite=TRUE)
dbWriteTable(mydb, "PRODUCT", PRODUCT, overwrite=TRUE)
dbWriteTable(mydb, "SALES_ORDER_LINE", SALES_ORDER_LINE, overwrite=TRUE)
dbWriteTable(mydb, "SALES_ORDER", SALES_ORDER, overwrite=TRUE)
dbWriteTable(mydb, "STOCK_TOTAL", STOCK_TOTAL, overwrite=TRUE)
dbWriteTable(mydb, "EMPLOYEE_PHONE", EMPLOYEE_PHONE, overwrite=TRUE)

# List the relations in the database
dbListTables(mydb)

# Return all tuples in the relation CUSTOMER
dbGetQuery(mydb, 'select * from CUSTOMER')


4%%2

5%%2

11%%2


