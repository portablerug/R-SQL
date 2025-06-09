# Worksheet 16
library(DBI)
library(RSQLite)
mydb <- dbConnect(RSQLite::SQLite(), "PSTAT10db.sqlite")

#  --------------------------------------------------------------------------------
# a) Add the tuple ‘D4, COMPLAINTS, E3’ to the relation ‘DEPARTMENT’
dbGetQuery(mydb, 'select * from DEPARTMENT')
dbSendStatement(mydb, 'insert into DEPARTMENT
                values ("D4", "Complaints", "E3")') 

# also works, 
dbSendQuery(mydb, 'insert into DEPARTMENT
            values ("D4", "Complaints", "E3")') 

# check tuple was added
nw_dept <- dbGetQuery(mydb, 'select * from department')
nw_dept

# b) Create a new department relation, called NEW_DEPARTMENT that 
#    includes the tuple added in a)

dbWriteTable(mydb, "NEW_DEPARTMENT", NEW_DEPARTMENT) # name then dataframe name

# c) check NEW_DEPARTMENT exists in your database
dbListTables(mydb)

# d) Delete NEW_DEPARTMENT
dbRemoveTable(mydb, "NEW_DEPARTMENT")

# e) Check that NEW_DEPARTMENT has been deleted
dbListTables(mydb)

#  --------------------------------------------------------------------------------
## 2) Add dataset airquality to your database
#     (find in the datasets package)

dbWriteTable(mydb, "airquality", airquality)

# a) Return ozone in batches of 10
ozone_batch <- dbSendQuery(mydb, 'select Ozone from airquality')

# first 10 rows
dbFetch(ozone_batch, n=10) # fetching 10 more will start from 10-20 (remembers)

# b) keep track of how many batches of 10 I have ran
dbGetRowCount(ozone_batch) # 20

# c) Close database connection
dbDisconnect(mydb)

#  --------------------------------------------------------------------------------

# should expect
dbSendQuery(db_name, 'insert into DOCTOR
            values ("500", "Jones", "SAINTS")')

# dbExecute() is the same as dbSendStatement to add tuples to a relation

# b) 
## DOCTOR_ID is the primary key, accoridng to entity integrity rule, it CANNOT BE NULL


