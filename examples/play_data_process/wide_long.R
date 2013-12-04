library(reshape2)
library(ggplot2)

df.ntu <- read.csv('NTU_B02new_sexratio.csv')
colnames(df.ntu) <- c("disp", "total", "male", "female", "ratio")

# 只取一部份的資料
df.part <- df.ntu[c(1, 10, 20, 30, 40, 50, 56), ]
ggplot(df.part, aes(x=disp, y=total)) + 
  geom_bar(stat='identity') + 
  theme(text=element_text(family="Heiti TC Medium", size=10))

# Wide-to-Long
df.part$ratio <- NULL
df.part$total <- NULL

stack(df.part)
df.part <- melt(
  df.part,                # data.frame
  id.vars="disp",         # 每行固定出現的 (disp)
  variable.name="sex",    # 多欄合併之後存放欄位名，該欄的名稱 (存 male/female)
  value.name="number"     # 放值的地方
)

# 排序
df.part <- df.part[order(df.part$disp), ]

ggplot(df.part, aes(x=disp, y=number, fill=sex)) + 
  geom_bar(stat="identity", position="dodge") +
  theme(text=element_text(family="Heiti TC Medium", size=18))


# Long-to-Wide
dcast(df.part, disp ~ sex, value.var="number")