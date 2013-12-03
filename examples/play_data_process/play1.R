# source('read_raw.R')

df <- read.csv('NTU_B02new_sexratio.csv')
df.ntu_sexratio[, c("女", "男")]
df.ntu_sexratio[df.ntu_sexratio$女 > 30, ]
df.ntu_sexratio[
  df.ntu_sexratio$女 > 30 & 
  df.ntu_sexratio$男 < 20, 
]

# get a quick summary of the data
summary(df.ntu_sexratio)

library(ggplot2)
ggplot(aes(x=df.ntu_sexratio[[1]], y=df.ntu_sexratio[[2]]), data=df.ntu_sexratio) + geom_bar(stat='identity') + 
  theme(text=element_text(family="Heiti TC Medium", size=10))
