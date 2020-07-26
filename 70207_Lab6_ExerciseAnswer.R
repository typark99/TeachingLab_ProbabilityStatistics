############################################################################
# Exercise 1
############################################################################
data.exam = read.csv("ExamScores.csv")
colnames(data.exam)
which(is.na(data.exam$Center.A)) # Check if there is missing data.
which(is.na(data.exam$Center.B)) # Check if there is missing data.

size.sample1 = length(na.omit(data.exam$Center.A)) # Remove missing data
mean.sample1 = mean(data.exam$Center.A[1:30])
sd.sample1 = sd(data.exam$Center.A[1:30])

size.sample2 = length(data.exam$Center.B)
mean.sample2 = mean(data.exam$Center.B)
sd.sample2 = sd(data.exam$Center.B)

mean.diff = mean.sample1 - mean.sample2
std.error = sqrt(sd.pop1^2/size.sample1 + sd.pop2^2/size.sample2)


# Question 1. Write code for the formula for degrees of freedom in the lecture note.

df.numerator = (sd.sample1^2/size.sample1+sd.sample1^2/size.sample1)^2
df.denominator = (1/(size.sample1-1))*(sd.sample1^2/size.sample1)^2 + (1/(size.sample2-1))*(sd.sample2^2/size.sample2)^2
df = df.numerator/df.denominator
  
  
# Question 2. Using the degrees of freedom you computed, perform a hypothesis test 
#    without the assumption that sd.pop is known.
# Hypothesis testing
test.stat = mean.diff/std.error
pvalue = 2*pt(test.stat, df=df, lower.tail = F)
critical.value = qt(alpha.half.95, df=df, lower.tail = F)


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

prop.sample1 = 39/68
prop.sample2 = 51/132

prop.diff = prop.sample1 - prop.sample2
std.error.ci = sqrt((prop.sample1*(1-prop.sample1))/68 + (prop.sample2*(1-prop.sample2))/132) 

alpha.half.99 = (1-.99)/2
z.score.99 = qnorm(alpha.half.99, lower.tail = F) 
lower.99 = prop.diff-z.score.99*std.error.ci 
upper.99 = prop.diff+z.score.99*std.error.ci 
ci.99 = c(lower.99, upper.99)
ci.99


#### Question 2 ####
# Now, use the prop.test() function for the comparison.
prop.test(c(39,51), c(68,132), conf.level=0.99, correct=F)
