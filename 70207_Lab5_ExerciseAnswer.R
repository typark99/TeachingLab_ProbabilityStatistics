###############
# Exercise 1
###############
# Suppose the following hypotheses:
# H0: mu = 65000
# Ha: mu != 65000  

# Perform a significance test for the hypotheses at the 0.01 significance level.

auto = read.csv("Auto.csv")
mu0 = 65000
sig.lev = 0.01

## Caluclate the test statistic for the test
sample.size = nrow(auto)
sample.mean = mean(auto$Miles)
sample.sd = sd(auto$Miles) 
test.stat = (sample.mean - mu0)/(sample.sd/sqrt(sample.size))

## Calculate the p-value and critical value
pvalue = 2*pt(test.stat, df=sample.size-1, lower.tail = F) 
critical = qt(sig.lev/2, df=sample.size-1, lower.tail = F) 

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

outlook = read.csv("ChildOutlook.csv")
table(outlook)
p0 = 0.5
sig.level = 0.05

## Caluclate the test statistic for the test
sample.size = nrow(outlook)
sample.proportion = 530/sample.size
standard.error = sqrt(p0*(1-p0)/sample.size)
test.stat = (sample.proportion-p0)/standard.error

## Calculate the p-value and critical value for the test
pvalue = pnorm(test.stat, lower.tail = F) # given the negative value of the deviation and the two-tailed test.
critical = qnorm(sig.level, lower.tail = F) # 0.025 represents an half of the significance level.

pvalue # compared to what?
critical # compared to what?
