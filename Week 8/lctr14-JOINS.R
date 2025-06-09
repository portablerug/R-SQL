# Lecture 14 - JOINS
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
# ------------------------------------------------------
## GROUP BY
# - used to apply built-in functions to specific groups of tuples
# how many items are there in each order? 
dbGetQuery(mydb, 'select * from INVOICES')
dbGetQuery(mydb, 'select ORDER_NO, SUM(QUANTITY) from INVOICES
           group by ORDER_NO')

# which ORDERS are invoiced for a quantity of 20 000 or more items? 
dbGetQuery(mydb, 'select ORDER_NO, SUM(QUANTITY) from INVOICES 
           group by ORDER_NO having sum(QUANTITY) > 20000')

#  --------------------------------------------------------
## ORDERING
# - ascending by default unless DESC is specified
# Select all from product and order by NAME
dbGetQuery(mydb, 'select * from PRODUCT order by NAME')

# attributes are referred to by their numerical position
dbGetQuery(mydb, 'select * from PRODUCT order by NAME DESC')
dbGetQuery(mydb, 'select * from PRODUCT order by 1 DESC') #orders by PROD_NO
dbGetQuery(mydb, 'select * from PRODUCT order by 2 DESC') #orders by SECOND attribute from (PROD_NO, NAME, COLOR)

# changing the order in which the attributes are returned
# order by the first attribute
dbGetQuery(mydb, 'select * from PRODUCT') #regular output
dbGetQuery(mydb, 'select NAME, PROD_NO, COLOR from PRODUCT
           order by 1 DESC') # now NAME is the first attribute

#  --------------------------------------------------------
# order by attribute that has the same value twice
dbGetQuery(mydb, 'select AGE, DEPT_NO from EMPLOYEE') # D1 occurs twice
dbGetQuery(mydb, 'select AGE, DEPT_NO from EMPLOYEE 
           order by 2 DESC')
# order both attributes
dbGetQuery(mydb, 'select AGE, DEPT_NO from EMPLOYEE order by 2 DESC, 1 DESC')

#  --------------------------------------------------------
## JOINS
# - used to combine two or more relations
# CASE 1: JOIN or INNER JOIN WITHOUT conditions return a Cartesian product
dbGetQuery(mydb, 'select * from CUSTOMER')
dbGetQuery(mydb, 'select * from SALES_ORDER')
dbGetQuery(mydb, 'select * from CUSTOMER JOIN SALES_ORDER')
dbGetQuery(mydb, 'select * from CUSTOMER INNER JOIN SALES_ORDER')

# CASE 2: JOIN or INNER JOIN WITH conditions
dbGetQuery(mydb, 'select * from CUSTOMER inner join SALES_ORDER
           where CUSTOMER.CUST_NO = SALES_ORDER.CUST_NO')
dbGetQuery(mydb, 'select * from CUSTOMER join SALES_ORDER
           where CUSTOMER.CUST_NO = SALES_ORDER.CUST_NO')
# ^^ combines tuples in 2 relations where specified attributes have the same value (INTERSECTION)

#  --------------------------------------------------------
## LEFT JOIN
# - returns all attributes from the lect relation, and the matched attributes from the right relation
dbGetQuery(mydb, 'select * from SALES_ORDER_LINE')
dbGetQuery(mydb, 'select * from PRODUCT')
dbGetQuery(mydb, 'select * from SALES_ORDER_LINE left join PRODUCT') # Cartesian product 5x5=25
dbGetQuery(mydb, 'select * from SALES_ORDER_LINE left join PRODUCT
           where SALES_ORDER_LINE.PROD_NO = PRODUCT.PROD_NO') 

# order of relations matter!!!!!
dbGetQuery(mydb, 'select * from PRODUCT left join SALES_ORDER_LINE 
           where SALES_ORDER_LINE.PROD_NO = PRODUCT.PROD_NO') # is more readable than ^^ (same thing, listed differently)

#  --------------------------------------------------------
## RIGHT JOINS
# - returns all attributes from the right relation, and the matched attributes from the left relation
dbGetQuery(mydb, 'select * from SALES_ORDER_LINE right join PRODUCT')
dbGetQuery(mydb, 'select * from SALES_ORDER_LINE right join PRODUCT
           where SALES_ORDER_LINE.PROD_NO = PRODUCT.PROD_NO')
dbGetQuery(mydb, 'select * from SALES_ORDER')
dbGetQuery(mydb, 'select * from INVOICES')
dbGetQuery(mydb, 'select invoices.QUANTITY , invoices.ORDER_No, sales_order.DATE
           from INVOICES right join SALES_ORDER
           on sales_order.ORDER_NO = invoices.ORDER_NO')

dbGetQuery(mydb, 'select invoices.QUANTITY, invoices.ORDER_NO, sales_order.DATE 
           from INVOICES left join SALES_ORDER
           on sales_order.ORDER_NO = invoices.ORDER_NO')

#  --------------------------------------------------------
## FULL OUTER JOIN
# - returns all attributes when there is a match in either left or right relation
dbGetQuery(mydb, 'select * from SALES_ORDER_LINE full outer join PRODUCT
           where sales_order_line.PROD_NO = product.PROD_NO')

#  --------------------------------------------------------
## NATURAL JOIN
# - chooses the join variable for us. (auto finds attributes to merge on)
dbGetQuery(mydb, 'select * from CUSTOMER')
dbGetQuery(mydb, 'select * from SALES_ORDER')
dbGetQuery(mydb, 'select * from CUSTOMER natural join SALES_ORDER')

# match the customer name to their order number
dbGetQuery(mydb, 'select * from SALES_ORDER')
dbGetQuery(mydb, 'select * from CUSTOMER')

dbGetQuery(mydb, 'select ORDER_NO, CUST_NO, NAME 
           from SALES_ORDER natural join CUSTOMER')

# when the attribute name is ambiguous?
dbGetQuery(mydb, 'select * from CUSTOMER natural join PRODUCT') #??????

#  --------------------------------------------------------
## INNER JOIN (or JOIN) and NATURAL JOIN compared
# SELECT (attributes)
# FROM R inner join S
#   where (attribute in R) = (attribute in S)
dbGetQuery(mydb, 'select * from SALES_ORDER_LINE')
dbGetQuery(mydb, 'select * from PRODUCT')

# inner join SALES_ORDER_LINE and PRODUCT on PROD_NO 
dbGetQuery(mydb, 'select * from SALES_ORDER_LINE inner join PRODUCT
           on product.PROD_NO = sales_order_line.PROD_NO
           where COLOR="BLUE"') 
dbGetQuery(mydb, 'select * from SALES_ORDER_LINE inner join PRODUCT
           where product.PROD_NO = sales_order_line.PROD_NO
           and COLOR="BLUE"')
# ^^^ output for both, all ORDER_NO with PROD_NO "p1" and all are PANTS are blue
#     according to the PRODUCT table

# compare with NATURAL JOIN. PROD_NO is returned only once
dbGetQuery(mydb, 'select * from SALES_ORDER_LINE natural join PRODUCT') # merged on PROD_NO

#  --------------------------------------------------------
## Using correlation names
dbGetQuery(mydb, 'select NAME from CUSTOMER')
dbGetQuery(mydb, 'select c.NAME from CUSTOMER c') # variable c for CUSTOMER
dbGetQuery(mydb, 'select c.name as random_ahh_names from CUSTOMER c')

# return PRODUCT NAME as LINE_NAME
dbGetQuery(mydb, 'select NAME from PRODUCT')
dbGetQuery(mydb, 'select p.NAME from PRODUCT p')
dbGetQuery(mydb, 'select p.NAME as LINE_NAME from PRODUCT p')









