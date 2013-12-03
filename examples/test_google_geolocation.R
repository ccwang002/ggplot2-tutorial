location <- 'National+Taiwan+University'
url_string <- paste('http://maps.googleapis.com/maps/api/geocode/json?sensor=false&address=', location, sep = '')
ret_json <- fromJSON(paste(readLines(url(url_string)), collapse=""))
if(ret_json$status != 'OK') stop('location geocoding error.')
loc <- ret_json$results[[1]]$geometry$location
center <- c(loc$lat, loc$lng)
closeAllConnections()
