######################
#
# Population Proportions
#
######################

############
# Exercise 1
############
# Import AutoLoyalty.csv file.
# Test if the onwers of Impala; Fusion; Accord
# have the same degree of loyalty.
loyalty = read.csv("AutoLoyalty.csv")

contingency.loyalty = table(loyalty$Model, loyalty$Likely.Purchase)
chisq.test(contingency.loyalty)

############
# Exercise 2
############
# 1. At 0.01 level, test for the difference between the likelihood of repurshasing for Impala and that for Fusion
table(loyalty$Model, loyalty$Likely.Purchase)

prop.sample1 = 69/(56+69)
prop.sample2 = 120/(80+120)

prop.diff = prop.sample1 - prop.sample2
std.error.ci = sqrt((prop.sample1*(1-prop.sample1))/(56+69) + (prop.sample2*(1-prop.sample2))/(80+120)) 

alpha.half.99 = (1-.99)/2
z.score.99 = qnorm(alpha.half.99, lower.tail = F) 
lower.99 = prop.diff-z.score.99*std.error.ci 
upper.99 = prop.diff+z.score.99*std.error.ci 
ci.99 = c(lower.99, upper.99)
ci.99

pooled.est.p = ((56+69)*prop.sample1 + (80+120)*prop.sample2)/((56+69)+(80+120))
std.error.ht = sqrt((pooled.est.p*(1-pooled.est.p))*(1/(56+69) + 1/(80+120))) 

test.stat = prop.diff/std.error.ht
pvalue = 2*pnorm(test.stat, lower.tail = T)


### YOU CAN also use the prop.test function
# Now, use one-shot R code for the comparison.
prop.test(c(69,120), c((56+69),(120+80)), conf.level=0.99, correct=F)

# 2. At 0.01 level, test for the difference between the likelihood of repurshasing for Impala and that for Accord
prop.test(c(69,123), c((56+69),(52+123)), conf.level=0.99, correct=F)

# 3. At 0.01 level, test for the difference between the likelihood of repurshasing for Fusion and that for Accord
prop.test(c(120,123), c((120+80), (52+123)), conf.level=0.99, correct=F)
