# always load ggplot2 library first
library(ggplot2)

# === basic ===
plot(mtcars$wt, mtcars$mpg)
# === qplot() ===
qplot(mtcars$wt, mtcars$mpg)
qplot(wt, mpg, data=mtcars)  # if they are in same data.frame
# === ggplot() ===
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()
