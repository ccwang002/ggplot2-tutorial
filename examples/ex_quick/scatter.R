library(ggplot2)    # always load ggplot2 library first

# === basic ===
plot(mtcars$wt, mtcars$mpg)
# === qplot() ===
qplot(mtcars$wt, mtcars$mpg)
qplot(wt, mpg, data=mtcars)  # if they are in same data.frame
# === ggplot() ===
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()
