library(ggplot2)

library(plyr)
# Summarize(compress groups of observations to one entity per group)
# using the group mean
# group is based on 2 vars: supp and dose
tg <- ddply(ToothGrowth, c("supp", "dose"), summarize, length=mean(len))

# we want to plot two lines base on supp (supp = OJ or VC)
# supp determines color
ggplot(tg, aes(x=dose, y=length, color=supp)) + geom_line()
# supp determines linetype
ggplot(tg, aes(x=dose, y=length, linetype=supp)) + geom_line()
# supp determines both shape and color
ggplot(tg, aes(x=dose, y=length, shape=supp, color=supp)) + 
  geom_line() + geom_point(size=4)
# dodge lines and point (they should be set together)
# all points will be misaligned.
ggplot(tg, aes(x=dose, y=length, shape=supp, color=supp)) + 
  geom_line(position=position_dodge(0.2)) + 
  geom_point(position=position_dodge(0.2), size=4)

# set the shape(color), determined by discrete variable(supp), 
# explicityly or manually
ggplot(tg, aes(x=dose, y=length, shape=supp, color=supp, linetype=supp)) + 
  geom_line() + geom_point(size=4) + 
  scale_color_brewer(palette='Set1') +
  scale_shape_manual(values=c(20, 6)) + 
  scale_linetype_manual(values=c('dotted', 'dashed'))
