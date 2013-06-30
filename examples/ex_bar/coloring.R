library(ggplot2)
library(gcookbook)
# continue from color_theme.R

# the original dataset: climate is somewhat too big for demo
#  => subset it
csub <- subset(climate, Source=='Berkeley' & Year >= 1900)

# we want hightlight the difference of having positive and negative
# temperature anamoly for 10-year smoothing (var: Anomaly10y)
# so group them by adding a new column 'pos'
csub$pos <- csub$Anomaly10y >= 0

# A Warning will be shown:
# Stacking not well defined when ymin != 0 
ggplot(csub, aes(x=Year, y=Anomaly10y, fill=pos)) + geom_bar(stat='identity')

# define the position explicitly by "poisition='identity'"
g <- ggplot(csub, aes(x=Year, y=Anomaly10y, fill=pos)) 
g + geom_bar(stat='identity', position='identity') + guides(fill=FALSE)

# change the width of bars (var: width, default is 0.9)
g + geom_bar(stat='identity', position='identity', width=0.6) + guides(fill=FALSE)

# custom coloring
g + geom_bar(stat='identity', position='identity', width=0.8, size=0.3, color='black') +
  scale_fill_manual(values=c('#80BBFF', '#D86C82'), guide=FALSE)
