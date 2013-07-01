library(ggplot2)

# one would like to view the data set first
# View(mpg)

g <- ggplot(mpg, aes(x=displ, y=hwy)) + geom_point()
g   # view the original scatter plot first

# what facet does here is that it treats the "original" data
# with a category variable(discrete var: drv), and plot the figure
# using same axis ranges but only "sub" data.
g + facet_grid(drv ~ .)
# now the category var: cyl
g + facet_grid(. ~ cyl)
# now verticl var: drv, horizontal var: cyl
g + facet_grid(drv ~ cyl)


