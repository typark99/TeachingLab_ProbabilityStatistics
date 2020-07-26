###########################
##### Exercise 1
###########################
# Data were collected on the amount spent by 64 customers for lunch at a major
# Houston restraurants. 
# Import the houston.csv data file into R

# 1. Develop a 95% confidence interval estimate of the mean amount spent for lunch.
# 2. Develop a 99% confidence interval estimate of the mean amount spent for lunch

data.houston = read.csv("houston.csv")

sample.mean = mean(data.houston$Amount)
sample.size = nrow(data.houston)
sample.sd = sd(data.houston$Amount)
alpha.half.95 = (1-0.95)/2
t.score.95 = qt(alpha.half.95, df=sample.size-1, lower.tail=F)

lower.bound.95 = sample.mean - t.score.95*sample.sd/sqrt(sample.size)
upper.bound.95 = sample.mean + t.score.95*sample.sd/sqrt(sample.size)
houston.ci.95 = c(lower.bound.95, upper.bound.95)
houston.ci.95


alpha.half.99 = (1-0.99)/2
t.score.99 = qt(alpha.half.99, df=sample.size-1, lower.tail=F)

lower.bound.99t = sample.mean - t.score.99*sample.sd/sqrt(sample.size)
upper.bound.99t = sample.mean + t.score.99*sample.sd/sqrt(sample.size)
houston.ci.99t = c(lower.bound.99t, upper.bound.99t)
houston.ci.99t


########################################################
##### Exercise 2
########################################################
# Build a 99% confidence interval for the proportion of adults 
# who DON'T think that today's childeren will be better off. 
sample.size = nrow(outlook)
sample.proportion = 530/sample.size
standard.error = sqrt(sample.proportion*(1-sample.proportion)/sample.size)
alpha.half.99 = (1-0.99)/2
z.score.99 = qnorm(alpha.half.99, lower.tail = F)

lower.bound.99 = sample.proportion-z.score.99*standard.error
upper.bound.99 = sample.proportion+z.score.99*standard.error
outlook.ci.99 = c(lower.bound.99, upper.bound.99)
outlook.ci.99