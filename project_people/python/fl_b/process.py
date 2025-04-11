#데이터 전처리 모음
#한번에 다 실행하지 말고 사용할 부분만 복사해서 사용해야함

#csv파일 컬럼명 영어로 변경 후 "utf-8"로 저장 -> DB에 삽입하여 사용하기 위해 사용
# import pandas as pd
# from glob import glob
# import numpy as np
# file_names = glob("/project_data/seoul_road/*.csv")
# #해당 폴더에 있는 csv 파일 모두 불러오기
# total = pd.DataFrame()

# for file_name in file_names:
#     temp = pd.read_csv(file_name, sep=",", encoding="euc-kr")
#     total = pd.concat([total, temp])

# data_columns = total.columns

# def t(a) :
#     return a.replace("_", "").replace("~", "").replace(" ", "").strip()
#     #모든 csv파일의 컬럼명을 동일하게 맞춰주기 위해 " ", "_", "~" 를 모두 지움

# data_columns = list(map(t, data_columns))

# df = pd.read_csv("/project02/table_name.csv")
# #바꿀 영어 변수 명이 있는 csv파일
# df["구분"] = df["구분"].apply(t)

# print("*"*50)

# total.columns = map(t, total.columns)

# data_name = df["용어"][df["구분"].isin([x for x in data_columns])]
# data_co = df["구분"][df["구분"].isin([x for x in data_columns])]
# names = {t : d for t, d in zip(data_co, data_name)}

# total.rename(columns = names, inplace = True)

# total_final = total.sort_values(["year_code", "Gu_code"], ascending=True)
# print(total_final)

# total_final.to_csv("/project02/df_seoul_road.csv", encoding="utf-8", index=False)




#폐 & 개업 상권 변화지표에는 값이 없지만 추정매출에 값이 없을때 자치구를 기준으로 Null값을 채워주기 위해 사용
import pandas as pd
from glob import glob
import numpy as np

total = pd.read_csv("./c팀/del/df_seoul_store_with_salse.csv")
total["Gu_code"] = total["Gu_code"].astype("string")
sales = pd.read_csv("./c팀/del/sales_name.csv")

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

#year_code_uniques = np.array([20241, 20242, 20243, 20244])

for year_code in year_code_uniques:
    print(year_code)
    for service_code in service_code_uniques:
        print(service_code)
        for D_code in D_code_uniques:
            #print(D_code)
            #a = total.query(f"year_code == {year_code} & Gu_code == '{D_code}' & service_code.str.contains('{service_code}')")
            condition = (
                (total["year_code"] == year_code) &
                (total["Gu_code"] == D_code) &
                (total["service_code"].str.startswith(service_code))
            )
            for name in names:
                target = total.loc[condition, :].copy()
                na_count = target[name].isna().sum()
                if na_count < 1:
                    continue

                summary = target[name].astype(float).sum()
                sim_total = target.loc[target[name].notna(), "similar_store"].astype(float).sum()
                avg = summary / sim_total if sim_total != 0 else 0
                total.loc[condition & total[name].isna(), name] = total.loc[condition & total[name].isna(), "similar_store"] * avg
            print(f"{D_code} 완료")
    print(f"{year_code} 완료")
    #total.to_csv("./c팀/del/df_seoul_test.csv", encoding="utf-8", index=False)
print("Null 값 제거 완료")

total.to_csv("./c팀/del/df_seoul_test.csv", encoding="utf-8", index=False)




# #df_seoul_facilities파일 Null값 제거
# import pandas as pd

# df = pd.read_csv("./c팀/del/df_seoul_facilities.csv")
# print(df)

# df.fillna(0, inplace=True)
# print(df)
# print(df.isna().sum())
# df.to_csv("./c팀/del/df_seoul_facilities_test.csv", encoding="utf-8", index=False)




# #유동인구파일 형식 맞추기
# import pandas as pd
# from glob import glob
# import numpy as np

# name = pd.DataFrame()

# #시 분 초 까지 나와있는 데이터 분기로 변환
# def time_to_harf(text:str):
#     year = text.split("-")[0]
#     month = int(text.split("-")[1])
#     harf = None
#     if month <= 3:
#         harf = 1
#     elif month <= 6:
#         harf = 2
#     elif month <= 9:
#         harf = 3
#     else :
#         harf = 4
#     harf = f"{year}{harf}"
#     return harf

# #자치구 영어이름 Gu_code로 변환
# def name_to_code(text:str):
#     code = names.loc[names["자치구"] == text, "자치구_코드"].values[0]
#     print(code)
#     return code



# dfs = glob("./c팀/del/seoul_move/*.csv")
# names = pd.read_csv("./c팀/del/seoul_move.csv", encoding="euc-kr")

# total = pd.DataFrame()

# for data in dfs:
#     df = pd.read_csv(data, sep=",", encoding="euc-kr")

#     #Seoul_Grand_Park 지우기
#     df = df[df["자치구"] != "Seoul_Grand_Park"]

#     df["Gu_code"] = df["자치구"].apply(name_to_code)
#     df["year_code"] = df["측정시간"].apply(time_to_harf)
#     total = pd.concat([total, df])
#     print("=" * 50)
#     print(total)
#     print("=" * 50)


# total.to_csv("./c팀/del/df_seoul_move_total.csv", encoding="utf-8", index=False)

# print(total)
# total.drop(columns=["모델번호", "시리얼", "측정시간", "지역", "자치구", "행정동", "등록일"], inplace=True)
# a = total.groupby(["year_code", "Gu_code"]).sum().reset_index()

# a.to_csv("./c팀/del/df_seoul_move.csv", encoding="utf-8", index=False)