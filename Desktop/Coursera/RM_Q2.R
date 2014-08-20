x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)

fit <- lm(y ~ x); 
confint(fit)
summary(fit)$sigma
summary(fit)$coefficients
sqrt(sum(resid(fit)^2)/7)
sumCoef <- summary(fit)$coefficients
sumCoef[1,1] + c(-1, 1) * qt(.975, df = fit$df) * sumCoef[1, 2]
[1] -294.5 -224.8
sumCoef[2,1] + c(-1, 1) * qt(1-0.05296, df = fit$df) * sumCoef[2, 2]
?resid
1-0.05296
2.325
1-0.391
1-0.025

beta1 <- cor(y, x) * sd(y) / sd(x)
beta0 <- mean(y) - beta1 * mean(x)

Q3
In the mtcars data set, fit a linear regression model of weight (predictor) 
on mpg (outcome). Get a 95% confidence interval for the expected mpg at 
the average weight. What is the lower endpoint?
data(mtcars)
x<-mtcars$wt
y<-mtcars$mpg
mean(mtcars$wt)
beta1 <- cor(y, x) * sd(y) / sd(x)
beta0 <- mean(y) - beta1 * mean(x)
rbind(c(beta0, beta1), coef(lm(y ~ x)))
?mtcars
fit <- lm(mpg ~   wt  , data = mtcars)
confint(fit)

37.28513 -5.344472 * 3.21725

37.285 - (5.344 * 3)
33.450500 - (5.344 * 3)
41.119753 - (4.202 * 3)

fit <- lm(y ~ x); 
sumCoef <- summary(fit)$coefficients
sumCoef[1,1] + c(-1, 1) * qt(.975, df = fit$df) * sumCoef[1, 2]
[1] -294.5 -224.8
sumCoef[2,1] + c(-1, 1) * qt(.975, df = fit$df) * sumCoef[2, 2]
?confint
18.991
-6.486
-4.00
21.190
Q5

data(mtcars)
x<-mtcars$wt
y<-mtcars$mpg
fit <- lm(y ~ x); 
beta1 <- cor(y, x) * sd(y) / sd(x)
beta0 <- mean(y) - beta1 * mean(x)
xVals <- seq(min(x), max(x), by = .01)
yVals <- beta0 + beta1 * xVals
newdata <-data.frame(x =xVals)
p1 <- predict(fit, newdata, interval = ("confidence"))
p2 <- predict(fit, newdata, interval = ("prediction"))

sumCoef <- summary(fit)$coefficients
sumCoef[1,1] + c(-1, 1) * qt(.975, df = fit$df) * sumCoef[1, 2]
[1] -294.5 -224.8
sumCoef[2,1] + c(-1, 1) * qt(.975, df = fit$df) * sumCoef[2, 2]


Q6
mtcars2 <- mtcars
mtcars2$swt <-mtcars2$wt/2
fit <- lm(mpg ~  swt  , data = mtcars2)
confint(fit)

Q9

Refer back to the mtcars data set with mpg as an outcome and weight (wt) 
as the predictor. About what is the ratio of the the sum of the squared 
errors, ???ni=1(Yi???Y^i)2 when comparing a model with just an intercept 
(denominator) to the model with the intercept and slope (numerator)?

data(mtcars)
length(x)
x<-mtcars$wt
y<-mtcars$mpg
fit <- lm(y ~ x); 
summary(fit)
beta1 <- cor(y, x) * sd(y) / sd(x)
beta0 <- mean(y) - beta1 * mean(x)

mm<-(y-mean(y))^2
sum(mm)
y
mean(y)
sum((y-mean(y))^2)

data(mtcars)
x<-mtcars$wt
y<-mtcars$mpg
fit <- lm(y ~ x); 
beta1 <- cor(y, x) * sd(y) / sd(x)
beta0 <- mean(y) - beta1 * mean(x)
xVals <- seq(min(x), max(x), by = .125)
yVals <- beta0 + beta1 * xVals
sum((0))^2)
1126/1217
?mtcars

yhat <- beta0 + beta1 * mtcars$wt
sum((y-yhat)^2)
y
yVals
278/1126
