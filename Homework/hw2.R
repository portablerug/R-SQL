# hw2
HEC <- c(32, 11, 10, 3, 53, 50, 25, 15, 3, 30, 5, 8)

# Construct the matrix.
HairEyeColor <- matrix(HEC, nrow=3, ncol=4, byrow=TRUE) # fill by row
HairEyeColor

#Add appropriate row names and column names
rownames(HairEyeColor) <- c("Black Hair", "Brown Hair", "Blond Hair")
colnames(HairEyeColor) <- c("Brown Eyes", "Blue Eyes", "Hazel Eyes",
                            "Green Eyes")
HairEyeColor
# Sum rows, sums columns
HairEyeColor <- addmargins(HairEyeColor)
HairEyeColor

rm(HairEyeColor)
View(HairEyeColor)

sum(HairEyeColor[,,1])
sum(HairEyeColor[,,2])


