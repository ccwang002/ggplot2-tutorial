library(ggplot2)
library(reshape2)
load('twPT2013.RData')
# convert Wide to Long
twPT <- melt(twPT2013, 
             id.vars=c('schoolyear', 'year'),  # which should be fixed 
             variable.name='score',   
             value.name='count')
# don't know why, but score after converstion begins from 1
twPT$score <- as.numeric(twPT$score) - 1
# make score region for every 10 levels
twPT$scorecls <- cut(twPT$score, breaks=c(seq(from=-1, to=70, by=10), 75),
                     labels=c('<10', '10-19', '20-29', '30-39', '40-49', 
                              '50-59','60-69', '> 69'))
twPT$schoolyear <- factor(twPT$schoolyear)

# === Overlapped Area Plot ===
# default draw theme makes the graph in mess
ggplot(twPT, aes(x=score, y=count, group=schoolyear, fill=schoolyear)) + 
  geom_area(alpha=.8, position='identity', color='black', size=0.2) 

# If we wants to change the 'fill' style by using default palettes
# we will find that pre-defined palettes do not contain enough colors.
ggplot(twPT, aes(x=score, y=count, group=schoolyear, fill=schoolyear)) + 
  geom_area(alpha=.8, position='identity', color='black', size=0.2) +
  scale_fill_brewer(palette='Blues')
# a waring message will be shown:
# n too large, allowed maximum for palette Blues is 9

# If the number of groups exceeds the number of colors defined in palette,
# one could try build their own palette , but having too many groups shown
# is not recommended.
# Here we show using colorRampPalette() with input two colors to generate 
# a set of gradient color between the two given colors.
bluegrad_fnt <- colorRampPalette(c('#0C0C63', 'white'))
# This function takes a arugment n, which will be the number of colors generated.
bluegrad_fnt(3)
bluegrad_fnt(10)

# pass the generated color vector in to scale_fill_manual()
ggplot(twPT, aes(x=score, y=count, group=schoolyear, fill=schoolyear)) + 
  geom_area(alpha=1, position='identity', color='black', size=0.2) +
  scale_fill_manual(values=bluegrad_fnt(11))

# This is acutally the same way as how scale_fill_grey() works,
# which generated grey gradient only. 
# We change the whole theme to make the figure simpler.
ggplot(twPT, aes(x=score, y=count, group=schoolyear, fill=schoolyear)) + 
  geom_area(alpha=1, position='identity', color='black', size=0.2) +
  scale_fill_grey(start=0.05, end=0.9) + theme_bw()


# === Overlapped Percentage Plot ===
# if we normalized the student count by total students getting test per year
# the figure will be more informative
library(plyr)
twPT <- ddply(twPT, "schoolyear", transform,
              percent_count = count / sum(count) * 100)

# check the result
by(twPT$percent_count, twPT$schoolyear, sum)

# becuase the annual change of total student is not significant,
# the main shape remains
ggplot(twPT, aes(x=score, y=percent_count, group=schoolyear, fill=schoolyear)) + 
  geom_area(alpha=1, position='identity', color='black', size=0.2) +
  scale_fill_manual(values=bluegrad_fnt(11))

# === Line Plot ===
# this will be a little messy, but slightly better than 
# what excel generated in original file.
ggplot(twPT, aes(x=score, y=percent_count, group=schoolyear, 
                 color=schoolyear, size=schoolyear)) + 
  geom_line(position='identity') +
  scale_size_discrete(range = c(1.5, 0.2)) +  # scale the line width (param: size)
  theme_bw()                                  # the default size scale is way too big

# combined with area plot
ggplot(twPT, aes(x=score, y=percent_count, group=schoolyear, 
                 size=schoolyear, fill=schoolyear)) +
  geom_area(position='identity', alpha = 0.8, color='#333333') +
  scale_size_discrete(range = c(1.5, 0.2)) +
  scale_fill_manual(values=bluegrad_fnt(11)) + theme_bw()


# === Stacked Bar Plot ===
# Now we plot the stacked bar plot
ggplot(twPT, aes(x=schoolyear, y=count, fill=scorecls)) + 
  geom_bar(stat='identity') +
  scale_fill_brewer(palette='Blues', breaks=rev(levels(twPT$scorecls)))

# we define another set of colorPalette
bluegrad_inv_fnt <- colorRampPalette(c('white', '#0C0C63'))
ggplot(twPT, aes(x=schoolyear, y=count, fill=scorecls)) + 
  geom_bar(stat='identity') + 
  scale_fill_manual(values=bluegrad_inv_fnt(8), 
                    breaks=rev(levels(twPT$scorecls)))

# now using the percentage of student count to plot
# setting y=percent_count
ggplot(twPT, aes(x=schoolyear, y=percent_count, fill=scorecls)) + 
  geom_bar(stat='identity') + 
  scale_fill_manual(values=bluegrad_inv_fnt(8), 
                    breaks=rev(levels(twPT$scorecls)))
  