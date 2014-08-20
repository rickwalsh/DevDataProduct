library(nlme)
library(lattice)
xyplot(weight ~ Time | Diet, BodyWeight)
BodyWeight
library(lattice)
library(datasets)
data(airquality)
p <-   
  xyplot(Ozone ~ Wind | factor(Month), data = airquality)
print(p)

library(datasets)
data(airquality)

install.packages("ggplot2")
library(ggplot2) 
airquality
airquality1
airquality1 = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality1, facets = . ~ Month)

qplot(Wind, Ozone, data = airquality, facets = . ~ factor(Month))
library(ggplot2)
g <- ggplot(movies, aes(votes, rating)) + geom_point()
print(g)
qplot(votes, rating, data = movies)
qplot(votes, rating, data = movies, smooth = "loess")
ow can I modify the the code above to add a loess smoother to the scatterplot?
qplot(votes, rating, data = movies) + stats_smooth("loess")
qplot(votes, rating, data = movies) + geom_smooth()
qplot(votes, rating, data = movies, panel = panel.loess)
qplot(votes, rating, data = movies, smooth = "loess")
