# This example is adapted from 
#    https://github.com/hadley/ggplot2/wiki/Crime-in-Downtown-Houston,-Texas-:-Combining-ggplot2-and-Google-Maps

library(jpeg)
library(reshape2)
library(ggplot2)
library(RGoogleMaps)
library(MASS)

theme_set(theme_bw())

ggimage <- function(image){
  require(ggplot2)
  
  if(length(dim(image)) == 2){
    message('creating black and white image...')
    image <- melt(image)
    names(image) <- c('row','column','fill')
    plot <- qplot(column, -row, data = image, geom = 'tile', fill = fill) +
      scale_fill_gradient(low = 'black', high = 'white')
  }
  
  if(length(dim(image)) == 3){
    message('creating color image...')
    image <- apply(image, 1:2, function(v) rgb(v[1], v[2], v[3]))
    image <- melt(image)
    names(image) <- c('row', 'column', 'fill')
    plot <- qplot(column, -row, data = image, geom = 'tile', fill = fill) +
      scale_fill_identity()  	
  }
  
  return(plot) # remove first pound for the image in the case study
}

img <- readJPEG("/Users/liang/Downloads/test.jpg")
g <- ggimage(img)
# writeJPEG(img, "test.jpg")
# ggsave(file)




