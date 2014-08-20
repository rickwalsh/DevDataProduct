win_estimators <- read.csv('win_estimators.csv')
AL_East_estimator <- read.csv('win_estimators.csv')
To start, we will output summary statistics of our data set. To execute this, perform the following commands:
  head(AL_East_estimator)
  summary(win_estimators)

AL_East_estimator <- subset(win_estimators, teamID=='BOS' | teamID=='NYA' | teamID=='BAL' | teamID=='TBA' | teamID=='TOR')
NL_East_estimator <- subset(win_estimators, teamID=='LAN' | teamID=='ARI' | teamID=='COL' | teamID=='SDN' | teamID=='SFN')


NL_East_estimatorx <- subset(win_estimators,  teamID=='SFN ')
head(AL_East_estimator)
mean(AL_East_estimator$WPct,break=9)
AL_East_estimator2 <- subset(AL_East_estimator, yearID > 1901 )
NL_East_estimator2 <- subset(NL_East_estimator, yearID > 1901 )

hist(AL_East_estimator$WPct,break=10)
hist(AL_East_estimator$Soolman_WPct)
hist(AL_East_estimator$Kross_WPct)
hist(NL_East_estimator$WPct)
hist(NL_East_estimator$Soolman_WPct)
hist(NL_East_estimator$Kross_WPct)
  mean(win_estimators$R)
mean(win_estimators)
sd(win_estimators$WPct)

mean(AL_East_estimator2$WPct)
mean(AL_East_estimator2$R)
mean(AL_East_estimator2$RA)
mean(NL_East_estimator2$WPct)
mean(NL_East_estimator2$R)
mean(NL_East_estimator2$RA)

x=avgRuns???squareroot(avgRunsAllowed^2/(1/(avgWPct???1/162)???1))
690.9588???sqrt(687.268^2/(1/(.5035273???1/162)???1))

732.0446???sqrt(688.7232^2/(1/(.528203???1/162)???1))

x = avgRuns - squareroot(avgRuns^2/(1/(.500 - 1/162) - 1))

\((avgRuns - x)^2/((avgRuns - x)^2 + avgRuns^2) = .500 - 1/162\)
x=avgRuns???squareroot(avgRuns2/(1/(.500???1/162)???1))

x=avgRuns???squareroot(avgRuns2/(1/(.528???1/162)???1))
x=avgRuns???squareroot(avgRuns2/(1/(.500???1/162)???1))

mean(NL_East_estimator$WPct)
mean(NL_East_estimator$R)

avgRuns???squareroot(avgRuns^2/(1/(.500???1/162)???1))
690.9588 - sqrt( 690.9588* 690.9588/(1/(.503-1/162)- 1))
732.04 - sqrt( 732.04* 732.04/(1/(.528-1/162)-1))
732.04 - sqrt( 732.04* 732.04/(1/(.528???1/162)-1))

estimators <- win_estimators[c('RperG', 'RAperG', 'WPct','Cook_WPct',  'Soolman_WPct',  'Kross_WPct', 'Smyth_WPct', 'BJames_Pythag_WPct', 'BJames_Pythag_WPctII')]

We will use the splom() function ("scatter plot matrix") to graph all the variables against each other, and explore their correlations. xlab allows us to title the graph. In order to use splom(), which comes from a extra package, we need to import the "lattice" package. We posted directions to install the lattice package to your computer here.

require('lattice')

splom(estimators, xlab='Win Estimators')
wpct_95th_pct = quantile(win_estimators$WPct, .95)
splom(x)
splom(y)
top_winners = win_estimators[win_estimators$WPct >= wpct_95th_pct, ]
mean(top_winners$BJames_Pythag_WPctII)
x<-cbind(top_winners$WPct ,top_winners$BJames_Pythag_WPctII)
y<-cbind(win_estimators$WPct ,win_estimators$BJames_Pythag_WPctII)





nrow(game_statistics)
Now, we will look at the relationship between runs and the total time elapsed in a game. To start, we need to create a new variable for the total runs scored (you will see this command be used in the next video):
  

##game_statisticsUmps <- subset(game_statistics,hp_ump_name == 'Brian Gorman' | hp_ump_name == 'Jim Joyce' | hp_ump_name == 'Dale Scott' | hp_ump_name == 'Tim Welke' )

  
game_statistics <- read.csv('game_statistics.csv')
attach(game_statistics)
game_statistics$total_runs <- with(game_statistics, home_score + visitor_score)

game_statistics$RedSox <- with(game_statistics, ifelse(home=='BOS' | visitor == 'BOS' , 1, 0))
game_statistics$Joyce <- with(game_statistics, ifelse(hp_ump_name == 'Jim Joyce' , 1, 0))
game_statistics$Scott <- with(game_statistics, ifelse(hp_ump_name == 'Dale Scott' , 1, 0))
game_statistics$Welke <- with(game_statistics, ifelse(hp_ump_name == 'Tim Welke' , 1, 0))
game_statistics$Gorman <- with(game_statistics, ifelse(hp_ump_name == 'Brian Gorman' , 1, 0))

projected_runs = lm(game_statistics$total_runs ~ game_statistics$RedSox + 
                 game_statistics$Gorman + 
                 game_statistics$Welke + game_statistics$Scott
               + game_statistics$Joyce)
head(game_statistics )
projected_runs<-lm(game_statistics$total_runs ~ game_statistics$Extra)
confint(projected_runs, level = 0.95)

game_statistics$Extra <- with(game_statistics, ifelse(hp_ump_name == 'Jim Joyce' , 1, 0))
projected_runs<-lm(game_statistics$total_runs ~ game_statistics$Extra)
confint(projected_runs, level = 0.95)

game_statistics$Extra <- with(game_statistics, ifelse(hp_ump_name == 'Dale Scott' , 1, 0))
projected_runs<-lm(game_statistics$total_runs ~ game_statistics$Extra)
confint(projected_runs, level = 0.95)

game_statistics$Extra <- with(game_statistics, ifelse(hp_ump_name == 'Tim Welke' , 1, 0))
projected_runs<-lm(game_statistics$total_runs ~ game_statistics$Extra)
confint(projected_runs, level = 0.95)

game_statistics$Extra <- with(game_statistics, ifelse(hp_ump_name == 'Brian Gorman' , 1, 0))
projected_runs<-lm(game_statistics$total_runs ~ game_statistics$Extra)
confint(projected_runs, level = 0.95)


head(game_statisticsBos )
projected_runs<-lm(game_statisticsBos$total_runs ~ game_statisticsBos$Ump)

game_statisticsBos$Ump <- with(game_statisticsBos, ifelse(hp_ump_name == 'Dale Scott' , 0, 1))

head(game_statisticsBos )
projected_runs<-lm(game_statisticsBos$total_runs ~ game_statisticsBos$Ump)

game_statisticsBos$Ump <- with(game_statisticsBos, ifelse(hp_ump_name == 'Tim Welke' , 0, 1))

head(game_statisticsBos )
projected_runs<-lm(game_statisticsBos$total_runs ~ game_statisticsBos$Ump)

confint(projected_runs, level = 0.95)
Since this problem set was created, community TA therealnod suggested an alternative way for the student to add total_runs to the data frame in a similar manner, just in 2 steps so it is easier to read:
  
  total_runs <- with(game_statistics, home_score + visitor_score)

game_statistics["total_runs"] <- total_runs
As a checking point, a new variable should appear in the game_statistics data frame. Now, we will shrink our data frame to just total time elapsed, total outs recorded, and total runs in the game.
total_runs <- with(game_statistics, home_score + visitor_score)

total_time_data <- game_statistics[c('game_minutes', 'total_runs', 'outs')]
require('lattice')

splom(total_time_data)
cor(game_minutes, outs)

plot(total_runs, outs)

cor(game_minutes, outs)
cor(game_minutes, total_runs)
cor(total_runs, outs)
plot(total_runs, outs)
projected_minutes <- lm(game_minutes ~ total_runs + outs)
projected_minutes <- lm(game_minutes ~ total_runs )
projected_minutes <- lm(game_minutes ~   outs)

projected_minutes <- lm(game_minutes ~ total_runs + outs)
game_statistics$RedSox_playing <- with(game_statistics, ifelse(home == 'BOS' | visitor == 'BOS', 1, 0))

Additionally, we can create a data frame of just Boston games:
  NotRedSox_games <- game_statistics[game_statistics$RedSox_playing == 0,]

  RedSox_games <- game_statistics[game_statistics$RedSox_playing == 1,]
hist(RedSox_games$total_runs,breaks=40)
mean(game_statistics$total_runs)

Brian Gorman, Jim Joyce, Dale Scott, and Tim Welke.

To start, we will create 4 dummy variables indicating when each of these umpires were the home plate umpire:
game_statistics$BrianGorman <- with(game_statistics, ifelse(hp_ump_name == 'Brian Gorman', 1, 0))
game_statistics$JimJoyce <- with(game_statistics, ifelse(hp_ump_name == 'Jim Joyce', 1, 0))
game_statistics$DaleScott <- with(game_statistics, ifelse(hp_ump_name == 'Dale Scott', 1, 0))
game_statistics$TimWelke <- with(game_statistics, ifelse(hp_ump_name == 'Tim Welke', 1, 0))

BrianGorman_games <- game_statistics[game_statistics$BrianGorman == 1,]
JimJoyce_games <- game_statistics[game_statistics$JimJoyce == 1,]
DaleScott_games <- game_statistics[game_statistics$DaleScott == 1,]
TimWelke_games <- game_statistics[game_statistics$TimWelke == 1,]

mean(game_statistics$total_runs)
mean(BrianGorman_games$total_runs)
mean(JimJoyce_games$total_runs)
mean(DaleScott_games$total_runs)
mean(TimWelke_games$total_runs)

