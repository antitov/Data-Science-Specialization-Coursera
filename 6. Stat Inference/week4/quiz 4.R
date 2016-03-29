#1

# A pharmaceutical company is interested in testing a potential blood pressure lowering medication. 
# Their first examination considers only subjects that received the medication at baseline then two weeks later.
# The data are as follows (SBP in mmHg)

library(XML)
html <- "<table><tbody><tr><td>Subject</td><td>Baseline</td><td>Week 2</td></tr><tr><td>1</td><td>140
</td><td>132</td></tr><tr><td>2</td><td>138</td><td>135</td></tr><tr><td>3</td><td>150</td><td>151</td>
</tr><tr><td>4</td><td>148</td><td>146</td></tr><tr><td>5</td><td>153</td><td>130</td></tr></tbody></table>"

dataq1 <-readHTMLTable(html, skip.rows = 1, )
names(dataq1) <-readHTMLTable(html)[1]

doc <- htmlParse(html)
tableNodes <- getNodeSet(doc, "//table")
tb <- (readHTMLTable(tableNodes[[1]], skip.rows = 1, colClasses = c("character","integer","integer","integer" )))
names(tb) <-as.character(unlist(readHTMLTable(tableNodes[[1]])[1,]))
tb <- as.numeric(tb)
t.test(tb$Baseline,tb$`Week 2`, paired = TRUE) 

#2
# A sample of 9 men yielded a sample average brain volume of 1,100cc and a standard 
# deviation of 30cc. What is the complete set of values of ??0 that a test of H0:??=??0
# would fail to reject the null hypothesis in a two sided 5% Students t-test?

x <- 1100
n <- 9
aplha <- 0.05
sd <- 30
x + c(-1,1)*qt(1-aplha*0.5, n-1)*sd/sqrt(n)

#3
# Researchers conducted a blind taste test of Coke versus Pepsi. Each of four people was 
# asked which of two blinded drinks given in random order that they preferred. The data was 
# such that 3 of the 4 people chose Coke. Assuming that this sample is representative, report 
# a P-value for a test of the hypothesis that Coke is preferred to Pepsi using a one sided
# exact test.

pbinom(2,size = 4, prob = 0.5, lower.tail=FALSE)


#4
# Infection rates at a hospital above 1 infection per 100 person days at risk are believed
# to be too high and are used as a benchmark. A hospital that had previously been above the
# benchmark recently had 10 infections over the last 1,787 person days at risk. About what
# is the one sided P-value for the relevant test of whether the hospital is *below* the 
# standard?
poisson.test(10,T=1787,r=1/100,alternative="l")

#5
# Suppose that 18 obese subjects were randomized, 9 each, to a new diet pill and a placebo.
# Subjects? body mass indices (BMIs) were measured at a baseline and again after having received
# the treatment or placebo for four weeks. The average difference from follow-up to the baseline
# (followup - baseline) was ???3 kg/m2 for the treated group and 1 kg/m2 for the placebo group. 
# The corresponding standard deviations of the differences was 1.5 kg/m2 for the treatment 
# group and 1.8 kg/m2 for the placebo group. Does the change in BMI appear to differ between 
# the treated and placebo groups? Assuming normality of the underlying data and a common
# population variance, give a pvalue for a two sided t test.

xt <- -3
xp <- 1
s_xt <- 1.5
s_xp <- 1.8
alpha <- 0.05
n1 <- n2 <- 9
Sp <-sqrt((s_xt^2+s_xp^2)*0.5)
Sp2 <- sqrt(( (n1-1) * s_xp^2 + (n2-1)*s_xt^2)/(n1+n2-2))
Ts <- (xt-xp)/(sqrt(1/n1+1/n2)*Sp)
2*pt(Ts, n1+n2-2)

# 6. 
# Brain volumes for 9 men yielded a 90% confidence interval of 1,077 cc to 1,123 cc. 
# Would you reject in a two sided 5% hypothesis test of
# 
# H0:??=1,078

#Answer: No, you wouldnot reject


# 7. 
# Researchers would like to conduct a study of 100 healthy adults to detect a four 
# year mean brain volume loss of .01 mm3. Assume that the standard deviation of four
# year volume loss in this population is .04 mm3. About what would be the power of the
# study for a 5% one sided test versus a null hypothesis of no volume loss?

power.t.test(n = 100, delta = .01-0, sd = .04, type = "one.sample", alt = "one.sided")$power

mu0 = 0.01
mua = 0
sigma = 0.04
n = 100
alpha = 0.05
z <- qnorm(1-alpha)
pnorm(mua+z*sigma/sqrt(n), mean = mu0, sd=sigma/sqrt(n), lower.tail = FALSE)


# #8
# Researchers would like to conduct a study of n healthy adults to detect a four year
# mean brain volume loss of .01 mm3. Assume that the standard deviation of four year 
# volume loss in this population is .04 mm3. About what would be the value of n needed
# for 90% power of type one error rate of 5% one sided test versus a null hypothesis of 
# no volume loss?



power.t.test(power = .9, delta = .01-0, sd = .04, type = "one.sample", alt = "one.sided")$n

#getAnywhere(power.t.test)

mu0 = 0
mua = 0.01
sigma = 0.04
power <- 0.9
alpha = 0.05
z <- qnorm(1-alpha)

n <- NULL
delta <- 0.01-0
sd <- 0.04
tol = .Machine$double.eps^0.25
tsample <- 1
tside <- 1
sig.level <-  0.05
p.body <- quote({
      nu <- (n - 1) * tsample
      pt(qt(sig.level/tside, nu, lower.tail = FALSE), nu, ncp = sqrt(n/tsample) * 
               delta/sd, lower.tail = FALSE)
})
n <- uniroot(function(n) eval(p.body) - power, c(2, 1e+07), 
             tol = tol, extendInt = "upX")$root


#9
# As you increase the type one error rate, ??, what happens to power?
# 
# anser: it increases