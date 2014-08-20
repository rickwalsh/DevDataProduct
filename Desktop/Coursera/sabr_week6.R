rox <- read.csv(file.choose())

rox <- read.csv('coors_park_factors.csv')

After this, we need to create home and away data frames as such:
  
  park <- subset(rox, home == "COL")

away <- subset(rox, visitor == "COL")

Finally, you will need to find the ratios for home and away home runs at Coors:
  
  park_ratio <- sum(park$home_hr + park$visitor_hr) / sum(park$home_ab + park$visitor_ab)

away_ratio <- sum(away$home_hr + away$visitor_hr) / sum(away$home_ab + away$visitor_ab)
park_ratio*100/away_ratio


pf_all<- read.csv('park_factors.csv')
pf_all <- within(pf_all, levels(home)[levels(home)=='FLO'] <- 'MIA')

pf_all <- within(pf_all, levels(visitor)[levels(visitor)=='FLO'] <- 'MIA')

pf_stat_teams <- function(stat, data, season_year=2013) {
  
  data <- subset(data, year == season_year)
  
  home_stat = paste("home", stat, sep="_")
  
  visitor_stat = paste("visitor", stat, sep="_")
  
  pf_stat = paste("pf", stat, season_year, sep="_")
  
  cols = c(home_stat, visitor_stat, "home_ab", "visitor_ab")
  
  park_sums <- ddply(data, .(home), colwise(sum, cols))
  
  away_sums <- ddply(data, .(visitor), colwise(sum, cols))
  
  park_sums$park_ratio <- (park_sums[[home_stat]] + park_sums[[visitor_stat]]) / (park_sums[["home_ab"]] + park_sums[["visitor_ab"]])
  
  away_sums$away_ratio <- (away_sums[[home_stat]] + away_sums[[visitor_stat]]) / (away_sums[["home_ab"]] + away_sums[["visitor_ab"]])
  
  pf <- merge(park_sums, away_sums, by.x="home", by.y="visitor")
  
  pf[[pf_stat]] <- with(pf, pf$park_ratio / pf$away_ratio)
  
  pf <- rename(pf, replace=c("home" = "team"))
  
  pf <- subset(pf, select = c("team", pf_stat))
  
  return(pf)
  
}
head(pf_all)
twob_2013 <- pf_stat_teams("2b", pf_all, season_year=2010)
min(twob_2013$pf_2b_2010)
bb_2013 <- pf_stat_teams("bb", pf_all, season_year=2011)
bb_2013[max(bb_2013$pf_bb_2011)

hr_2013 <- pf_stat_teams("hr", pf_all, season_year=2013)

data(Batting)
head(Batting)
