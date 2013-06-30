library(ggplot2)    # always load ggplot2 library first

# === basic ===
curve(x^3 - 7*x, from=-4, to=4)

# --- plot a user-defined function ---
# in: numeric vector, out: numeric vector
cumfun <- function(xvec) {
  1/(1 + exp(-xvec + 5))
}
curve(cumfun(x), from=0, to=10)
curve(1-cumfun(x), add=TRUE, col='green')   # append to same figure


# === qplot() ===
qplot(c(0, 10), fun=cumfun, stat='function', geom='line')

# === ggplot() ===
# try geom='point'
g <- ggplot(data.frame(x=c(0, 10)), aes(x=x))   # store it first
g + stat_function(fun=cumfun, geom='line')  # try geom='point'