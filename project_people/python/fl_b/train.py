import pandas as pd
from sklearn.ensemble import GradientBoostingRegressor
from sklearn.preprocessing import LabelEncoder
from sklearn.metrics import r2_score, mean_absolute_error, root_mean_squared_error
import pickle

# 데이터 로드 및 분할
df = pd.read_csv('./python/fl_b/df_seoul_test.csv')
test_df = df[df['year_code'] == 20244].copy()
df = df[df['year_code'] < 20244].copy()

# 월평균매출 계산
df['월평균매출'] = df['Month_sales_pay'] / df['similar_store'] / 3
test_df['월평균매출'] = test_df['Month_sales_pay'] / test_df['similar_store'] / 3

# 다음 분기 타깃 생성
df = df.sort_values(['Gu_code', 'service_code', 'year_code'])
df['다음분기_월평균매출'] = df.groupby(['Gu_code', 'service_code'])['월평균매출'].shift(-1)
df = df[df['다음분기_월평균매출'].notna()]

# 열 제거
drop_cols = ['Gu_code_name_x', 'service_code_name_x', 'Month_sales_pay', '월평균매출']
df = df.drop(columns=drop_cols, errors='ignore')
test_df = test_df.drop(columns=drop_cols, errors='ignore')

# 유효한 데이터만 사용
df = df[df['store'].notna() & (df['store'] > 0)]
test_df = test_df[test_df['store'].notna() & (test_df['store'] > 0)]

# 'pay'가 포함된 열 제거 (Month_sales_pay 제외)
pay_cols_to_drop = [col for col in df.columns if 'pay' in col and col != 'Month_sales_pay']
df = df.drop(columns=pay_cols_to_drop, errors='ignore')
test_df = test_df.drop(columns=pay_cols_to_drop, errors='ignore')

# 문자열 인코딩
label_encoders = {}
for col in df.select_dtypes(include='object').columns:
    le = LabelEncoder()
    df[col] = le.fit_transform(df[col])
    label_encoders[col] = le

# 테스트셋에도 동일 인코더 적용
for col, le in label_encoders.items():
    if col in test_df.columns:
        test_df[col] = le.transform(test_df[col])

# 인코더 저장
with open('./python/fl_b/label_encoders.pkl', 'wb') as f:
    pickle.dump(label_encoders, f)

# 입력/타깃 분리
X_train = df.drop(columns=['다음분기_월평균매출', 'year_code'])
y_train = df['다음분기_월평균매출']
X_test = test_df.drop(columns=['year_code'])
y_test = pd.Series([0] * len(X_test))  # 평가 대상 아님

# 이상치 제거
cutoff = y_train.quantile(0.99)
X_train = X_train[y_train < cutoff]
y_train = y_train[y_train < cutoff]

# 모델 학습
model = GradientBoostingRegressor(
    n_estimators=100,
    max_depth=4,
    learning_rate=0.05,
    subsample=0.8,
    random_state=42
)
model.fit(X_train, y_train)

# 모델 저장
with open('./python/fl_b/sales_forecast_model.pkl', 'wb') as f:
    pickle.dump(model, f)
with open('./python/fl_b/feature_names.pkl', 'wb') as f:
    pickle.dump(X_train.columns.tolist(), f)

# 예측 및 평가
pred = model.predict(X_train)
r2 = r2_score(y_train, pred)
mae = mean_absolute_error(y_train, pred)
rmse = root_mean_squared_error(y_train, pred)

print("▶ 모델 학습 완료")
print(f"R² Score : {r2:.4f}")
print(f"MAE      : {mae:,.0f} 원")
print(f"RMSE     : {rmse:,.0f} 원")

# 특성 중요도
importances = model.feature_importances_
features = X_train.columns
importance_df = pd.DataFrame({'feature': features, 'importance': importances})
importance_df = importance_df.sort_values(by='importance', ascending=False)

print("\n▶ 중요 특성 상위 10개")
print(importance_df.head(10).to_string(index=False))
