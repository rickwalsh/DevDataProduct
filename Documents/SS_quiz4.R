
mn <- mean(mtcars$mpg); s <- sd(mtcars$mpg); z <- qnorm(.05)
mu0 <- mn + z * s / sqrt(nrow(mtcars))

In a random sample of 100 patients at a clinic, you would like to test whether the mean RDI 
is x or more using a one sided 5% type 1 error rate. The sample mean RDI had a mean of 12 
and a standard deviation of 4. What is the largest value of x (H0:??=x versus Ha:??>x) would
you reject for?pt(0.8, 15, lower.tail = FALSE)

mn <- mean(mtcars$mpg); 
s <- sd(mtcars$mpg); 
z <- qnorm(.05)
mu0 <- mn + z * s / sqrt(nrow(mtcars))
?qnorm
z <- qnorm(.05)
z <- qnorm(.1)
12 - z * 4 / sqrt(100)
12 + z * 4 / sqrt(100)
11.34

12 - 

A pharmaceutical company is interested in testing a potential blood pressure lowering medication. 
Their first examination considers only subjects that received the medication at baseline 
then two weeks later. The data are as follows (SBP in mmHg)

Subject  Baseline	Week 2
1	140	132
2	138	135
3	150	151
4	148	146
5	135	130
m4 <- mtcars$mpg[mtcars$cyl == 4]
m6 <- mtcars$mpg[mtcars$cyl == 6]
p <- t.test(m4, m6, paired = FALSE, alternative="two.sided", var.equal=FALSE)$p.value
The answer to 1. is 1 
The answer to 2. is 4e-04

m4<-c(140,138,150,148,135)
m6 <- c(132,135,151,146,130)
p <- t.test(m4, m6, paired = TRUE, alternative="two.sided", var.equal=FALSE)$p.value

A sample of 9 men yielded a sample average brain volume of 1,100cc and a standard deviation of 30cc. What is the complete set of 
values of ??0 that a test of H0:??=??0 would fail to reject the null hypothesis in a two sided 
5% Students t-test?

In a population of interest, a sample of 9 men yielded a sample average brain volume of 1,100cc and 
a standard deviation of 
30cc. What is a 95% Student's T confidence interval for the mean brain volume in this new population?

mn <- mean(mtcars$mpg); s <- sd(mtcars$mpg); 
z <- qnorm(.05)
1100 - z * 30 / sqrt(9)

m4 <- mtcars$mpg[mtcars$cyl == 4]
m6 <- mtcars$mpg[mtcars$cyl == 6]
p <- t.test(m4, m6, paired = FALSE, alternative="two.sided", var.equal=FALSE)$p.value
___
4

You believe the coin that you're flipping is biased towards heads. You get 55 heads out of 100 flips.
What's the exact relevant pvalue to 4 decimal places

Researchers conducted a blind taste test of Coke versus Pepsi. Each of four people was asked which 
of two blinded drinks given in random order that they preferred. The data was such that 3 of 
the 4 people chose Coke. Assuming that this sample is representative, report a P-value 
for a test of the hypothesis that Coke is preferred to Pepsi using a one sided exact test.

pbinom(2, prob = .5, size = 4, lower.tail = FALSE)
The answer to 1 is 0.1841
The answer to 2 is 0
__
#5
A web site was monitored for a year and it received 520 hits per day. In the first 30 days in 
the next year, the site received 15,800 hits. Assuming that web hits are Poisson.
Give an exact one sided P-value to the hypothesis that web hits are up this year over last 
to four significant digits (expressed as a proportion

pv <- ppois(15800 - 1, lambda = 520 * 30, lower.tail = FALSE)
ppois(10, lambda = 17.87, lower.tail = TRUE)
= 0.03

The answer to 1 is 0.0553
The answer to 2 is 0

Also, compare with the Gaussian approximation where ???????N(??,??/t)
pnorm(15800 / 30, mean = 520, sd = sqrt(520 / 30), lower.tail = FALSE)

Infection rates at a hospital above 1 infection per 100 person days at risk are believed 
to be too high and are used as a benchmark. A hospital that had previously been above the
benchmark recently had 10 infections over the last 1,787 person days at risk. About what 
is the one sided P-value for the relevant test of whether the hospital is *below* the standard?

pnorm(15800 / 30, mean = 520, sd = sqrt(520 / 30), lower.tail = FALSE)

----------
6

Suppose that in an AB test, one advertising scheme led to an average of 10 purchases 
per day for a sample of 100 days, while the other led to 11 purchaces per day, also 
for a sample of 100 days. Assuming a common standard deviation of 4 purchaces per day. 
Assuming that the groups are independent and that they days are iid, perform a 
Z test of equivalence.
What is the P-value reported to 3 digits expressed as a proportion?
m1 <- 10; m2 <- 11
n1 <- n2 <- 100
s <- 4
se <- s * sqrt(1 / n1 + 1 / n2)
ts <- (m2 - m1) / se
pv <- 2 * pnorm(-abs(ts))

Suppose that 18 obese subjects were randomized, 9 each, to a new diet pill and a placebo. 
Subjects??? body mass indices (BMIs) were measured at a baseline and again after having 
received the treatment or placebo for four weeks. The average difference from follow-up 
to the baseline (followup - baseline) was ???3 kg/m2 for the treated group and 1 kg/m2 for
the placebo group. The corresponding standard deviations of the differences was 1.5 kg/m2 
for the treatment group and 1.8 kg/m2 for the placebo group. Does the change in BMI over 
the two year period appear to differ between the treated and placebo groups? Assuming normality
of the underlying data and a common population variance, give a pvalue for a two sided t test.
m1 <- -3; 
m2 <- 1
n1 <- n2 <- 9
s <- 4
se <- s * sqrt(1 / n1 + 1 / n2)
ts <- (m2 - m1) / se
pv <- 2 * pnorm(-abs(ts))

m1 <- -3
m2 <- 1
df1 <- 9 - 1
df2 <- 9 - 1
ss1 <- (1.5)*(1.5)*df1
ss2 <- (1.8)*(1.8)*df2

sp2<-(ss1 + ss2) / (df1 + df2)
T <- (m1 - m2) / sqrt (((sp2 / df1) + (sp2 / df2)))
pt(T,(df1+df2))
?pt
pv <- 2 * pnorm(-abs(T))
round(pv,2)


x1 <- sleep$extra[sleep$group == 1]
x2 <- sleep$extra[sleep$group == 2]

n1 <- 9
n2 <- 9
sp <- sqrt(((n1 - 1) * (1.5)^2 + (n2 - 1) * (1.8)^2)/(n1 + n2 - 2))
md <- m1 - m2
semd <- sp * sqrt(1/n1 + 1/n2)
md + c(-1, 1) * qt(0.975, n1 + n2 - 2) * semd

ts <- (m2 - m1) / semd
pv <- 2 * pnorm(-abs(ts))
pv <- 2 * pnorm(-abs(ts))

se <- s * sqrt(1 / n1 + 1 / n2)
ts <- (m2 - m1) / se
pv <- 2 * pnorm(-abs(ts))



## [1] -3.3639 0.2039
t.test(x1, x2, paired = FALSE, var.equal = TRUE)$conf
?t.test
_______
8
Consider two problems previous. Assuming that 10 purchases per day is a benchmark null value, 
that days are iid and that the standard deviation is 4 purchases for day. Suppose that you plan 
on sampling 100 days. What would be the power for a one sided 5% Z mean test that purchases per 
day have increased under the alternative of ??=11 purchase per day?

power <- pnorm(10 + qnorm(.95) * .4, mean = 11, sd = .4, lower.tail = FALSE)
power <- pnorm(100 + qnorm(.95) * .4, mean = 11, sd = .4, lower.tail = FALSE)

The answer is 0.804
Researchers would like to conduct a study of 100 healthy adults to detect a four year mean 
brain volume loss of .01 mm3. Assume that the standard deviation of four year volume loss 
in this population is .04 mm3. About what would be the power of the study for a 5% one 
sided test versus a null hypothesis of no volume loss?

.01 / .04 * 10
x <-  1.645 - 2.5
pnorm(x, lower.tail = FALSE)
________

Researchers would like to conduct a study of n healthy adults to detect a four year mean 
brain volume loss of .01 mm3. Assume that the standard deviation of four year volume loss 
in this population is .04 mm3. About what would be the value of n needded for 90% power of 
type one error rate of 5% one sided test versus a null hypothesis of no volume loss?

.01 / .04 * 10
s <- sqrt (140)
x <-  1.645 - (.01 / .04 * s)
pnorm(x, lower.tail = FALSE)
__________
10
the lower the a, the lower the power; the higher the a, the higher the power
http://www.animatedsoftware.com/statglos/sgrelabp.htm

11
A web site was monitored for a year and it received 520 hits per day. In the first 30 days in 
the next year, the site received 15,800 hits. Assuming that web hits are Poisson.
Give an exact one sided P-value to the hypothesis that web hits are up this year over last 
to four significant digits (expressed as a proportion

pv <- ppois(15800 - 1, lambda = 520 * 30, lower.tail = FALSE)
ppois(10, lambda = 17.87, lower.tail = TRUE)
= 0.03

ppois(10, lambda = 17.87, lower.tail = TRUE)

The Daily Planet ran a recent story about Kryptonite poisoning in the water supply after 
a recent event in Metropolis. Their usual field reporter, Clark Kent, called in sick and 
so Lois Lane reported the story. Researchers sampled 288 individuals and found mean blood 
Kryptonite levels of 44, both measured in Lex Luthors per milliliter (LL/ml). They 
compared this to 288 sampled individuals from Gotham city who had an average level 
of 42.04. About what is the Pvalue for a two sided Z test of the relevant hypothesis? 
Assume that the standard deviation is 12 for both groups.

Suppose that in an AB test, one advertising scheme led to an average of 10 purchases 
per day for a sample of 100 days, while the other led to 11 purchaces per day, also 
for a sample of 100 days. Assuming a common standard deviation of 4 purchaces per day. 
Assuming that the groups are independent and that they days are iid, perform a 
Z test of equivalence.
What is the P-value reported to 3 digits expressed as a proportion?
m1 <- 44
m2 <- 42.04
n1 <- n2 <- 288
s <- 12
se <- s * sqrt(1 / n1 + 1 / n2)
ts <- (m2 - m1) / se
pv <- 2 * pnorm(-abs(ts))
round(pv,2)
