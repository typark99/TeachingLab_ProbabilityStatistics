####################################
# Exercise 2
####################################

data.air = read.csv("AirSurvey.csv")
colnames(data.air)
class(data.air$Rating)
table(data.air$Rating)


barplot(table(data.air$Rating), 
        ylim=c(0,25), col="tomato1", 
        xlab="Rating", ylab="Frequency",
        main="Customer Satisfaction Ratings for Flight Experience")



####################################
# Exercise 3
####################################

data.bigbang = read.csv("BigBangTheory.csv")

mean(data.bigbang$Viewers.Millions)
median(data.bigbang$Viewers.Millions)
sd(data.bigbang$Viewers.Millions)
var(data.bigbang$Viewers.Millions)

hist(data.bigbang$Viewers.Millions, xlab="Viewers (millions)", 
     main="Histogram for the Big Bang Theory Data",
     col = "steelblue4")



