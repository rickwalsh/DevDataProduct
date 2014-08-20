
round(ppois(20, lambda = 16.5 * 2) * 100, 1)

The number of web hits to a site is Poisson with mean 16.5 per day.
What is the probability of getting 20 or fewer in 2 days expressed 
as a percentage to one decimal place?
ppois(10, lambda = (5 * 3) )

round(ppois(10, lambda = 3) * 100, 1)

The number of web hits to a site is Poisson with mean 16.5 per day.
What is the probability of getting 20 or fewer in 2 days expressed 
as a percentage to one decimal place?

unif100mean <- function(unused){
  return(mean(runif(100,min=0,max=1)))
}
sd(sapply(1:1000,unif100mean))

pbinom(3, size = 5, prob = 0.5, lower.tail = FALSE)
qnorm(0.95, mean = 1100, sd = 75 * 1)
