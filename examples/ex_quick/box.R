library(ggplot2)    # always load ggplot2 library first
str(ToothGrowth)    # you may want to take a look at the dataset also

# === basic ===
# if x is a factor, plot by default generates boxplot
plot(ToothGrowth$supp, ToothGrowth$len)
# use factor's label as x-axis
plot(ToothGrowth$supp, ToothGrowth$len, names=levels(ToothGrowth$supp))
# boxplot using formula syntax
boxplot(len ~ supp, data=ToothGrowth)
# rewrite formula putting interaction of 2 vars: supp and dose
boxplot(len ~ supp + dose, data=ToothGrowth)

# === qplot() ===
qplot(supp, len, data=ToothGrowth, geom='boxplot')
# interaction of 2 vars: supp and dose
qplot(interaction(supp, dose), len, data=ToothGrowth)
# note that outliers are different from the basic result
qplot(interaction(supp, dose), len, data=ToothGrowth, geom='boxplot')

# === ggplot() ===
ggplot(ToothGrowth, aes(x=supp, y=len)) + geom_boxplot()
ggplot(ToothGrowth, aes(x=interaction(supp, dose), y=len)) + geom_boxplot()