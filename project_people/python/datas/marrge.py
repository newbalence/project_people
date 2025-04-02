import pandas as pd
from glob import glob
import numpy as np

store = pd.read_csv("./code/project02/df_seoul_store.csv")

sales = pd.read_csv("./code/project02/df_seoul_sales.csv")

store_with_sales = store.merge(sales, how="left", on=("year_code", "Gu_code", "service_code"))

store_with_sales.to_csv("./code/project02/df_seoul_store_with_salse.csv", encoding="utf-8", index=False)

store_with_salse = pd.read_csv("./code/project02/df_seoul_store_with_salse.csv")
store_with_salse.drop(columns=(["Gu_code_name_y", "service_code_name_y"]), inplace=True)

store_with_salse.to_csv("./code/project02/df_seoul_store_with_salse.csv", encoding="utf-8", index=False)

store_with_salse.sort_values(by=["year_code", "Gu_code", "service_code"], ascending=True, inplace=True) 
store_with_salse.to_csv("./code/project02/df_seoul_store_with_salse.csv", encoding="utf-8", index=False)