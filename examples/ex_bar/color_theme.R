library(ggplot2)
library(gcookbook)
# continue from group_dodge.R

g <- ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) + 
  geom_bar(stat='identity', position='dodge', color='brown')

# use different color themes, i.e., palettes
g + scale_fill_brewer(palette='Pastel1')
g + scale_fill_brewer(palette='Blues')
g + scale_fill_brewer(palette='Greens')

# palettes like 'Blues' or 'Greens' serve as good color theme for large number of groups
ggplot(cabbage_exp, aes(x=Cultivar, y=Weight, fill=Date)) + 
  geom_bar(stat='identity', position='dodge', color='black') + 
  scale_fill_brewer(palette='Blues')