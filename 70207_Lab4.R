################
# File: Lab4.R
# Author: Taeyong Park 
# Summary:  Confidence interval
#################


###################################################
## Confidence interval for population means
###################################################

# The International Air Transport Association surveys business travelers 
# to develop quality ratings for transatlantic gateway airports. 
# The maximum possible rating is 10. Suppose a simple random sample of 50
# business travelers is selected and each traveler is asked to provide a rating
# for the Miami International Airport. 

# Import the miami.csv data file into R, and take a look.
data.miami = read.csv("miami.csv")
View(data.miami)
colnames(data.miami)

# Develop a 95% confidence interval estimate of 
# the population mean rating for the airport.

# sample size?
nrow(data.miami) # The number of rows
# dimension
dim(data.miami) # The first value is the number of rows; second for column


# Now, recall the formula for computing a confidence interval.
# We need the sample mean, the sample sd, 
# and the t-score for the confidence level.
sample.size = nrow(data.miami)
sample.mean = mean(data.miami$rating)
sample.sd = sd(data.miami$rating)
alpha.half.95 = (1-0.95)/2
t.score.95 = qt(alpha.half.95, df=sample.size-1, lower.tail=F)

# Plug in the estimates and t-score to the formula
lower.bound.95t = sample.mean - t.score.95*sample.sd/sqrt(sample.size)
upper.bound.95t = sample.mean + t.score.95*sample.sd/sqrt(sample.size)
miami.ci.95t = c(lower.bound.95t, upper.bound.95t)
miami.ci.95t


# What if we knew the population standard deviation?
# Suppose population sd is known to be 2. 
pop.sd = 2
z.score.95 = qnorm(alpha.half.95, lower.tail=F)

lower.bound.95z = sample.mean - z.score.95*pop.sd/sqrt(sample.size)
upper.bound.95z = sample.mean + z.score.95*pop.sd/sqrt(sample.size)
miami.ci.95z = c(lower.bound.95z, upper.bound.95z)
miami.ci.95z


###########################
##### Exercise 1
###########################
# Data were collected on the amount spent by 64 customers for lunch at major
# Houston restraurants. 
# Import the houston.csv data file into R

# 1. Develop a 95% confidence interval estimate of the mean amount spent for lunch.
# 2. Develop a 99% confidence interval estimate of the mean amount spent for lunch



###################################################
## Confidence interval for population proportions
###################################################

# One of the questions on a survey asked if today's children will be better off
# than their parents. A response Yes indicates that the adult surveyed think 
# today's children will be better off than their parents.

outlook = read.csv("ChildOutlook.csv")
View(outlook)
dim(outlook)


# Build a 95% confidence interval for the proportion of adults 
# who think that today's children will be btter off. 

table(outlook$response)


sample.size = nrow(outlook)
sample.proportion = 240/sample.size
standard.error = sqrt(sample.proportion*(1-sample.proportion)/sample.size)
alpha.half.95 = (1-0.95)/2
z.score.95 = qnorm(alpha.half.95, lower.tail = F)

lower.bound.95 = sample.proportion-z.score.95*standard.error
upper.bound.95 = sample.proportion+z.score.95*standard.error
outlook.ci.95 = c(lower.bound.95, upper.bound.95)
outlook.ci.95


########################################################
##### Exercise 2
########################################################
# Build a 99% confidence interval for the proportion of adults 
# who DON'T think that today's childeren will be better off.

