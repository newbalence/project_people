import pandas as pd
from glob import glob
import numpy as np
file_names = glob("./code/project02/seoul_sales/*.csv")
#해당 폴더에 있는 csv 파일 모두 불러오기
total = pd.DataFrame()

for file_name in file_names:
    temp = pd.read_csv(file_name, sep=",", encoding="euc-kr")
    total = pd.concat([total, temp])

data_columns = total.columns

def t(a) :
    return a.replace("_", "").replace("~", "").replace(" ", "").strip()
    #모든 csv파일의 컬럼명을 동일하게 맞춰주기 위해 " ", "_", "~" 를 모두 지움

data_columns = list(map(t, data_columns))
# print(data_columns)

df = pd.read_csv("./code/project02/table_name.csv")
#바꿀 영어 변수 명이 있는 csv파일
df["구분"] = df["구분"].apply(t)

# print(df)
print("*"*50)

total.columns = map(t, total.columns)

data_name = df["용어"][df["구분"].isin([x for x in data_columns])]
data_co = df["구분"][df["구분"].isin([x for x in data_columns])]
names = {t : d for t, d in zip(data_co, data_name)}

total.rename(columns = names, inplace = True)
print(total)
total_final = total.sort_values(["year_code", "Gu_code"], ascending=True)
print(total_final)

total_final.to_csv("./code/project02/df_seoul_sales.csv", encoding="utf-8", index=False)