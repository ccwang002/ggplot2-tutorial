library(ggplot2)

# bar graph (for more info, refer to ../ex_bar)
ggplot(BOD, aes(x=Time, y=demand)) + geom_bar(stat='identity')
# line graph
ggplot(BOD, aes(x=Time, y=demand)) + geom_line()

# if x is a factor, they should be set as same group (group=1)
# so they will be properly connected
BOD1 <- BOD
BOD1$Time <- factor(BOD1$Time)
ggplot(BOD, aes(x=Time, y=demand, group=1)) + geom_line()

g <- ggplot(BOD, aes(x=Time, y=demand))

# change y limit (they have same results)
g + geom_line() + ylim(0, max(BOD$demand))
g + geom_line() + expand_limits(y=0)

library(gcookbook)

ggplot(worldpop, aes(x=Year, y=Population)) + 
  geom_line() + geom_point() + scale_y_log10()