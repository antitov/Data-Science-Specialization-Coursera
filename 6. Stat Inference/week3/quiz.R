#Statistical interference week 3 Quiz

#question 1
#In a population of interest, a sample of 9 men yielded
#a sample average brain volume of 1,100cc and a standard
#deviation of 30cc. What is a 95% Student's T confidence 
#interval for the mean brain volume in this new population?

mu <-1100
n <- 9
aplha <- 0.95
sd <- 30

Tint <- mu + c(-1,1)*qt(0.5+aplha*0.5,n-1)*sd/sqrt(n)
round(Tint)

#question 2
#A diet pill is given to 9 subjects over six weeks. 
#The average difference in weight (follow up - baseline) 
#is -2 pounds. What would the standard deviation of the
# difference in weight have to be for the upper endpoint of the 95%
# T confidence interval to touch 0?


mu <- -2
n <- 9
aplha <- 0.95
TintUp <- 0 

sd <- -mu*sqrt(n)/qt(0.5+aplha*0.5,n-1) 

round(sd,1)

#question 3
# In an effort to improve running performance, 5 runners
# were either given a protein supplement or placebo.
# Then, after a suitable washout period, they were given
# the opposite treatment. Their mile times were recorded
# under both the treatment and placebo, yielding 10
# measurements with 2 per subject. The researchers intend
# to use a T test and interval to investigate the treatment.
# Should they use a paired or independent group T test and
# interval

#answer^ A paired interval

#question 4

# In a study of emergency room waiting times, investigators 
# consider a new and the standard triage systems. To test the
# systems, administrators selected 20 nights and randomly 
# assigned the new triage system to be used on 10 nights and
# the standard system on the remaining 10 nights. 
# They calculated the nightly median waiting time (MWT) to 
# see a physician. The average MWT for the new system was 3 
# hours with a variance of 0.60 while the average MWT for the
# old system was 5 hours with a variance of 0.68. Consider the 
# 95% confidence interval estimate for the differences of the 
# mean MWT associated with the new system. Assume a constant
# variance. What is the interval? Subtract in this order 
# (New System - Old System).

#x is new system, y is the old one
x <- 3
y <- 5

ny <- nx <- 10

vx <- 0.6
vy <- 0.68
aplha <- 0.95
Sp <-sqrt((vx+vy)*0.5)
Tint <- x-y+c(-1,1)*qt(0.5+aplha/2,nx+ny-2)*Sp*sqrt(1/nx+1/ny)
round(Tint,2)

#question 5
# Suppose that you create a 95% T confidence interval. 
# You then create a 90% interval using the same data. 
# What can be said about the 90% interval with respect 
# to the 95% interval?

#Answer is: The interval will be narrower.

#question 6
# To further test the hospital triage system, administrators
# selected 200 nights and randomly assigned a new triage system
# to be used on 100 nights and a standard system on the remaining
# 100 nights. They calculated the nightly median waiting time 
# (MWT) to see a physician. The average MWT for the new system
# was 4 hours with a standard deviation of 0.5 hours while the
# average MWT for the old system was 6 hours with a standard
# deviation of 2 hours. Consider the hypothesis of a decrease
# in the mean MWT associated with the new treatment.
# 
# What does the 95% independent group confidence interval with 
# unequal variances suggest vis a vis this hypothesis? (Because
# there's so many observations per group, just use the Z quantile
# instead of the T.)

#x is new system, y is the old one

x <- 4
y <- 6

ny <- nx <- 100

sdx <- 0.5
sdy <- 2
aplha <- 0.95
Sp <-sqrt((sdx^2+sdy^2)*0.5)
Tint <- y-x+c(-1,1)*qt(0.5+aplha/2,nx+ny-2)*Sp*sqrt(1/nx+1/ny)
round(Tint,2)

#question 7
# Suppose that 18 obese subjects were randomized, 9 each, to
# a new diet pill and a placebo. Subjects’ body mass indices
# (BMIs) were measured at a baseline and again after having 
# received the treatment or placebo for four weeks. The average
# difference from follow-up to the baseline (followup - baseline) 
# was ???3 kg/m2 for the treated group and 1 kg/m2 for the
# placebo group. The corresponding standard deviations 
# of the differences was 1.5 kg/m2 for the treatment group 
# and 1.8 kg/m2 for the placebo group. Does the change in BMI 
# over the four week period appear to differ between the 
# treated and placebo groups? Assuming normality of the 
# underlying data and a common population variance, calculate 
# the relevant *90%* t confidence interval. Subtract in the 
# order of (Treated - Placebo) with the smaller (more negative)
# number first.

#x - group with treatment, y - placebo
x <- -3
y <- 1

ny <- nx <- 9

sdx <- 1.5
sdy <- 1.8
aplha <- 0.9
Sp <-sqrt((sdx^2+sdy^2)*0.5)
Tint <- x-y+c(-1,1)*qt(0.5+aplha/2,nx+ny-2)*Sp*sqrt(1/nx+1/ny)
round(Tint,3)

 