#데이터 전처리 모음
#한번에 다 실행하지 말고 사용할 부분만 복사해서 사용해야함

#csv파일 컬럼명 영어로 변경 후 "utf-8"로 저장 -> DB에 삽입하여 사용하기 위해 사용
import pandas as pd
from glob import glob
import numpy as np
file_names = glob("/project_data/seoul_road/*.csv")
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

df = pd.read_csv("/project02/table_name.csv")
#바꿀 영어 변수 명이 있는 csv파일
df["구분"] = df["구분"].apply(t)

print("*"*50)

total.columns = map(t, total.columns)

data_name = df["용어"][df["구분"].isin([x for x in data_columns])]
data_co = df["구분"][df["구분"].isin([x for x in data_columns])]
names = {t : d for t, d in zip(data_co, data_name)}

total.rename(columns = names, inplace = True)

total_final = total.sort_values(["year_code", "Gu_code"], ascending=True)
print(total_final)

total_final.to_csv("/project02/df_seoul_road.csv", encoding="utf-8", index=False)




#폐 & 개업 상권 변화지표에는 값이 없지만 추정매출에 값이 없을때 자치구를 기준으로 Null값을 채워주기 위해 사용
import pandas as pd
from glob import glob
import numpy as np

total = pd.read_csv("./code/project02/df_seoul_store_with_salse.csv")
total["Gu_code"] = total["Gu_code"].astype("string")
sales = pd.read_csv("./code/project02/sales_name.csv")

def substr(str):
    return str[:3]

# notna = total.query("year_code == 20241 & Gu_code == '11110' & service_code.str.contains('CS2')")
# summary = notna["Month_sales_pay"].sum()
# length = notna["Month_sales_pay"].notna().sum()

# avg = int(summary / length)
# print(avg)
# print(notna["Month_sales_pay"])
# print(notna["Month_sales_pay"].fillna(avg))

#year_code = 20241
year_code_uniques = total["year_code"].unique()
# print(year_code_uniques)
#해당 년분기

# service_code = "CS100002"
service_code_uniques = total["service_code"].apply(substr).unique()
# print(service_code_uniques)
#서비스 업종 코드


# D_code = 11110
D_code_uniques = total["Gu_code"].unique()
# print(D_code_uniques)
#자치구 코드

names = sales["name"]
#컬럼명

year_code_uniques = np.array([20241, 20242, 20243, 20244])

for year_code in year_code_uniques:
    print(year_code)
    for service_code in service_code_uniques:
        print(service_code)
        for D_code in D_code_uniques:
            print(D_code)
            a = total.query(f"year_code == {year_code} & Gu_code == '{D_code}' & service_code.str.contains('{service_code}')")
            for name in names:
                print(name)
                print("="*50)
                
                na_count = a[name].isna().sum()

                print(na_count)
                if na_count < 1:
                    print("Null값이 없습니다.")
                    continue

                summary = a[name].sum()
                length = a[name].notna().sum()
                avg = int(summary / length)
                # #매출평균 구하는값
                print(avg)
                
                # print(a[["year_code", "D_code", f"{name}"]])
                # #Null값이 있는 확인 하기 위한 코드 -> 즉, 변경하기 전 데이터
                b = total.query(f"year_code == {year_code} & Gu_code == '{D_code}' & service_code.str.contains('{service_code}')").copy()
                b[name].fillna(avg, inplace=True)
                print(b[name])
                total.update(b, join='left', overwrite=True)
                # print("query")
                # print(total.query(f"year_code == {year_code} & Gu_code == '{D_code}' & service_code.str.contains('{service_code}')"))
                # print("loc")
                # print(total.loc[(total["year_code"] == year_code) & (total["Gu_code"] == f"'{D_code}'"), name])
                print("=" * 50)

                
                #total[f"year_code == {year_code} & Gu_code == '{D_code}' & service_code.str.contains('{service_code}'"].fillna(avg, inplace=True)
                
#               # #Null값에 구한 값을 넣기 위한 코드 -> 즉, 변경한 후 데이터
            print(f"{D_code} 완료")
    print(f"{year_code} 완료")
    #total.to_csv("./code/project02/df_seoul_test.csv", encoding="utf-8", index=False)
print("Null 값 제거 완료")

# # total.to_csv("/project02/df_seoul_test.csv", encoding="utf-8", index=False)




#df_seoul_facilities파일 Null값 제거
import pandas as pd

df = pd.read_csv("./code/project02/df_seoul_facilities.csv")
print(df)

df.fillna(0, inplace=True)
print(df)
print(df.isna().sum())
df.to_csv("./code/project02/df_seoul_facilities_test.csv", encoding="utf-8", index=False)




#유동인구파일 형식 맞추기
import pandas as pd
from glob import glob
import numpy as np

name = pd.DataFrame()

#시 분 초 까지 나와있는 데이터 분기로 변환
def time_to_harf(text:str):
    year = text.split("-")[0]
    month = int(text.split("-")[1])
    harf = None
    if month <= 3:
        harf = 1
    elif month <= 6:
        harf = 2
    elif month <= 9:
        harf = 3
    else :
        harf = 4
    harf = f"{year}{harf}"
    return harf

#자치구 영어이름 Gu_code로 변환
def name_to_code(text:str):
    code = names.loc[names["자치구"] == text, "자치구_코드"].values[0]
    print(code)
    return code



dfs = glob("./code/project02/seoul_move/*.csv")
names = pd.read_csv("./code/project02/seoul_move.csv", encoding="euc-kr")

total = pd.DataFrame()

for data in dfs:
    df = pd.read_csv(data, sep=",", encoding="euc-kr")

    #Seoul_Grand_Park 지우기
    df = df[df["자치구"] != "Seoul_Grand_Park"]

    df["Gu_code"] = df["자치구"].apply(name_to_code)
    df["year_code"] = df["측정시간"].apply(time_to_harf)
    total = pd.concat([total, df])
    print("=" * 50)
    print(total)
    print("=" * 50)


total.to_csv("./code/project02/df_seoul_move_total.csv", encoding="utf-8", index=False)

print(total)
total.drop(columns=["모델번호", "시리얼", "측정시간", "지역", "자치구", "행정동", "등록일"], inplace=True)
a = total.groupby(["year_code", "Gu_code"]).sum().reset_index()

a.to_csv("./code/project02/df_seoul_move.csv", encoding="utf-8", index=False)






#2020 - 2022 데이터 정리

import pandas as pd
from glob import glob
import numpy as np

# dfs = glob("./code/project02/seoul_move/*.csv")
df = pd.read_csv("./code/project02/S-DoT_WALK_2021.01.01-01.03.csv", encoding="euc-kr")
names = pd.read_csv("./code/project02/seoul_move_2022_2020.csv")
g_names = pd.read_csv("./code/project02/seoul_move.csv", encoding="euc-kr")

def t(a) :
    return a.replace("_", "").replace("~", "").replace(" ", "").strip()

data_columns = names["주소"]
data_columns = list(map(t, data_columns))

data_name = g_names["자치구_코드"][g_names["자치구_명"].isin([x for x in data_columns])]
data_co = g_names["자치구_명"][g_names["자치구_명"].isin([x for x in data_columns])]
name = {t : d for t, d in zip(data_co, data_name)}

for data_column in data_columns:
    names["시리얼번호"] = name[data_column]

names.rename(columns = {"시리얼번호" : "Gu_code", "방문자 센서코드" : "Senser_code"}, inplace = True) 
names.to_csv("./code/project02/seoul_move_2022.csv", encoding="utf-8", index=False)




#2022이전 유동인구 데이터 23데이터와 맞추기
import pandas as pd
from glob import glob
import numpy as np

dfs = glob("./code/project02/seoul_move/*.csv")
# df = pd.read_csv("./code/project02/seoul_move/S-DoT_WALK_2024.12.30-01.05.csv", encoding="euc-kr")
names = pd.read_csv("./code/project02/seoul_move_name.csv")

#names["Gu_code"] = names["Gu_code"].astype(int).astype(str)

#names.to_csv("./code/project02/seoul_move_name.csv", index=False)

total = pd.DataFrame()

error_data = []

def time_to_harf(text:str):
    year = text[:4]
    month = int(text[4:6])
    harf = None
    if month <= 3:
        harf = 1
    elif month <= 6:
        harf = 2
    elif month <= 9:
        harf = 3
    else :
        harf = 4

    harf = f"{year}{harf}"
    return harf

for data in dfs:
#     print(data)
    print(data)
    try :
        df = pd.read_csv(data, sep=",", encoding="euc-kr", usecols=[0, 1, 2, 3, 4, 5, 6, 7])

        df["방문자수"] = pd.to_numeric(df['방문자수'], errors = 'coerce')

        df["year_code"] = pd.to_datetime(df["측정시간"], format="%Y-%m-%d_%H:%M:%S")
        df["year_code"] = df["year_code"].dt.year * 10 + df["year_code"].dt.quarter

        df["시리얼_4"] = df["시리얼"].astype(str).str[-4:]

        sensor_map = dict(zip(names["Senser_code"].astype(str), names["Gu_code"]))

        df["Gu_code"] = df["시리얼_4"].map(sensor_map)

        df = df.drop(columns=["모델번호","측정시간", "지역", "자치구", "행정동", "시리얼_4", "시리얼", "등록일"])
        df = df.dropna(subset=["Gu_code"])

        df = df.astype({"방문자수" : "int", "year_code" : "int", "Gu_code" : "int"})

        result = (df.groupby(["year_code", "Gu_code"]).sum().reset_index())

        #print(result)

        total = pd.concat([total, result], ignore_index=True)
        total = (total.groupby(["year_code", "Gu_code"]).sum().reset_index())
        print("=" * 50)
        print(total)
        print("=" * 50)
    except Exception as e:
        print("error", e)
        error_data.append(data)

#df.rename(columns = {"시리얼" : "Senser_code", "서버타입" : "Gu_code"}, inplace = True) 
#df.drop(columns=["기관 명", "모델명","사이트명", "날짜", "등록일자", "서버타입"], inplace=True)
#a = df.groupby(["year_code", "Gu_code"]).sum().reset_index()
total.to_csv("./code/project02/df_seoul_move_2023.csv", encoding="utf-8", index=False)

print(error_data)




#유동인구 데이터 23년 이후 분기 및 자치구별 방문자 수 평균 저장
import pandas as pd
from glob import glob
import numpy as np

dfs = glob("./code/project02/seoul_move_2022/*.csv")
df = pd.read_csv("./code/project02/seoul_move/S-DoT_WALK_2021.05.10-05.16.csv", encoding="euc-kr")
names = pd.read_csv("./code/project02/seoul_move_name.csv")

for data in dfs:
#     print(data)
    print(data)
    df = pd.read_csv(data, sep=",", encoding="euc-kr", usecols=[0, 1, 2, 3, 4, 5, 6, 7])

    df["year_code"] = pd.to_numeric(df['날짜'], errors = 'coerce')
    df["방문자수"] = pd.to_numeric(df['방문자수'], errors = 'coerce')
    df["year_code"] = df["year_code"].astype(str).str[:6]

    print(df["year_code"])
    df["year_code"] = pd.to_datetime(df["year_code"], format="%Y%m")
    df["year_code"] = df["year_code"].dt.year * 10 + df["year_code"].dt.quarter

    df["시리얼_4"] = df["시리얼"].astype(str).str[-4:]

    sensor_map = dict(zip(names["Senser_code"].astype(str), names["Gu_code"]))

    df["Gu_code"] = df["시리얼_4"].map(sensor_map)

    df = df.drop(columns=["기관 명", "모델명","사이트명", "날짜", "등록일자", "서버타입", "시리얼_4", "시리얼",])
    df = df.dropna(subset=["Gu_code"])

    df = df.astype({"방문자수" : "int", "year_code" : "int", "Gu_code" : "int"})

    result = (df.groupby(["year_code", "Gu_code"]).sum().reset_index())

    #print(result)

    total = pd.concat([total, result], ignore_index=True)
    total = (total.groupby(["year_code", "Gu_code"]).sum().reset_index())
    print("=" * 50)
    print(total)
    print("=" * 50)




#자치구 단위 생활인구 컬럼이름 변경 및 기준분기, 자치구로 병합

import pandas as pd
import numpy as np

total = pd.read_csv("./code/project02/자치구단위 서울생활인구 일별 집계표.csv", encoding="euc-kr")

data_columns = total.columns

def t(a) :
    return a.replace("_", "").replace("~", "").replace(" ", "").strip()
    #모든 csv파일의 컬럼명을 동일하게 맞춰주기 위해 " ", "_", "~" 를 모두 지움

data_columns = list(map(t, data_columns))

df = pd.read_csv("./code/project02/clean/move_table_name.CSV", encoding="euc-kr")
#바꿀 영어 변수 명이 있는 csv파일
df["o_name"] = df["o_name"].apply(t)

total.columns = map(t, total.columns)

total["기준일ID"] = pd.to_datetime(total["기준일ID"].astype(str), format="%Y%m%d")
total["기준일ID"] = total["기준일ID"].dt.year * 10 + total["기준일ID"].dt.quarter


data_name = df["t_name"][df["o_name"].isin([x for x in data_columns])]
data_co = df["o_name"][df["o_name"].isin([x for x in data_columns])]
names = {t : d for t, d in zip(data_co, data_name)}

total.rename(columns = names, inplace = True)

total_final = total.sort_values(["year_code", "Gu_code"], ascending=True)
print(total_final["year_code"].dtype)

total_final = total_final[total_final["Gu_code"] != 11000]
print(total_final)

result = total_final.groupby(["year_code", "Gu_code", "Gu_code_name"], as_index=False).mean()
print(result)

result = result[result["year_code"] > 20210]
result = result[result["year_code"] < 20250]
print(result)

result.to_csv("./code/project02/df_seoul_live.csv", encoding="utf-8", index=False)




#모든 파일 하나의 파일로 병합

import pandas as pd
import glob
import os

datas = glob.glob("./code/project02/final/*.csv")
num = 1
total = pd.read_csv("./code/project02/df_seoul_district_final.csv")
for data in datas:
    print(data)
    df = pd.read_csv(data)

    total = total.merge(df, how="left", on=("year_code", "Gu_code"), suffixes=(f'_x{num}', f'_y{num}'))
    num += 1


total = total.transpose().drop_duplicates().transpose()

total.rename(columns={
    "Gu_code_name_x1" : "Gu_code_name"
},inplace=True)

total.to_csv("./code/project02/df_seoul_all.csv", index=False)



