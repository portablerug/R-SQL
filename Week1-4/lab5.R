# Worksheet 5

# 1) use which() to determine the index position of elements greater than 7
x <- c(3,7,7,8,9,10,1)
x
which(x>7)

# 2) use sub() to replace 'B' with 'A'
y <- c("PSTAT 10, STAT 5LS, PSTAT 120")
sub('A', 'B', y)

# 3) return "JUNE" "JULY" "AUGUST"
month.name[6:8] # returns "June" "July" "August"
toupper(month.name[6:8]) # returns "JUNE" "JULY" "AUGUST"

# 4) FACTORS
# a) create vector consisting of the following elements: B, B, D, E
vct <- c("B", "B", "D", "E")
vct

# b) Convert ito a factor
vect_1 <- factor(vct)
vect_1 # returns in alphabetical order and combines similar factors

# c) Show the levels
levels(vect_1)
nlevels(vect_1) # gives a number
levels(vect_1)[1] <- 

# d) Change the first level of the factor to A
sub(vect_1[1], 'A', vect_1)


sub(levels(vect_1)[1], 'A', vect_1)
levels(vect_1)



# 5) Construct pie chart to display data
slices <- c(738, 538, 158, 103, 93, 682)
diseases <- c("Heart diseases", "Cancer", "Stroke",
              "Pulmonary diseases" , "Accidents", "Others")
pie(slices, labels = diseases, 
    main = "Deaths in 1995 and the cause of death (in thousands)")


# What will be the output of the following code?
letters[1:3]
#   "a" "b" "c"


x <- c("Bob and Joe", "Bob and Bob")
sub("Bob", "Joe", x)

# example with gsub
string <- c("Strawberry", "Strawberry and Strawberry")
sub("Strawberry", "Vanilla", string)

gsub("Strawberry", "Vanilla", string)

# sub only replaces first instance in a string
# gsub replaces all 








