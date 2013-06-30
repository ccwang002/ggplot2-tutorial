library(ggplot2)

# probe the dataset
str(BOD)

# basic box plot
ggplot(BOD, aes(x=Time, y=demand)) + geom_bar(stat='identity')
# use facters as x-axis
weekabbrv <- c('Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun')
BOD$week <- factor(BOD$Time, levels=1:7, labels=weekabbrv)

# try denoting single fill/outline(colour) color
g <- ggplot(BOD, aes(x=week, y=demand)) 
g + geom_bar(stat='identity', fill='lightpink', color='black')

# using aes() to denote variable-dependent aesthetics 
ggplot(BOD, aes(x=week, y=demand, fill=week)) + geom_bar(stat='identity')
ggplot(BOD, aes(x=week, y=demand, color=week)) + geom_bar(stat='identity')

# to hide legends, append it with 
# "guides(fill=FALSE) or guides(color=False)"
ggplot(BOD, aes(x=week, y=demand, fill=week)) +
  geom_bar(stat='identity') + guides(fill=FALSE)
ggplot(BOD, aes(x=week, y=demand, color=week)) +
  geom_bar(stat='identity') + guides(color=FALSE)
