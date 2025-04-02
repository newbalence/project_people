import pandas as pd
from sqlalchemy import create_engine
import sqlalchemy as sa

db_connection_str = 'mysql+pymysql://root:ezen@localhost:3306/project02'
db_connection = create_engine(db_connection_str)
conn = db_connection.connect()

coltype = {'year_code': sa.types.String, 'Gu_code': sa.types.String}

df = pd.read_csv("./python/datas/df_seoul_all.csv")

df.to_sql(name='df_seoul_all', con=db_connection, dtype=coltype, if_exists='append',index=False)  