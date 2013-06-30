library(ggplot2)
library(gcookbook)  # import required data sets

# for stacked bar plots, one should first 'group' ones data
# first please refer to group_dodge.R
# dodged version
ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) + 
  geom_bar(stat='identity', position='dodge')
# stacked version (no postition given) 
ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) + 
  geom_bar(stat='identity')

# make a proportional (or 100%) stacked bar graph
library(plyr)
# perform a group-wise transform, grouping by 'Date'
# In each group (var: Date), it calucates the percentage weight 
# of each entity (which happens to correspond to var: Cultivar) 
# out of total weight
ce <- ddply(cabbage_exp, 'Date', transform,
            percent_weight = Weight / sum(Weight) * 100)

ggplot(ce, aes(x=Date, y=percent_weight, fill=Cultivar)) +
  geom_bar(stat="identity", color="black") +
  scale_fill_brewer(palette='Pastel1')