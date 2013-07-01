library(ggplot2)
# convert sunspot.year into dataframe
sunspotyear <- data.frame(
  Year = as.numeric(time(sunspot.year)),
  Sunspots = as.numeric(sunspot.year)
)

# using geom_area() for area plot
ggplot(sunspotyear, aes(x=Year, y=Sunspots)) + 
  geom_area(color='black', fill='blue', alpha=.3)

# outline the area using geom_line()
ggplot(sunspotyear, aes(x=Year, y=Sunspots)) + 
  geom_area(fill='blue', alpha=.3) +
  geom_line(color='black')
