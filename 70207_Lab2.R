################
# File: Lab2.R
# Author: Taeyong Park
# Summary: R basics and Data visualization
#################

### FOUR WINDOWS IN RStudio
# Editor: you type R code.
# Console: the output of your code is displayed.
# In the two other windows, you can see plots, a history of your commands, etc.

### Working directory
getwd()

### ASSIGNMENT OF VALUES 
# One important concept as you are programming is the notion of a variable.  
# The "<-" and "=" symbols are used to assign a variable to a value.

# Create a and b that take on the values of 78 and 8.
a <- 78
b = 8 
# Print the values.
print(a)
print(b)
# or simply
a
b
a; b

### BASIC FUNCTIONS
y <- 5
x <- 2*(y + 11)
y; x
addXY = x+y
addXandYorwhateveryouwant <- x + y
addXY
addXandYorwhateveryouwant
# You can overide previous code by assigning altenative values.
y = 3
x = (y-8) + 7
y; x
addXandY = x + y
addXandY


########################################################
# DATA STRUCTURES: vectors and dataframes
########################################################


##############
# VECTORS    #
##############

# Vectors are one-dimensional and allow you to store data.  
# You create vectors in R using the combine function, c().  
# You place the vector elements separated by a comma between the brackets. 

numeric_vector = c(1,2,3,4,5)
numeric_vector
character_vector = c("a", "b", "c", "d")
character_vector = c(a, b, c, d) # Why error?
character_vector

many_numeric_vector = c(1:100)
many_numeric_vector


## EXERCISE 1 ##
# Create a vector of your first name and last name, and name it myname_vector.
# Hint: your vector should have two elements.
#################################################
myname_vector = c("taeyong", "park")

# Let's check to see what kind of vectors we have.  
# You want to be attentive to the kind of data you are handling, 
# particularly if the data is stored as text or as numeric values.  

class(numeric_vector)
class(character_vector)
class(myname_vector)

# You can also add two numeric vectors together.  Let's see how that works.

vector_one = c(1,2,3)
vector_two = c(4,5,6)
vector_sum = vector_one + vector_two

# Other calculations
vector_mean = (vector_one + vector_two)/2
vector_div = vector_one / vector_two

# Now pull out one element from a vector.  
# We'll pull out the first element and the third element of vector_sum.

vector_sum[1]
vector_sum[3]
vector_sum[c(1,2)]



## EXERCISE 2 ##
# Pull out your last name from the myname_vector.
#################################################

myname_vector[2]



##############
# DATAFRAMES #
##############

####################################
# 1. Qualitative (categorical) data
####################################

## Now let's load the SoftDrink.csv data.

library(foreign) # This pacakge makes read.csv() function available.
data.soft = read.csv("SoftDrink.csv")

# Take a look the data.
View(data.soft)
# You can also get its variable names.
colnames(data.soft)

## Let's take a look the Brand.Purchased variable closely.

# Type of data
class(data.soft$Brand.Purchased) # By putting "$", you can call variables.
class(data.soft) # Without it, you call data.

# What categories?
table(data.soft$Brand.Purchased)
# table() function uses the cross-classifying factors to build a contingency table of the counts at each combination of factor levels.

# mean, median?
mean(data.soft$Brand.Purchased)
median(data.soft$Brand.Purchased)


## Delve into further the data structure
dim(data.soft) # dimension: 50 rows and 1 column

# You can call a specific row or column
data.soft[,1]
data.soft[2,]

# You can also call a specific observation
data.soft[4,1]
data.soft$Brand.Purchased[4]

data.soft[7,1]
data.soft$Brand.Purchased[7]



### Let's plot the data

# Want to describe the data using a bar plot?
# Google "bar plot in r"

# You should now know that there is a function barplot().
# To learn more about this function you can type either
# "?barplot" or "help(barplot)".

# Of the many arguments, you must define the input for the height argument.

barplot(data.soft$Brand.Purchased)
# Read the error message. How would you fix it?

# You want the frequency of each category.
table(data.soft$Brand.Purchased)
barplot(table(data.soft$Brand.Purchased))

# You can explore further.

# First of all, you may want to expand the y-axis.
barplot(table(data.soft$Brand.Purchased), ylim=c(0,20))
# Color the bars.
barplot(table(data.soft$Brand.Purchased), ylim=c(0,20), 
        col="blue")
# Even more colors.
colors()
barplot(table(data.soft$Brand.Purchased), ylim=c(0,20), 
        col="salmon")
barplot(table(data.soft$Brand.Purchased), ylim=c(0,20), 
        col="darkred")
# Finally, labels and title.
barplot(table(data.soft$Brand.Purchased), 
        ylim=c(0,20), col="darkred", 
        xlab="Soft Drink", ylab="Frequency",
        main="Soft Drink Purchases")


####################################
# Exercise 3
####################################

# Import the AirSurvey.csv data into R. Take a look the data and answer the following questions.

# AirSurvey.csv data: After completing a flight, customers receive an email asking to rate 
# a variety of factors such as the reservation process, luggage policy, service by flight attendants, ect
# E, V, G, F, P are the five categories used to record customer ratings.

# Make a bar plot for the Rating variable, and label the x-axis and y-axis appropriately.



####################################
# 2. Quantitative data
####################################

data.audit = read.csv("Audit.csv")

# Variable names?
colnames(data.audit)
View(data.audit)
# Type of data (variable)?
class(data.audit$Audit.Time)

# "numeric" or "integer" indicates that the variable is quantitative.

### Summarize with numerical measures.
# Location measures
mean(data.audit$Audit.Time)
median(data.audit$Audit.Time)
quantile(data.audit$Audit.Time)

# Variability measures
sd(data.audit$Audit.Time)
var(data.audit$Audit.Time)
range(data.audit$Audit.Time)


# You can draw a histogram to summarize the data graphically.

# To find a function for a histogram, google "histogram in r". 

# Now, you know that there is a function hist() for making histograms.
?hist

# The first argument must be numeric (a vector of values).
hist(data.audit$Audit.Time) # The number of bins are calculated by a default formula. 
# But, you may specify break points manually.
hist(data.audit$Audit.Time, breaks = c(5,15,25,35))
hist(data.audit$Audit.Time, breaks = 10:35)

# Additionally, explore with labels, title, colors, ect.
hist(data.audit$Audit.Time, xlab="Audit Time (Days)", 
     main="Histogram for the Audit Time Data",
     col = "mediumaquamarine")


# A boxplot function is also available.
boxplot(data.audit$Audit.Time)


####################################
# Exercise 4
####################################

# Import the BigBangTheory.csv data into R. Take a look the data and answer the following questions.

# These data show the number of viewers in millions for the first 21 
# episodes for the 2011-12 season.

# 1. Calculate mean, median, std. deviation, variance for the Viewers.Millions variable.
# 2. Make a histogram for the variable, and label the x-axis and y-axis appropriately.

