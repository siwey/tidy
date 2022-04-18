library(tidyverse)
a <- read_csv("/Users/simonwey/Repos/DP_LIVE_17042022205237743.csv")
b <- subset(a,c(FREQUENCY=="A" & SUBJECT=="TOT"))
c <- select(b, c("TIME","LOCATION","Value"))
c1 <-subset(c, TIME>="2010")#& LOCATION==c("AUS","CHE","DEU"))
d <- pivot_wider(c,names_from="TIME", values_from="Value")
ggplot(data=c1, aes(x=as.Date(TIME,"%Y"), y=Value, group=LOCATION)) +
  geom_line(aes(color=LOCATION))