################
# File: Lab1.R
# Author: Taeyong Park 
# Summary: R basics, Set up working directory, read data into R
#################


### FOUR WINDOWS IN RStudio
# Editor: you type R code.
# Console: the output of your code is displayed.
# In the two other windows, you can see plots, a history of your commands, etc.


### BASIC ARITHMETIC 
# type anything here.
# Write something here and find the solution in the console.

# To send a line of code to your console, use either 
# (PC users:) "control + enter"
# (Mac users:) "command + return"
# You can also simply copy and paste the line of code. 

1+3
1+4

2 + 3  #addition 

##### Wait a minute! What is the pound key (#) for?
# R doesn't read anything after #
# You can write explanations using it.
# If you don't put # before your writing,
what will happen?
  
# how about this? Igonred by R.
# Okay, let's go ahead.
  
2*3  # multiplication
5/3 #division
4 - 5 #subtraction
3^3 # exponentiation
exp(7) # exponential
log(10) # natural log

#########################
# Exercise
#########################
# Solve the problems on the white board.



########################################################
##### Set up the working directory
########################################################


## The most common thing we want to do in R is work with data of some sort.
## Usually these data are in some format like .csv (excel spreadsheets),
## .dta (Stata dataset), or .txt (text files).

## Reading these into R (i.e. adding them to your workspace) is very simple,
## but it first requires telling R where they are on your computer.

## We do this by setting our working directory, which is the folder in which
## the files are stored. If you try to load data into R which is not inside
## the folder which is specified in your working directory, you'll get an error.
## Also, anytime you export anything from R (new datasets, graphs, etc.) it will
## save them to your working directory.


# 1. Create a new directory (a new folder) for this course; You will save
# every data file into this folder in this semester.
# 2. Download the files on Canvas and save them to the new folder you just created.
# 3. In the menu bar at RStudio, click Session 
# 4. Place the cussor on Set Working Directory and click Choose Directory.
# 5. Then choose the new directory to which you saved the files.
# 6. You should see something like setwd("~/Dropbox/Teaching_CMUQ/2019FL_70-207/70207Lab_FL19")
# on your console window.
# 7. Double-check if your working directory is your desired folder using
getwd()


####################################
# Exercise 
####################################

# Now let's load the SoftDrink.csv data.

library(foreign) # This pacakge makes read.csv() function available.
data.soft = read.csv("SoftDrink.csv")

