# Lecture 16 - Creating New Relations
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

getwd()
#  --------------------------------------------------------------------------------
## Create a new relation from a query result
dbGetQuery(mydb, 'select * from CUSTOMER')

alex_pref <- dbGetQuery(mydb, 'select c.CUST_NO, c.NAME as Customer_Name,
                    p.NAME AS Product_Name, color as Required_Color
                    from CUSTOMER c, SALES_ORDER_LINE o, SALES_ORDER s, PRODUCT p
                    where c.CUST_NO = "C1"
                    and c.CUST_NO = s.CUST_NO
                    and s.ORDER_NO = o.ORDER_NO
                    and o.PROD_NO = p.PROD_NO')
# Does ALEX_PREFERENCES exists as a relation in the database?
dbListTables(mydb)

# Is ALEX_PREFERENCES a data frame?
is.data.frame(alex_pref)

# Add ALEX_PREFERENCES to the database. Creates a relation, Save.
dbWriteTable(mydb, "ALEX_PREFERENCES", alex_pref, overwrite=TRUE)

# Check the database again
dbListTables(mydb)

#  --------------------------------------------------------------------------------
## add tuples to existing relation dBSendStatement() and keywords INSTERT INTO
# - no select
dbGetQuery(mydb, 'select * from PRODUCT')

# want to add tuple ("p6" , "SOCKS" , "GREEN") to the relation
dbSendStatement(mydb, 'insert into PRODUCT
                values ("p6", "SOCKS", "GREEN")') # does not return anything

dbReadTable(mydb, "PRODUCT") # p6 is added (warning message can be ignored)

# To delete a tuple
dbSendStatement(mydb, 'delete from PRODUCT where PROD_NO = "p6"')

# ex:
dbSendStatement(mydb, 'insert into CUSTOMER
                values ("c7", "Andrea" , "Horse")')

dbGetQuery(mydb, 'select * from CUSTOMER')
dbSendStatement(mydb, 'delete from CUSTOMER where ADDRESS = "Mesa"')

#  --------------------------------------------------------------------------------
## Creating new relations SOFT_TOYS and TOY_SUPPLIER
dbListTables(mydb)

# SEND QUERY not get query (submits and executes an SQL query)
dbSendQuery(mydb, 'create table SOFT_TOYS
            (Toy_ID TEXT NOT NULL PRIMARY KEY,
            Toy_Name TEXT,
            Color TEXT,
            Price REAL,
              CHECK (length("Toy_ID") <= 4) )') # no rows fetch or tuples changed

# enable Foreign Key support by using the following
## PRAGMA (pragmatic info)
dbSendQuery(mydb, 'PRAGMA foreign_keys = ON') # allow us to specify a foreign key

## Create new table
dbSendQuery(mydb, 'create table TOY_SUPPLIER
            (Supplier_ID TEXT NOT NULL PRIMARY KEY,
            Supplier_Name TEXT,
            Toy_ID TEXT,
            FOREIGN KEY (TOY_ID) references SOFT_TOYS)')

#  --------------------------------------------------------------------------------
## PRAGMA command is specific to SQLite
dbGetQuery(mydb, 'PRAGMA foreign_key_list("TOY_SUPPLIER")')
dbGetQuery(mydb, 'PRAGMA table_info("SOFT_TOYS")')
dbGetQuery(mydb, 'PRAGMA table_info("TOY_SUPPLIER")')

#  --------------------------------------------------------------------------------
## Adding data to SOFT_TOYS
dbGetQuery(mydb, 'select * from SOFT_TOYS') # no tuples
dbSendStatement(mydb, 'insert into SOFT_TOYS
                values(007, "BEAR" , "BLUE", 5.99)')

# add data to TOY_SUPPLIER
dbSendStatement(mydb, 'insert into TOY_SUPPLIER
                values ("101" , "Macy",007)') 

# query SOFT_TOYS
dbGetQuery(mydb, 'select * from SOFT_TOYS')
dbGetQuery(mydb, 'select * from TOY_SUPPLIER')
dbGetQuery(mydb, 'select color from SOFT_TOYS') # attribute name not case-sensitive

#  --------------------------------------------------------------------------------
## Keeping DATABASE neat and tidy
# remove unwanted relations
dbRemoveTable(mydb, "iris")
dbListTables(mydb) # gone

#  --------------------------------------------------------------------------------
## Large Relations
# - we may not want to view all tuples
#  - dbSendQuery() : submits and executes SQL, results are not returned
#  - dbFetch() : fetch the next n tuples from the result set and return them as a data frame.
#  - dbGetRowCount() : return total number of rows fetched
#  - dbClearResult(): Failure to clear the result set leads to a warning when the connection is closed.
#                      Use with very large result sets

# add 'mtcars' to database
dbWriteTable(mydb, "mtcars", mtcars, overwrite=T)
result_in_batches <- dbSendQuery(mydb, 'select mpg from mtcars')

# show only first 10 results
dbFetch(result_in_batches, n=10)

# call dbFetch() again from the next 10 rows and so on
dbFetch(result_in_batches, n=10)

# tracking the results
dbGetRowCount(result_in_batches)
dbClearResult(result_in_batches) # finished 

#  --------------------------------------------------------------------------------
## Nested Selects
# find the names of employees who are older than all employees in department D1
dbGetQuery(mydb, 'select * from EMPLOYEE')

# find max age of employees working in D1
dbGetQuery(mydb, 'select MAX(AGE), DEPT_NO from EMPLOYEE
           where DEPT_NO="D1"')
dbGetQuery(mydb, 'SELECT MAX(AGE) FROM EMPLOYEE WHERE DEPT_NO = "D1"') # doesnt give DEPT_NO

# nested statement instead
dbGetQuery(mydb, 'select NAME, EMP_NO from EMPLOYEE
           where age > 
           (select MAX(AGE) from EMPLOYEE where DEPT_NO = "D1")') 
# ^^ gives ages that are GREATER than employees from DEPARTMENT 1 


#  --------------------------------------------------------------------------------
## views
#  - virtual relation, doesn't contain any data and just represents a realtion
#  - created using CREATE VIEW <view name> AS
#                  select

# create and query a view
dbSendStatement(mydb, 'create view firstview as
                select NAME from PRODUCT')

dbGetQuery(mydb, 'select * from firstview')
dbSendStatement(mydb, 'drop view firstview')


#  --------------------------------------------------------------------------------
## querying part of a relation
# suppose we want to TEMPORARILY exclude ALEX from all queries

dbGetQuery(mydb, 'select * from CUSTOMER')

del_alex <- dbSendStatement(mydb, 'delete from CUSTOMER
                            where NAME="ALEX"')
dbGetRowsAffected(del_alex)
# look at relation CUSOTMER
# CUSOTMER reamins unchanged but when we query customer
dbWriteTable(mydb, "CUSTOMER" , CUSTOMER, overwrite=TRUE)
dbGetQuery(mydb, 'select * from CUSTOMER')

dbDisconnect(mydb)




x <- c(4,6,5,7,10,9,4,15)
c(4,6,5,7,10,9,4,15) < 7

y <-c(1,2,3,4,5,65,67,90) 

x > y
y > x

p <- c (3, 5, 6, 9, 9)
q <- c (3, 3, 3)
p+q


