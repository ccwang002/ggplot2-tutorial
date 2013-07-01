# parse outsource csv files

# === input: twPT2013.csv ===
# one can skim over the csv content by `$ head twPT2013.csv`
# it contains comments starting with '#'
twPT2013 <- read.csv("twPT2013.csv", 
                     stringsAsFactors=FALSE,
                     comment.char='#')
# specify column names
namelist <- c('schoolyear', 'year', 0:75)
# save
names(twPT2013) <- namelist
save(list='twPT2013', file='twPT2013.RData')

# === input: twCollegeDist2013.csv ===
twCollegeDist2013 <- read.csv('twCollegeDist2013.csv',
                              stringsAsFactors=FALSE, 
                              comment.char='#')
save(list='twCollegeDist2013', file='twCollegeDist2013.RData')
