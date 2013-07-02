library(ggplot2)
library(reshape2)
load('twPT2013.RData')
# convert Wide to Long
twPT <- melt(twPT2013, 
             id.vars=c('schoolyear', 'year'),  # which should be fixed 
             variable.name='score',   
             value.name='count')
twPT$score <- as.numeric(twPT$score) - 1
twPT$scorecls <- cut(twPT$score, breaks=c(seq(from=-1, to=70, by=10), 75),
                     labels=c('<10', '10-19', '20-29', '30-39', '40-49', 
                              '50-59','60-69', '> 69'))

twPT$schoolyear <- as.integer(twPT$schoolyear)
twPT$schoolyear <- factor(twPT$schoolyear)

# If the number of groups exceeds the number of colors defined in palette,
# one could try build their own palette , but having too many groups shown
# is not recommended.
# Here we show using colorRampPalette() with input two colors to generate 
# a set of gradient color between the two given colors.
bluegrad_fnt <- colorRampPalette(c('#0C0C63', 'white'))

# the overlapped area plot
# default draw theme makes the graph in mess
ggplot(twPT, aes(x=score, y=count, group=schoolyear, fill=schoolyear)) + 
  geom_area(alpha=.8, position='identity', color='black', size=0.2) 

ggplot(twPT, aes(x=score, y=count, group=schoolyear, fill=schoolyear)) + 
  geom_area(alpha=1, position='identity', color='black', size=0.2) +
  scale_fill_manual(values=bluegrad_fnt(11))
  
ggplot(twPT, aes(x=score, y=count, group=schoolyear, fill=schoolyear)) + 
  geom_area(alpha=1, position='identity', color='black', size=0.2) +
  scale_fill_grey(start=0.05, end=0.9) + theme_bw()


# Now we plot the stacked bar plot
ggplot(twPT, aes(x=schoolyear, y=count, fill=scorecls)) + 
  geom_bar(stat='identity') +
  scale_fill_brewer(palette='Blues', breaks=rev(levels(twPT$scorecls)))

bluegrad_inv_fnt <- colorRampPalette(c('white', '#0C0C63'))
ggplot(twPT, aes(x=schoolyear, y=count, fill=scorecls)) + 
  geom_bar(stat='identity') + 
  scale_fill_manual(values=bluegrad_inv_fnt(8), 
                    breaks=rev(levels(twPT$scorecls)))
  