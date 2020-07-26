#####################################
# File: Lab8.R
# Author: Taeyong Park 
# Summary: Comparing Three or More Proportions
######################################

######################
#
# Population Proportions
#
######################

# Ice-cream preferecne by gender
ice = read.csv("IceCreamPreference.csv")
View(ice)

# H0: The three population proportions of preferred flavor are the same between men and women.


# To use the chisq.test() function, first create a contingency table.
contingency.ice = table(ice$Preference, ice$Gender)
chisq.test(contingency.ice)

# Critical value
qchisq(0.05, df=2, lower.tail = F)



############
# Exercise 1
############
# Import AutoLoyalty.csv file.
# Test if the onwers of Impala; Fusion; Accord
# have the same likelihood of repurchasing their car.


############
# Exercise 2
############
# 1. At 0.01 level, test for the difference between the likelihood of repurshasing for Impala and that for Fusion
# 2. At 0.01 level, test for the difference between the likelihood of repurshasing for Impala and that for Accord
# 3. At 0.01 level, test for the difference between the likelihood of repurshasing for Fusion and that for Accord
