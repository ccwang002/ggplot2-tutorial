library(ggplot2)    # always load ggplot2 library first
str(BOD)    # you may want to take a look at what BOD contains

# === basic ===
barplot(BOD$demand, names.arg=BOD$Time) # names.arg for labelling

# --- start from counting ---
table(mtcars$cyl)
barplot(table(mtcars$cyl))

# === qplot() ===
# see what happens if no geom nor stat given (ANS: back to scatter plot)
qplot(BOD$Time, BOD$demand, geom="bar", stat="identity")  
qplot(Time, demand, data=BOD, geom="bar", stat="identity")  # equivalent statement
# factor to remove empty time slot
qplot(factor(BOD$Time), BOD$demand, geom="bar", stat="identity")
qplot(factor(Time), demand, data=BOD, geom="bar", stat="identity")   # equivalent statement

# --- counting ---
qplot(mtcars$cyl)   # treat cyl as 4, 5, 6, ...
qplot(factor(mtcars$cyl))    # treat cyl as factors


# === ggplot() ===
ggplot(BOD, aes(x=Time, y=demand)) + geom_bar(stat='identity')
ggplot(BOD, aes(x=factor(Time), y=demand)) + geom_bar(stat='identity')

# --- counting ---
ggplot(mtcars, aes(x=factor(cyl))) + geom_bar()