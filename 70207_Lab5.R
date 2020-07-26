################
# File: Lab5.R
# Author: Taeyong Park 
# Summary: Hypothesis testing
#################


##################################
# Population means
##################################

# Metropolitan Research, Inc. conducts surveys designed to evaluate a wide
# variety of products and services available to consumers.
# The data show the actual number of miles driven for 50 vehicles at the time
# of transmission failure.

auto = read.csv("Auto.csv")

## One-tailed Hypothesis testing at 0.05 significance level.

# Suppose the following hypotheses:
# H0: mu <= 70000
# Ha: mu > 70000  indicates a one-tailed and upper-tail test.
# Research (Alternative) hypohtesis: The population mean value of the miles driven at the time
# of transmission failure exceeds 70000. This will indicate no evidence of early transmission failture.
mu0 = 70000 # Value suggested by the null hypothesis.
sig.lev = 0.05

## Caluclate the test statistic for the test
sample.size = nrow(auto)
sample.mean = mean(auto$Miles)
sample.sd = sd(auto$Miles) 
test.stat = (sample.mean - mu0)/(sample.sd/sqrt(sample.size))

## Calculate the p-value and critical value
pvalue = pt(test.stat, df=sample.size-1, lower.tail = F) # upper tail tests consider the right tail of the distribution.
critical = qt(sig.lev, df=sample.size-1, lower.tail = F) # 0.05 represents the significance level.

pvalue # compared to what?
critical # compared to what?

## What is your conclusion?

# the pvalue should be compared with the significance level.
# the critical value should be compared with your test statistic.
# a pvalue smaller than the significance level can reject the null hypothesis.
# a test statistic greater than the critical value (in absolute term) can reject the null.


###############
# Exercise 1
###############
# Consider the Auto.csv data.
# Suppose the following hypotheses:
# H0: mu = 65000
# Ha: mu != 65000  

# Perform a significance test for the hypotheses at the 0.01 significance level.

# 1. p-value 
# 2. critical value 



########################################################
##### Population proportion 
########################################################

# One of the questions on a survey asked if today's children will be better off
# than their parents. A response Yes indicates that the adult surveyed think 
# today's children will be better off than their parents.

outlook = read.csv("ChildOutlook.csv")
View(outlook)
dim(outlook)


### Hypothesis testing
# Suppose the following hypotheses:
# H0: p = 0.2
# Ha: p != 0.2  indicates a two-tailed test.
# Perform a hypothesis test at significance level 0.01.

p0 = 0.2
sig.lev = 0.01

table(outlook$response)
## Caluclate the test statistic for the test
sample.size = nrow(outlook)
sample.proportion = 240/sample.size
standard.error = sqrt(p0*(1-p0)/sample.size)
test.stat = (sample.proportion-p0)/standard.error

## Calculate the p-value and critical value for the test
pvalue = 2*pnorm(test.stat, lower.tail = F) 
critical = qnorm(sig.lev/2, lower.tail = F) 

pvalue # compared to what?
critical # compared to what?



###############
# Exercise 2
###############
# Consider the ChildOutlook.csv data.
# Suppose the following hypotheses for the population proportion of 
# adults who DON'T think that today's children will be better off:
# H0: p <= 0.5
# Ha: p > 0.5 

# Perform a significance test for the hypotheses at the 0.05 significance level.

# 1. p-value 
# 2. critical value 

