########################################################
##### Exercise
########################################################
# Now let's try a very big sample.
# Generate 10000 from a normal distribution with a mean of 100 and a standard deviation of 10.
# Plot the distribution of the values using the hist() function.
# Draw a density plot for the values.
set.seed(1)
y = rnorm(n=10000, mean=100, sd=10)
hist(y)
plot(density(y))
# Now different mean and sd.
# 4. Draw 100 values from a normal distribution with mean=10 and sd=5.
z = rnorm(n=100, mean=10, sd=5)
hist(z)
plot(density(z))


########################################################
##### Exercise
########################################################
# 1. 100 experiments of 10 tosses of a coin in each experiment that lands heads with probability .75 and tails with probability .25
x = rbinom(n=100, size=10, prob=.75)
# 2. 100 experiments of 1000 tosses of a coin in each experiment that lands heads with probability .25 and tails with probability .75
y = rbinom(n=100, size=1000, prob=.25)
# 3. 1000 experiments of 1000 tosses of a coin in each experiment that lands heads with probability .25 and tails with probability .75
z = rbinom(n=1000, size=1000, prob=.25)



###########################
# Exercise
###########################
# Now suppose we repeat drawing a sample of 50 employees from the population data 1000 times. 
# 1. Use a for loop to calculate the mean of the sampling distribution of sample mean
# 2. And caluclate the stanard error of the sampling distribution of the sample mean.

# Hint: begin with creating an empty object that will contain sample means.
# Also when you run your for loop, run set.seed(100) as well to ensure that everyone has the same value.
sample.mean = numeric() 
set.seed(100)
for(i in 1:1000){
  random = sample(x=1:2500, size=50, replace=F)
  sample.mean[i] = mean(data.eai[random,1])
}

mean(sample.mean); mean(data.eai$Salary)
sd(sample.mean); sd(data.eai$Salary)/sqrt(50)
