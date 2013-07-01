# Converting data from Wide to Long
library(reshape2)
load('twCollegeDist2013.RData')
twCD <- melt(twCollegeDist2013, 
             id.vars=c('schoolyear', 'year'), 
             variable.name='category', 
             value.name='count')

library(ggplot2)
g <- ggplot(twCD, aes(x=schoolyear, y=count, fill=category))

# dodge
g + geom_bar(stat='identity', width=0.8, 
             position=position_dodge(0.7))

# stack
gs <- g + geom_bar(stat='identity', color='black') + 
  scale_fill_brewer(palette='Pastel1')
gs

# if we want to label the count of each category
# directly set the position y of the label will fail
# since they have been stacked
gs + geom_text(aes(y=count, label=count))

twCD <- ddply(twCD, "schoolyear", transform, 
              label_y=cumsum(count) - 0.5 * count)

ggplot(twCD, aes(x=schoolyear, y=count, fill=category)) +
  geom_bar(stat='identity', color='black') + 
  scale_fill_brewer(palette='Pastel1') + 
  geom_text(aes(y=label_y, label=count), color='black', size=5)


# === Proportional Stacked Plot ===
twCD <- ddply(twCD, "schoolyear", transform,
              percent_count = count / sum(count) * 100)

percent_g <- ggplot(twCD, aes(x=schoolyear, y=percent_count, fill=category)) +
  geom_bar(stat='identity', color='black') + 
  scale_fill_brewer(palette='Set3')

percent_g + scale_x_continuous(breaks=c(92, 98, 101), 
                               labels=c('Elder', 'Mine', 'Younger'))