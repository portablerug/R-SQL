#LAB4
#a)
elm <- c(1:12)
nw_mtrx <- matrix(elm, nrow=4, ncol=3)
nw_mtrx

#b) 
rnames <- c("a","b","c","d")
cnames <- c("x","y","z")
nw_mtrx <- matrix(elm, nrow=4, ncol=3,
                  byrow=TRUE, dimnames=list(rnames,cnames))
nw_mtrx

#c) Extract the elements in column one. COMMA BEFORE #
nw_mtrx[,1]

#d)
nw_mtrx1 <- nw_mtrx["c", "x"]
print(nw_mtrx)
print(nw_mtrx1)

#--------------------------------------------------------------------
#Problem 2
a <- c(1,2,3)
b <- c(6,7,8)

nw_mthd <- cbind(a,b)
nw_mthd

#Check if its a matrix
is.matrix(nw_mthd)
#--------------------------------------------------------------------
#Problem 3
mat <- matrix(NA, nrow=2, ncol=3)
mat
matrix(nrow=2, ncol=3)


#--------------------------------------------------------------------
#Problem 4
v1 <- c(1,3,4,5)
v2 <- c(10,11,12,13,14,15)
arr <- array(c(v1,v2), dim = c(3,3,2))
arr

#--------------------------------------------------------------------
#Question 5
v <- c(10, 20, 30, 20, 20, 25, 9, 26)
max(v)
min(v)

#--------------------------------------------------------------------
#Question 6
nw_lst <- list("PSTAT 10", 2024, 300, "ILP 1202")
nw_lst

#Replacing elements
nw_lst[[4]] <- "ILP 1203"
nw_lst

