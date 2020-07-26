################
# File: Lab6.R
# Author: Taeyong Park 
# Summary: Comparing Two Groups
#################

###################################
# 
# Population means 
#
#####################################

#####################################
# Exam scores
#####################################

# A study to evaluate differences in education quality between two training centers. 

data.exam = read.csv("ExamScores.csv")
colnames(data.exam)
which(is.na(data.exam$Center.A)) # Check if there is missing data.
which(is.na(data.exam$Center.B)) # Check if there is missing data.

size.sample1 = length(na.omit(data.exam$Center.A)) # Remove missing data
mean.sample1 = mean(data.exam$Center.A[1:30])
sd.sample1 = sd(data.exam$Center.A[1:30])
sd.pop1 = 10

size.sample2 = length(data.exam$Center.B)
mean.sample2 = mean(data.exam$Center.B)
sd.sample2 = sd(data.exam$Center.B)
sd.pop2 = 10

mean.diff = mean.sample1 - mean.sample2
std.error = sqrt(sd.pop1^2/size.sample1 + sd.pop2^2/size.sample2)


# 95% CI
alpha.half.95 = (1-.95)/2
z.score.95 = qnorm(alpha.half.95, lower.tail = F)

lower.95 = mean.diff-z.score.95*std.error 
upper.95 = mean.diff+z.score.95*std.error 
ci.95 = c(lower.95, upper.95)


# Hypothesis testing
test.stat = mean.diff/std.error
pvalue = 2*pnorm(test.stat, lower.tail = F)
critical.value = qnorm(alpha.half.95, lower.tail = F)


## What if sd.pop is unknown?

############################################################################
# Exercise 1
############################################################################

# Question 1. Write code for the formula for degrees of freedom in the lecture note.
# Question 2. Using the degrees of freedom you computed, perform a hypothesis test 
#    without the assumption that sd.pop is known.

# For Question 1: 
df.numerator 
# [Hint] 
df.denominator = (1/(size.sample1-1))*(sd.sample1^2/size.sample1)^2 + (1/(size.sample2-1))*(sd.sample2^2/size.sample2)^2
df
  
# Question 2

  
  

# Now, use t.test()
t.test(data.exam$Center.A, data.exam$Center.B)
t.test(data.exam$Center.A, data.exam$Center.B, conf.level = .99)



###################################
# 
# Population proportions 
#
###################################

#####################################
# Example: Tax Preparation
#####################################

# A tax preparation firm assesses the quality of work at two of its regional offices
# by comparing the proportion of erroneous tax returns at each office.
# The firm sampled 250 and 300 cases from the two offices, respectively.
# "Yes" in the TaxPrep.csv data indicates a errorneous return.
# "No" in the data refers to a non-erroenous return.

# Import the TaxPrep.csv dataset, and take a look. 
data.tax = read.csv("TaxPrep.csv")
# Above all, you must check whether the data are categorical or numeric.
View(data.tax)
# If the data are categorical, you should calculate proportions.

# Construct 95% confidence interval for the proportion difference.

# First, you need to specify sample proportions. 
# Use the table() function to count the number for each category.
table(data.tax$Office1) # 50 in the left of 215 informs you that there are 50 missing values. 
table(data.tax$Office2) 

prop.sample1 = 35/250
prop.sample2 = 27/300

prop.diff = prop.sample1 - prop.sample2
std.error.ci = sqrt((prop.sample1*(1-prop.sample1))/250 + (prop.sample2*(1-prop.sample2))/300) 

alpha.half.95 = (1-.95)/2
z.score.95 = qnorm(alpha.half.95, lower.tail = F) 
lower.95 = prop.diff-z.score.95*std.error.ci 
upper.95 = prop.diff+z.score.95*std.error.ci 
ci.95 = c(lower.95, upper.95)
ci.95

# Conduct a hypothesis test for the proportion difference
# at the 0.05 significance level.
pooled.est.pi = (250*prop.sample1 + 300*prop.sample2)/(250+300)
std.error.ht = sqrt((pooled.est.pi*(1-pooled.est.pi))*(1/250 + 1/300)) 

test.stat = prop.diff/std.error.ht

pvalue = 2*pnorm(test.stat, lower.tail = F)


#### R function for comparing proportions? ####
prop.test(c(35,27), c(250,300), conf.level=0.95, correct=F)
# The first argument: a vector of counts for a category (Yes or No).
# The second argument: a vector of sample sizes.
# The order matters.
# The correct argument is for the Yates continuity correction for small samples.
# It must be FALSE for large smaples (n>10).

# The output returns a Chi-squared statistic.
# prop.test() relies on the chi-squared distribution. But when it considers two groups,
# its Chi-squared statistic is identical to the square of z statistic. 
# And the p-value is also identical to the z test for two group comparison. 
# In other words, the substantive conclusion from prop.test() is the same as
# that from a z-test when two-group comparison is considered.


#####################
# Exercise 2
#####################

# Import the IceCreamPreference.csv data.
# The data are summarized based on the combination of icecream preference
# and gender for the individual respondent.

data.ice = read.csv("IceCreamPreference.csv")
colnames(data.ice)

table(data.ice$Preference, data.ice$Gender) 

#### Question 1 ####
# Construct 99% confidence interval for the difference in the proportions of preferring Strawberry flavor by gender.

#### Question 2 ####
# Now, use the prop.test() function for the comparison.
