# Lab 14
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
dbListTables(mydb)
# ------

# 1) Using a suitable join, write code to join STOCK_TOTAL and INVOICES with the condition
#    that the product numbers match.
dbGetQuery(mydb, 'select * from STOCK_TOTAL st
           inner join INVOICES inv
           ON st.PROD_NO = inv.prod_no') # st = STOCK_TOTAL and inv = INVOICES


# 2) Use a LEFT JOIN to join EMPLOYEE and DEPARTMENT (in that order) on DEPT_NO
dbGetQuery(mydb, 'select * from EMPLOYEE emp
           left join DEPARTMENT dpt
           on emp.DEPT_NO = dpt.DEPT_NO')






