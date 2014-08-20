Q1
x <- c(0.18, -1.54, 0.42, 0.95)
And weights given by
x <- c(0.18, 0.18,-1.54, 0.42, 0.95,0.42,0.42)

w <- c(2, 1, 3, 1)

sum(x*w) / 4
mu<-mean(x)
sum((x-mu)*w)

x <- c(0.18, -1.54, 0.42, 0.95)
And weights given by
mean(x)
w <- c(2, 1, 3, 1)

sum(w*((x-0.1471)^2))
sum(w*((x-0.300)^2))
sum(w*((x-1.077)^2))
sum(w*((x-0.0025)^2))

a<-0.0025
tot<-0
for (i in 1:4)
{
  v<-(x[i]-a)^2
  z<-w[i]*v
  tot<-tot+z
}
tot

0.1471
0.300
1.077
0.0025


Q2
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)

sum(x*y)/sum(x^2)

Q3

data(mtcars)
head(mtcars)
Do data(mtcars) from the datasets package and fit the regression model with 
mpg as the outcome and weight as the predictor. Give the slope coefficient.

x<-mtcars$wt
y<-mtcars$mpg
sum(x*y)/sum(x^2)

x<-mtcars$wt
y<-mtcars$mpg
beta1 <- cor(y, x) * sd(y) / sd(x)
beta0 <- mean(y) - beta1 * mean(x)
rbind(c(beta0, beta1), coef(lm(y ~ x)))

Q4

Consider data with an outcome (Y) and a predictor (X). The standard 
deviation of the predictor is one half that of the outcome. The correlation 
between the two variables is .5. What value would the slope coefficient 
for the regression model with Y as the outcome and X as the predictor?
sd(x) = sd(y) / 2

cor(x,y) = 1/2

1/2 * 10 / 10 / 2

Q6
x <- c(8.58, 10.46, 9.01, 9.64, 8.86)

z <- (x - mean(x)) / sd(x)

Q7

x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
beta1 <- cor(y, x) * sd(y) / sd(x)

beta0 <- mean(y) - beta1 * mean(x)
rbind(c(beta0, beta1), coef(lm(y ~ x)))

Q9

x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
What value minimizes the sum of the squared distances between these points and itself?
mean(x)
mse <- mean((x - mean(x))^2)

