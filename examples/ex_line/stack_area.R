library(ggplot2)
library(gcookbook)

head(uspopage)  # requires long format (wide -> long)

ggplot(uspopage, aes(x=Year, y=Thousands, fill=AgeGroup)) + 
  geom_area(color='black', size=.2, alpha=.6) + 
  scale_fill_brewer(palette='Blues')

# reverse the legend level
ggplot(uspopage, aes(x=Year, y=Thousands, fill=AgeGroup)) + 
  geom_area(color='black', size=.2, alpha=.6) + 
  scale_fill_brewer(palette='Blues', breaks=rev(levels(uspopage$AgeGroup)))

# lines only appear between stacks
# use descending order: desc() to reorder stacking order
library(plyr)
ggplot(uspopage, aes(x=Year, y=Thousands, fill=AgeGroup, order=desc(AgeGroup))) + 
  geom_area(color=NA, alpha=.6) + 
  scale_fill_brewer(palette='Blues') + 
  geom_line(position='stack', color='black', size=.4)
