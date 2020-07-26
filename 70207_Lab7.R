#####################################
# File: Lab7.R
# Author: Taeyong Park 
# Summary: Comparing Three or More Means
######################################

#####################
#
# Population Means
#
#####################


# Chemitech compares three methods used to produce filtration systems.
# To this end, Chemitech measures the number of filtration systems produced per week.

# H0: The three population means are the same.

# Import the data.
chemitech = read.csv("Chemitech.csv")
colnames(chemitech)

# See the data
View(chemitech)

# Because the three groups (variables) are separate,
# use the stack function to transform the data structure.
# The aov() function requires stacked data.
stacked.chemitech = stack(chemitech)
View(stacked.chemitech)

# Use the aov function to run an Anova model.
anova.chemitech = aov(values ~ ind, data=stacked.chemitech)
summary(anova.chemitech)
# In the output, 260 is the Between-groups estimate
# and 28.33 is the Within-groups estimate.


######################
# Exercise 1
######################

# The Consumer Reports Restaurant Customer Satisfaction Survey
# studies full-service restraurant chanis. 
# One of the variables in the study is meal price, the average amount paid per
# person for dinner and drinks, minus the tip. 
# The GrandStrand.csv data show the meal prices obtained from 24 restaurants
# in the Grand Strand section in a city of the US.
# Use .05 significance level to test if there is a significant
# difference among the mean meal price for the three types of restraurants.

# Answer the following questions:

# 1. What is the between-groups estimate of population variance?
# 2. What is the within-groups estimate of population variance?
# 3. What is the F statistic?
# 4. What is the p value?
# 5. What is you conclusion about the difference among the mean meal prices for the three types of restraurants?


######################
# Exercise 2
######################
# 1. Test for the mean difference between the price for Italian and that for Seafood
# 2. Test for the mean difference between the price for Italian and that for Steakhouse
# 3. Test for the mean difference between the price for Seafood and that for Steakhouse
