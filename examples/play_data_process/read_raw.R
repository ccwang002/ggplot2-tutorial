# use setwd() to get into right dir
# or it will show FileNotFound Error
df.ntu_sexratio <- read.table(
  'NTU_B02new_sexratio.raw.txt',
  comment.char="#",
  header=TRUE,
  strip.white=TRUE,
  stringsAsFactors=FALSE
)
# trim "人" to get total newcomers in each discipline
df.ntu_sexratio[[2]] <- as.integer(
  strsplit(df.ntu_sexratio[[2]], "人")
)
