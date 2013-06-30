library(gcookbook)   # import required data sets
str(cabbage_exp)  # take a look at dataset cabbage_exp

# === Grouping ===
# group var: Cultivar (determine the 'fill' color)
# position='dodge' make the bars 'dodge' other groups of bars
ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) + 
  geom_bar(stat='identity', position='dodge')

# === Interaction ===
ggplot(cabbage_exp, aes(x=interaction(Cultivar, Date), y=Weight, fill=Cultivar)) + 
  geom_bar(stat='identity')