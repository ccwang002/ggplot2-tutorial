# This file will plot a bar graph using dataset twCollegeDist2013
load('twCollegeDist2013.RData')

# === Converting data from Wide to Long ===
# by View(twCollegeDist2013), this dataset does not fit the 'good' dataset to plot,
# which each row contains only one oberservation. 
# If we want to plot a stack graph, then actually we are using 'three' columns 
# at a same time, which ggplot2 cannot handle.
# So we have to convert our data and divide three columns of one row into three 
# different rows. It is usually called "convert wide to long".
library(reshape2)
twCD <- melt(twCollegeDist2013, 
             id.vars=c('schoolyear', 'year'),  # which should be fixed 
             variable.name='category',   
             value.name='count')
# variable.name: 
#   the name of the column where names of the columns other than id.vars 
#   will be put under
# value.name:
#   the name of the column contain the value of columns other than id.vars
# 
# For example, see the result by View(twCD), comparing to twCollegeDist2013

library(ggplot2)
g <- ggplot(twCD, aes(x=schoolyear, y=count, fill=category))

# dodge
g + geom_bar(stat='identity', width=0.8, 
             position=position_dodge(0.7))

# stack
gs <- g + geom_bar(stat='identity', color='black') + 
  scale_fill_brewer(palette='Pastel1')
gs  # view the stacked bar figure 

# === Annotation ===
# if we want to label the count of each category, directly set the 
# position y of the label will fail since they have been stacked
gs + geom_text(aes(y=count, label=count))

# To annote stacked labels properly, we need to provide(generate) 
# corrent y position of each labels after stacked.
# This can be done by using ddply of plyr
library(plyr)
twCD <- ddply(twCD, "schoolyear", transform, 
              label_y=cumsum(count) - 0.5 * count)

# then we can label stacked bars correctly
ggplot(twCD, aes(x=schoolyear, y=count, fill=category)) +
  geom_bar(stat='identity', color='black') + 
  scale_fill_brewer(palette='Pastel1') + 
  geom_text(aes(y=label_y, label=count), color='black', size=5)


# === Proportional Stacked Plot ===
# Similar way as labeling stacked bar, 
# the percentage of each category should be computed.
twCD <- ddply(twCD, "schoolyear", transform,
              percent_count = count / sum(count) * 100)

percent_g <- ggplot(twCD, aes(x=schoolyear, y=percent_count, fill=category)) +
  geom_bar(stat='identity', color='black') + 
  scale_fill_brewer(palette='Set3')

# here demonstrates how to change ticks of axis x and their labels.
percent_g + scale_x_continuous(breaks=c(92, 98, 101), 
                               labels=c('Elder', 'Mine', 'Younger'))