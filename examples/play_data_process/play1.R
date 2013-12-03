# source('read_raw.R')

df.ntu <- read.csv('NTU_B02new_sexratio.csv')
df.ntu[, c("女", "男")]
df.ntu[df.ntu$女 > 30, ]
df.ntu[
  df.ntu$女 > 30 & 
    df.ntu$男 < 20, 
]

# get a quick summary of the data
summary(df.ntu)
ncol(df.ntu)
nrow(df.ntu)

library(ggplot2)
ggplot(aes(x=df.ntu[[1]], y=df.ntu[[2]]), data=df.ntu) + 
  geom_bar(stat='identity') + 
  theme(text=element_text(family="Heiti TC Medium", size=10))

colnames(df.ntu) <- c("disp", "total", "male", "female", "ratio")
ggplot(df.ntu[c(1, 10, 20, 30, 40, 50, 56), ], aes(x=disp, y=total)) + 
  geom_bar(stat='identity') + 
  theme(text=element_text(family="Heiti TC Medium", size=10))

ggplot(df.ntu, aes(x=female, y=male, color=disp)) + 
  geom_point(size=5, show_guide=FALSE)

