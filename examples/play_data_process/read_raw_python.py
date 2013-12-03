# recommend using Python 3
# 因為我們處理得是中文字，
# 用 UTF-8 比較容易
# 程式碼也使用 UTF-8 儲存
import pandas as pd
RAW_PATH = 'NTU_B02new_sexratio.raw.txt'
CSV_PATH = 'NTU_B02new_sexratio.csv'
df = pd.read_table(
    RAW_PATH,    # 檔案路徑
    sep='[ ]*',  # 分隔符號
    skiprows=11  # 忽略前 11 行不讀
)
df = df.dropna()  # df.head() 可以看到第 0 列是 NaN
# 去「人」
df.ix[:, 1] = df.icol(1).apply(lambda x: x[:-1])
df.to_csv(CSV_PATH, index=False)  # 存檔
df2 = pd.read_csv(CSV_PATH)  # 測試，再讀回來
