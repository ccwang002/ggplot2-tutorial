library(ggplot2)
# change line style
ggplot(BOD, aes(x=Time, y=demand)) + geom_line(linetype='dashed', size=1, colour='red')

# change point style
ggplot(BOD, aes(x=Time, y=demand)) +
  geom_line() +
  geom_point(size=5, shape=21, colour='darkred', fill='pink')