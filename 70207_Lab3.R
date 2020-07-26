################
# File: Lab3.R
# Author: Taeyong Park
# Summary: Normal/Binomial distributions,Sampling distribution
#################

########################################################
##### Plot a normal distribution 
########################################################


#In R, you can generate random numbers from a variety of different probability distributions
#This is useful for simulating data, which can help you to develop theories and to evaluate your statistical procedures


# Draw 100 values from a normal distribution with a mean of 100 and a standard deviation of 10."
set.seed(1)
x = rnorm(n=100, mean=100, sd=10) # rnorm generates random values from the defined normal distribution.
x 

#A histogram of the data verifies that it looks similar to a normal distribuiton
# (though these are random numbers so the results will vary -- 
#run the lines above again and make another histogram and you'll see that it changes)
hist(x)

# similar to a historgram is a density plot, which shows the distribution as represented by a smooth line
plot(density(x))


########################################################
##### Exercise
########################################################
# A big sample.
# 1. Generate 10000 from a normal distribution with a mean of 100 and a standard deviation of 10.
# 2. Plot the distribution of the values using the hist() function.
# 3. Draw a density plot for the values.
# Now different mean and sd.
# 4. Draw 100 values from a normal distribution with mean=10 and sd=5.
# 5. Plot the distribution of the values using the hist() function.
# 6. Draw a density plot for the values.



########################################################
##### A binomial distribution 
########################################################

#we may also want to generate binomial random variables
#these are things like coin flips, where there are exactly two outcomes 
#as a convention, we label the outcomes with ones and zeros, and we call a 1 a "success" and a 0 a "failure"
# (that language may help you better understand the help files for this function)
?rbinom

# tossing a fair coin, once in each experiment, but 100 experiments. 
rbinom(n=100, size=1, prob=.5) # Let's say 0 is a tail and 1 is a head.


########################################################
##### Exercise
########################################################
# 1. 100 experiments of 10 tosses of a coin in each experiment that lands heads with probability .75 and tails with probability .25
x = rbinom(n=100, size=10, prob=.75)
# 2. 100 experiments of 1000 tosses of a coin in each experiment that lands heads with probability .25 and tails with probability .75
y = rbinom(n=100, size=1000, prob=.25)
# 3. 1000 experiments of 1000 tosses of a coin in each experiment that lands heads with probability .25 and tails with probability .75
z = rbinom(n=1000, size=1000, prob=.25)

########################################################
##### Sampling distribution
########################################################

data.eai = read.csv("EAI.csv")
colnames(data.eai)

class(data.eai$Salary)
class(data.eai$Training)

nrow(data.eai)
dim(data.eai)

# Summary of quantitative data 
mean(data.eai$Salary)
median(data.eai$Salary)
range(data.eai$Salary)
sd(data.eai$Salary)
var(data.eai$Salary)
summary(data.eai$Salary)

# Summary of qualitative data
table(data.eai$Training)
summary(data.eai$Training)



##### Sampling distribution of the sample mean #####
hist(data.eai$Salary, xlab="Salary", 
     main="Distribution of EAI Salary",
     col = "yellowgreen")

plot(density(data.eai$Salary)) # The population distribution is normal.

# Draw a random sample of 30 employees.
random = sample(x=1:2500, size=30, replace=F) # Run ?sample to see what these two arguments for.
random # indicates 30 randomly chosen numbers out of 1:2500.

# Of all the Salary data, select only the rows chosen by the random-number generator.
# And, calcuate the mean value.
mean(data.eai[random,1]) 


# As in class, let's repeat this sampling 500 times.
# We may repeat running the above code 500 times.

# But, instead, we will use a for loop.
# for loop is widely used for simulation. 
sample.mean = numeric() # Create an empty object that will contain sample means.
set.seed(100)
for(i in 1:500){
  random = sample(x=1:2500, size=30, replace=F)
  sample.mean[i] = mean(data.eai[random,1])
}

sample.mean
hist(sample.mean) # sampling distrinution of the sample mean.
plot(density(sample.mean)) # normal-looking.

# Is the theoretical sampling distribution of sample mean right?
mean(sample.mean); mean(data.eai$Salary)
sd(sample.mean); sd(data.eai$Salary)/sqrt(30)



########################################################
#### START EXPLAINING For Loop ####

#below is a for loop. It's structure is as follows
#we say
#for(i in beginning:end) {
#do some thing with element i
#}

#thus, i is our iterator (we could have used any letter), and is a temporary variable that goes from "beginning" to "end"
#for instance, if we say
#for(i in 1:10)
#then i will take the value of 1 the first time through the loop, then 2, then 3, and so on, until it gets to 10, and then the loop will stop
#everything inside the curly brackets is considered part of the loop

#for instance, the function below just prints each element of x.numeric
my.vector = c("A", "B", "C", "D", "E")
for(i in 1:length(my.vector)){ #this says, take i from 1 to the length of my.vector (which is 5 in this case)
  print(my.vector[i])  #this says, please print the i'th element of my.vector
}# this says "Okay, the loop is over now, so go back to the top and do this again please."

# this for loop is the same as
print(my.vector[1])
print(my.vector[2])
print(my.vector[3])
print(my.vector[4])
print(my.vector[5])

#### END OF EXPLAINING For Loop ####
########################################################


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


##### Sampling distribution of the sample proportion #####

## Normal approximation of a binomial experiment ##

#This says "Simulate 10 experiments (n=10) of 10 coin flips each (size=10) from a fair coin (prob=.5)"
coin.flips10 <- rbinom(n=10, size=10, prob=.5) #think of result as number of heads in each experiment
#Now simulate 100 experiments of 10 coin flips each from a fair coin
coin.flips100 <- rbinom(n=100, size=10, prob=.5)
#Now simulate 1000 experiments of 10 coin flips each from a fair coin
coin.flips1000 <- rbinom(n=1000, size=10, prob=.5)

# histogram n=10
hist(coin.flips10)
#With a sample size of 100 the distribution already looks much better
hist(coin.flips100)
#With 1000 experiments the results look very close to normal
hist(coin.flips1000)


## Normal approximation of a proportion data ##

# histogram n=10
hist(coin.flips10/10)
#With a sample size of 100 the distribution already looks much better
hist(coin.flips100/10)
#With 1000 experiments the results look very close to normal
hist(coin.flips1000/10)


## Now let's use the EAI data.

barplot(table(data.eai$Training), xlab="Training", 
        main="Distribution of Training Completed",
        col = "yellowgreen")

# Draw a random sample of 30 employees.
random = sample(x=1:2500, size=30, replace=F) # Run ?sample to see what these two arguments for.
random # indicates 30 randomly chosen numbers out of 1:2500.

# Of all the Salary data, select only the rows chosen by the random-number generator.
# And, calcuate the proportion.
prop = table(data.eai[random,2])[2]/30


# As in class, let's repeat this sampling 500 times.
# We may repeat running the above code 500 times.

# But, instead, we will use a for loop.
sample.prop = numeric() # Create an empty object that will contain sample means.
for(i in 1:500){
  random = sample(x=1:2500, size=30, replace=F)
  sample.prop[i] = table(data.eai[random,2])[2]/30
}

sample.prop
hist(sample.prop) # sampling distrinution of the sample proportion.
plot(density(sample.prop)) # normal-looking.

# Is the theoretical sampling distribution of sample mean right?
mean(sample.prop); table(data.eai$Training)[2]/2500
sd(sample.prop); sqrt(0.6*(1-0.6)/30)
