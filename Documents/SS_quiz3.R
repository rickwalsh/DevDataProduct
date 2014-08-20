data(sleep)
x1 <- sleep$extra[sleep$group == 1]
x2 <- sleep$extra[sleep$group == 2]
n1 <- length(x1)
n2 <- length(x2)
sp <- sqrt(((n1 - 1) * sd(x1)^2 + (n2 - 1) * sd(x2)^2)/(n1 + n2 - 2))
md <- mean(x1) - mean(x2)
semd <- sp * sqrt(1/n1 + 1/n2)
md + c(-1, 1) * qt(0.975, n1 + n2 - 2) * semd

data(sleep)
x1 <- sleep$extra[sleep$group == 1]
x2 <- sleep$extra[sleep$group == 2]
n1 <- 30
n2 <- 9

sp <- sqrt(((n1 - 1) * sd(x1)^2 + (n2 - 1) * sd(x2)^2)/(n1 + n2 - 2))
md <- mean(x1) - mean(x2)
semd <- sp * sqrt(1/n1 + 1/n2)
md + c(-1, 1) * qt(0.975, n1 + n2 - 2) * semd

(qt(0.975, df=8) - qt(0.025, df=8)) * sd / sqrt(n)
(qt(0.975, df=8) - qt(0.025, df=8)) * sd / sqrt(n)

Suppose that data of 9 paired differences has a standard error of 1, what
value would the average difference have to be to have the lower endpoint of 
a 95% students t confidence interval touch zero?
The t interval is x??t.95,8±s/sqrtn

round(qt(.95, df = 9) * 2 / 3, 2)
?qt

  library(datasets); 
data(mtcars)
round(t.test(x)$conf.int)
round(t.test(1100)$conf.int)
t.test?

x<-rnorm (9,1100,30)
t.test(x,   paired = FALSE, var.equal = FALSE)$conf

x<-rnorm (3,1100,30)

attr(,"conf.level")

x<-rnorm (500,3,sqrt(.6))
y<-rnorm (500,5,sqrt(.68))
 
x<-rnorm (500,3,.6)
y<-rnorm (500,5,.68)
x
confint <- 
  as.vector(t.test(x, y, var.equal = TRUE)$conf.int) 

3.2 10.7
Being able to figure out the standard_error:
  SE = stdev/sqrt(sample size asked about)

and then from there the margin_error as defined by 
ME = qt(0.975,df=samplesize-1)*SE.  
(For 95% confidence interval.  The first argument to qt() changes when 
 you want a different interval)

& then calculating the margin about the mean with something like 
sample_avg + c(ME,-ME).  

SE = stdev/sqrt(sample size asked about)
ME = qt(0.975,df=samplesize-1)*SE

SE <- sqrt(.6)/sqrt(9)
ME <- 
qt(0.95,df=8)*2.6/sqrt(9)
qt(0.95,df=8)*2.1/sqrt(9)
qt(0.95,df=8)*1.5/sqrt(9)
qt(0.95,df=8)*.3/sqrt(9)

SE = stdev/sqrt(sample size asked about)
ME = qt(0.975,df=samplesize-1)*SE.

n1 <- n2 <- 9
x1 <- -3  ##treated
x2 <- 1  ##placebo
s1 <- 1.5  ##treated
s2 <- 1.8  ##placebo

x<-rnorm (9,-3,1.5)
y<-rnorm (9,1,1.8)
x

z<-t.test(x, y, var.equal = TRUE)$conf.int

x<-rnorm (9,-2,.5)
y<-rnorm (9,1,1.8)
x

--#4
  
x<-rnorm (10, 3 , sqrt(.6))
y<-rnorm (10, 5 , sqrt(.68))

z<-t.test(x, y, var.equal = TRUE)$conf.int
z

##new
SE <- 1.5/sqrt(9)
ME <-qt(0.95,df=8)*SE 
z1 <- -3 + c(-ME,ME)

SE <- 1.8/sqrt(9)
ME<-qt(0.95,df=8)*SE 
z2 <- 1 + c(-ME,ME)
t.test(z1,  var.equal = TRUE)$conf.int
t.test(z2,  var.equal = TRUE)$conf.int

z<-t.test(z1, z2, var.equal = TRUE)$conf.int
z
z1 - z2
yy<-rnorm (9,110,30)

# 5
SE <- sqrt(.6)/sqrt(10)
ME<-qt(0.975,df=9)*SE 
z1 <- 3 + c(-ME,ME)

SE <- sqrt(.68)/sqrt(10)
ME<-qt(0.975,df=9)*SE 
z2 <- 5 + c(-ME,ME)
z1 - z2

t.test(yy, var.equal = FALSE)$conf.int

SE <- 30/sqrt(9)


ME<-qt(0.975,df=8)*2.1/3 
xxx <- -2 + c(-ME,ME)
xxx

ME<-qt(0.975,df=8)*2.6/3 
xxx <- -2 + c(-ME,ME)
xxx

ME<-qt(0.975,df=8)*0.3/3 
xxx <- -2 + c(-ME,ME)
xxx

ME<-qt(0.975,df=8)*1.5/3 
xxx <- -2 + c(-ME,ME)
xxx

##and then from there the margin_error as defined by 
ME <- qt(0.975,df=8)*STD/3  
ME
-2 + c(-ME,ME)

(For 95% confidence interval.  The first argument to qt() changes when 
 you want a different interval)

##& then calculating the margin about the mean with something like 
xx <- 1100 + c(-2*ME,2*ME)
xx <- 1100 + c(-ME,ME)
xx

#4
data(sleep)
x1 <- sleep$extra[sleep$group == 1]
x2 <- sleep$extra[sleep$group == 2]
n1 <- length(x1)
n2 <- length(x2)
sp <- sqrt(((n1 - 1) * sd(x1)^2 + (n2 - 1) * sd(x2)^2)/(n1 + n2 - 2))
md <- mean(x1) - mean(x2)
semd <- sp * sqrt(1/n1 + 1/n2)
md + c(-1, 1) * qt(0.975, n1 + n2 - 2) * semd

#1 new
#2 old
data(sleep)
x1 <- sleep$extra[sleep$group == 1]
x2 <- sleep$extra[sleep$group == 2]
n1 <- 10
n2 <- 10
##sp <- sqrt(((n1 - 1) * .6 + (n2 - 1) * .68/(n1 + n2 - 2))
sp <- sqrt(((n1 - 1) * .6 + (n2 - 1) * .68)/(n1 + n2 - 2))
           
md <- 3 - 5
semd <- sp * sqrt(1/n1 + 1/n2)
md + c(-1, 1) * qt(0.975, n1 + n2 - 2) * semd

1 t
2 p
x1 <- sleep$extra[sleep$group == 1]
x2 <- sleep$extra[sleep$group == 2]
n1 <- 9
n2 <- 9
sp <- sqrt(((n1 - 1) * 1.5^2 + (n2 - 1) * 1.8^2)/(n1 + n2 - 2))
md <- -3 - 1
semd <- sp * sqrt(1/n1 + 1/n2)
md + c(-1, 1) * qt(0.95, n1 + n2 - 2) * semd

