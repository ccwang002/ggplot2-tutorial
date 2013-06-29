library(ggplot2)  # always load ggplot2 library first

# === basic ===
plot(pressure$temperature, pressure$pressure, type="l")   # plot the line
points(pressure$temperature, pressure$pressure)   # plot the points
# add additional line and point
lines(pressure$temperature, pressure$pressure/2, col='green')
points(pressure$temperature, pressure$pressure/2, col='green')

# === qplot() ===
qplot(pressure$temperature, pressure$pressure, geom=c('line', 'point'))
# or added with an extra 'point' layer
qplot(pressure$temperature, pressure$pressure, geom='line') + geom_point()

# === ggplot() ===
ggplot(pressure, aes(x=temperature, y=pressure)) + geom_line() + geom_point()
