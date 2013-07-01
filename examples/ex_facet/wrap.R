library(ggplot2)

# continue from grid.R
g <- ggplot(mpg, aes(x=displ, y=hwy)) + geom_point()

# they have same result
g + facet_wrap(~ class, ncol=4)
g + facet_wrap(~ class, nrow=2)
