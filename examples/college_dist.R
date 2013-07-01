# Converting data from Wide to Long
library(reshape2)
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
g + geom_bar(stat='identity', color='black') + 
  scale_fill_brewer(palette='Pastel1')

