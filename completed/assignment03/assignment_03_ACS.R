# Assignment: ASSIGNMENT 3
# Name: Lastname, Firstname
# Date: 2010-02-14

## Load the ggplot2 package
library(ggplot2)
theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
setwd("/home/ksenapa/Workspaces/dsc520")

## Load the `data/r4ds/heights.csv` to
df <- read.csv("data/acs-14-1yr-s0201.csv")

##What are the elements in your data (including the categories and data types)?
sapply(df, class)
##output of 
str(df)
'data.frame':	136 obs. of  8 variables:
  $ Id                    : chr  "0500000US01073" "0500000US04013" "0500000US04019" "0500000US06001" ...
$ Id2                   : int  1073 4013 4019 6001 6013 6019 6029 6037 6059 6065 ...
$ Geography             : chr  "Jefferson County, Alabama" "Maricopa County, Arizona" "Pima County, Arizona" "Alameda County, California" ...
$ PopGroupID            : int  1 1 1 1 1 1 1 1 1 1 ...
$ POPGROUP.display.label: chr  "Total population" "Total population" "Total population" "Total population" ...
$ RacesReported         : int  660793 4087191 1004516 1610921 1111339 965974 874589 10116705 3145515 2329271 ...
$ HSDegree              : num  89.1 86.8 88 86.9 88.8 73.6 74.5 77.5 84.6 80.6 ...
$ BachDegree            : num  30.5 30.2 30.8 42.8 39.7 19.7 15.4 30.3 38 20.7 ...

nrow(df) 
136
ncol(df)
8

## Create a Histogram of the HSDegree variable using the ggplot2 package.
#Set a bin size for the Histogram.
# Include a Title and appropriate X/Y axis labels on your Histogram Plot.
ggplot(df, aes(HSDegree)) + geom_histogram(bins = 10) + ggtitle("HSDegree Histogram") + xlab("HSDegree(Degree)") + ylab("Count(Numbers)")


# Answer the following questions based on the Histogram produced:
#Based on what you see in this histogram, is the data distribution unimodal?
YES
#Is it approximately symmetrical?
NO
#Is it approximately bell-shaped?
NO
#Is it approximately normal?
No
#If not normal, is the distribution skewed? If so, in which direction?
Yes . Its skewed to left.
#Include a normal curve to the Histogram that you plotted.
#Explain whether a normal distribution can accurately be used as a model for this data.

#v.Create a Probability Plot of the HSDegree variable.
qplot(sample = HSDegree, data = df)

#Answer the following questions based on the Probability Plot:
#Based on what you see in this probability plot, is the distribution approximately normal? Explain how you know.
  No . Lot of data points are around upper y-axis.

#If not normal, is the distribution skewed? If so, in which direction? Explain how you know.
  It is skewed to Left as Lot of data points are around upper y-axis.
#Now that you have looked at this data visually for normality, 
#you will now quantify normality with numbers using the stat.desc() function. 
#Include a screen capture of the results produced.
library('pastecs')
  stat.desc(df$HSDegree, basic=FALSE, desc=TRUE, norm=TRUE)
  
  median          mean       SE.mean  CI.mean.0.95           var 
  8.870000e+01  8.763235e+01  4.388598e-01  8.679296e-01  2.619332e+01 
  std.dev      coef.var      skewness      skew.2SE      kurtosis 
  5.117941e+00  5.840241e-02 -1.674767e+00 -4.030254e+00  4.352856e+00 
  kurt.2SE    normtest.W    normtest.p 
  5.273885e+00  8.773635e-01  3.193634e-09 
  
  
#In several sentences provide an explanation of the result produced for skew, 
#kurtosis, and z-scores. In addition, explain how a change in the sample size 
#may change your explanation?
  
 The negative values of skew indicate the values are piled-up on the right of the distribution
 Where as the kutosis is +ve and that indicates heavy tailed distribution.it is possible
 to determine the level of skew and kurtosis by converting into z-scores.
 
  
