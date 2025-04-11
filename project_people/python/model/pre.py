import pandas as pd
import pickle

# 예측할 구 코드 입력
target_gu = 11290  # 예: 종로구

# 데이터 로드
df = pd.read_csv('./python/model/df_seoul_test.csv')
df = df[(df['year_code'] == 20244) & (df['Gu_code'] == target_gu)].copy()
df['월평균매출'] = df['Month_sales_pay'] / df['similar_store'] / 3

# 불필요 열 제거
drop_cols = [col for col in df.columns if 'pay' in col and col != 'Month_sales_pay']
drop_cols += ['Gu_code_name_x', 'service_code_name_x', '월평균매출']
df.drop(columns=drop_cols, inplace=True, errors='ignore')

# 학습 당시 정보 로드
with open('sales_forecast_model.pkl', 'rb') as f:
    model = pickle.load(f)
with open('label_encoders.pkl', 'rb') as f:
    label_encoders = pickle.load(f)
with open('feature_names.pkl', 'rb') as f:
    feature_names = pickle.load(f)

# 인코딩 적용
for col, le in label_encoders.items():
    if col in df.columns:
        df[col] = le.transform(df[col])

# 누락된 컬럼 0으로 보완
for col in feature_names:
    if col not in df.columns:
        df[col] = 0

# 순서 맞추기
df = df.reindex(columns=feature_names)

# 예측
if df.empty:
    print(f"[예측불가] '{target_gu}' 자치구의 20244 분기 데이터가 없습니다.")
else:
    pred = model.predict(df)
    df['예측_상점당_월평균매출'] = pred

    # 디코딩
    if 'service_code' in label_encoders and 'service_code' in df.columns:
        df['service_code'] = label_encoders['service_code'].inverse_transform(df['service_code'])
        df['service_code'] = df['service_code'].astype(str)  # ← 여기 추가

    # 그룹 코드 추출: 앞 3자리 (CS1, CS2, CS3)
    df['code_group'] = df['service_code'].str[:3]

    # 강제 그룹 기준
    groups = ['CS1', 'CS2', 'CS3']
    result = []

    for group in groups:
        subset = df[df['code_group'] == group].copy()
        if not subset.empty:
            subset['code_group'] = group  # 명시적 유지
            top2 = subset.nlargest(2, '예측_상점당_월평균매출').copy()
            result.append(top2)

    # 최종 출력
    if result:
        final_df = pd.concat(result, ignore_index=True)
        final_df['예측_상점당_월평균매출'] = final_df['예측_상점당_월평균매출'].astype(int)
        print(f"\n{target_gu} 자치구 예측 결과 (20244 기준 → 20251 예상):")
        print(final_df[['code_group', 'service_code', '예측_상점당_월평균매출']]
            .sort_values(by=['code_group', '예측_상점당_월평균매출'], ascending=[True, False])
            .to_string(index=False))
    else:
        print(f"\n{target_gu} 자치구에 CS1~CS3 그룹 예측 결과가 존재하지 않습니다.")

