#####################
#
# Population Means
#
#####################

############
# Exercise 1
############

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

grand = read.csv("GrandStrand.csv")

colnames(grand)
View(grand)

stacked.grand = stack(grand)
View(stacked.grand)
anova.grand = aov(values ~ ind, data=stacked.grand)
summary(anova.grand)

# between-groups estimate: 104
# within-groups estimate: 14.19
# F stat = 104/14.19 = 7.329
# p-value = 0.00385
# We found evidence supporting that the mean meal prices for the three types of restraurants are not the same.

############
# Exercise 2
############

# 1. Test for the mean difference between the price for Italian and that for Seafood
t.test(grand$Italian, grand$Seafood, conf.level = .95)


# 2. Test for the mean difference between the price for Italian and that for Steakhouse
t.test(grand$Italian, grand$Steakhouse, conf.level = .95)

# 3. Test for the mean difference between the price for Seafood and that for Steakhouse
t.test(grand$Seafood, grand$Steakhouse, conf.level = .95)
