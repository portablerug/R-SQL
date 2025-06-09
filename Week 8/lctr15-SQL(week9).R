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

# SELECT (all attributes)
# FROM the relation SALES_ORDER_LINE
# WHERE PROD_NO is p1,p2 or p3 (can use Logical Operator "IN")

# look at the sales line
dbGetQuery(mydb, 'select * from SALES_ORDER_LINE')

# use where condition
dbGetQuery(mydb, 'select * from SALES_ORDER_LINE 
           where PROD_NO IN ("p1","p2","p3")') #double quotes

# leave out quantity
dbGetQuery(mydb, 'select ORDER_NO, PROD_NO from SALES_ORDER_LINE where PROD_NO
           in ("p1", "p2", "p3")')

# any other products that aren't p1,p2, or p3?
dbGetQuery(mydb, 'select * from SALES_ORDER_LINE 
           where PROD_NO NOT IN  ("p1", "p2","p3")')

# which orders are for p1
# look at sales order line again
dbGetQuery(mydb, 'select * from SALES_ORDER_LINE')
# we want the order numbers. Would you also report the quantities?
dbGetQuery(mydb, 'select ORDER_NO from SALES_ORDER_LINE
           where PROD_NO in ("p1","p2","p3") and (PROD_NO is "p1")')

dbGetQuery(mydb, 'select ORDER_NO from SALES_ORDER_LINE
           where PROD_NO is ("p1")')

# ------------------------------------------------------------------------------
# which department is assigned to a manager E3?
##  use IS op
# use double quotes for strings
dbGetQuery(mydb, 'select * from department')
dbGetQuery(mydb, 'select * from DEPARTMENT where MANAGER is "E3"')

# Examples of errors
dbGetQuery(mydb, 'select * from DEPARTMENT where MANAGER IS 'E3'') # same quotes

# ------------------------------------------------------------------------------
## COMPUTATION
# What is the amount due for each product for each of the current orders?
dbGetQuery(mydb, 'select * from INVOICES')
dbGetQuery(mydb, 'select *, PRICE*QUANTITY from INVOICES') # select order_no, prod_no (same thing)
# ^^^ will output a new column with PRICE*QUANTTY. selects all AND gives price*quantity


dbGetQuery(mydb, 'select PRICE*QUANTITY from INVOICES 
           where PROD_NO in ("p1", "p2")') # get specific product amount due

# which products have orders invoiced for less than $300?
dbGetQuery(mydb, 'select ORDER_NO, PROD_NO, PRICE*QUANTITY from INVOICES 
           where PRICE*QUANTITY<300')

# ------------------------------------------------------------------------------
## GLOB OPERATOR
# RSQL is sometimes case sensitive, GLOB is. LIKE is not
# - GLOB used to compare a value to other values using wildcard operators (similar to LIKE)
# - (*) stands for zero or multiple number of characters ; (?) represents a single number or char

# LIKE is not case-sensitive
EMPLOYEE
dbGetQuery(mydb, 'select NAME from EMPLOYEE where NAME 
           LIKE "%r%"') # returns 2 names
dbGetQuery(mydb, 'select NAME from EMPLOYEE where NAME 
           LIKE "%R%"') # returns 2 names

# GLOB is case-sensitive
dbGetQuery(mydb, 'select NAME from EMPLOYEE where NAME
           GLOB "*R*"') # returns 2 names
dbGetQuery(mydb, 'select NAME from EMPLOYEE where NAME
           GLOB "*r*"') # returns no names

# ------------------------------------------------------------------------------
# retrieve the names of all employees who are managers
# and the departments for which they are responsible
dbGetQuery(mydb, 'select * from DEPARTMENT')
dbGetQuery(mydb, 'select * from EMPLOYEE')

dbGetQuery(mydb, 'select employee.EMP_NO, employee.NAME,
           department.NAME 
           from EMPLOYEE inner join DEPARTMENT
           where employee.DEPT_NO = department.DEPT_NO
           and employee.EMP_NO = department.MANAGER')

# modify the program to return the desired column headings
dbGetQuery(mydb, 'select employee.EMP_NO as "EMPLOYEE NUMBER",
           employee.NAME as "EMPLOYEE NAME",
           department.NAME as "DEPARTMENT MANAGED"
           from EMPLOYEE inner join DEPARTMENT
           where employee.DEPT_NO = department.DEPT_NO
           and employee.EMP_NO = department.MANAGER')

# ------------------------------------------------------------------------------
# Retrieve the product names and product colors ordered by customer 01
dbGetQuery(mydb, 'select * from CUSTOMER')
dbGetQuery(mydb, 'select * from SALES_ORDER')
dbGetQuery(mydb, 'select * from SALES_ORDER_LINE')
dbGetQuery(mydb, 'select * from PRODUCT')

dbGetQuery(mydb, 'select c.CUST_NO , c.NAME as Customer_Name,
           p.NAME as PRODUCT_NAME, COLOR as Required_Color
           from CUSTOMER c, SALES_ORDER_LINE o, SALES_ORDER s, PRODUCT p
           where c.cust_no="C1"
           and c.CUST_NO = s.CUST_NO
           and s.ORDER_NO = o.ORDER_NO
           and o.PROD_NO = p.PROD_NO')








