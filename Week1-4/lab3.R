# Lab 3
data('CO2')

# 1) Create a histogram
View(CO2)
CO2$uptake
hist(CO2$uptake, col="orange", main="Hist of Co2 Uptake")

# 2) Create a pie chart
deaths <- c(738, 538, 158, 103, 93, 682)
cause <- c("Heart Diseases", "Cancer", "Stroke", "Pulmonary Diseases", 
          "Accidents", "Others")
pie(deaths, labels= cause,
    main="Deaths in 1995 and the cause of death(in thousands)")

# 3) Use a stem plot
x <- c(9,9,22,32,33,39,42,49,52,58,70)
stem(x, scale=2)
stem(x, scale = 4)
# e) Histograms do not preserve data because data can not be reconstructed
#    from them. Stem plots can reconstruct datasets


# 4) 
state.area
min(state.area)
max(state.area)
mean(state.area)
median(state.area)

diff <- max(state.area) - min(state.area)
diff

# 5) 
# a) ON MIDTERM (what happens when you set na.rm=FALSE vs na.rm=TRUE?)
vec <- c(2,3,3,3,4,2,5,NA,10)
mean(vec, na.rm=T)
mean(vec, na.rm=F)

#b) 
vec2 <- c(2,3,3,3,4,2,5,5,10)
install.packages("statip")
library(statip) 
mfv(vec2) #use to find the mode






