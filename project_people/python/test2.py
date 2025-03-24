import pandas as pd
from glob import glob

file_names = glob("/project_data/seoul_store/*.csv")
total = pd.DataFrame()

for file_name in file_names:
    temp = pd.read_csv(file_name, sep=",", encoding="euc-kr")
    total = pd.concat([total, temp])

print(total)

print(total.to_sql())


# df = pd.read_csv("/project_data/2024_seoul_area.csv", encoding="euc-kr")
# df.columns = ["코드", "동명", "x좌표", "y좌표", "면적"]
# print(df)