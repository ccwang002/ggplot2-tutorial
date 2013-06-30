library(ggplot2)    # always load ggplot2 library first

# === basic ===
hist(mtcars$mpg)
hist(mtcars$mpg, breaks=10)

# === qplot() ===
qplot(mtcars$mpg)   # a warning message will be shown
qplot(mpg, data=mtcars, binwidth=5)

# === ggplot() ===
ggplot(mtcars, aes(x=mpg)) + geom_histogram(binwidth=5)
ggplot(mtcars, aes(x=mpg)) + geom_histogram(binwidth=5, color='grey')