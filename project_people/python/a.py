/* 종합의견 Bset */

/* 자치구 점포수 순위 */
select Gu_code, Gu_code_name, t.score from (select Gu_code, Gu_code_name, rank() over(order by sum(store) desc) as score from df_seoul_store_sales_final group by Gu_code, Gu_code_name) t where Gu_code = '11110';


/* 자치구 매출액 순위 */
select Gu_code, Gu_code_name, t.score from (select Gu_code, Gu_code_name, rank() over(order by sum(month_sales_pay) desc) as score from df_seoul_all group by Gu_code, Gu_code_name) t where Gu_code = '11110';


/* 자치구 유동인구 수 순위 */
select Gu_code, Gu_code_name, t.score from (select Gu_code, Gu_code_name, rank() over(order by sum(all_move_people) desc) as score from df_seoul_all group by Gu_code, Gu_code_name) t where Gu_code = '11110';



/* Best 업종 점포수 */
select service_code_name, store from df_seoul_store_sales_final where Gu_code = '11110' and year_code ='20244' order by store desc


/* Best 업종 개업수 */
select service_code_name, open_store from df_seoul_store_sales_final where Gu_code = '11110' and year_code ='20244' order by open_store desc


/* Best 업종 폐업수 */
select service_code_name, close_store from df_seoul_store_sales_final where Gu_code = '11110' and year_code ='20244' order by close_store desc


/* Best 업종 프렌차이즈수 */
select service_code_name, Franchise_store from df_seoul_store_sales_final where Gu_code = '11110' and year_code ='20244' order by Franchise_store desc






/* 분석 리포트 */

/* 점포수 나타내는 곳 사용 쿼리 */
select year_code, sum(store), sum(Franchise_store) from df_seoul_store_sales_final where Gu_code = '11110' and year_code > 20233 group by year_code, Gu_code


/* 분기별 평균영업 기간 월 단위로 표시 */
select year_code, open_month_mean from df_seoul_all where Gu_code = '11110' and year_code > 20233


/* 분기별 총 개업 가게 수 */
select year_code, sum(`open_store`) from df_seoul_store_sales_final where Gu_code = '11110' and year_code > 20233 group by year_code


/* 분기별 총 폐업 가게 수 */
select year_code, sum(`close_store`) from df_seoul_store_sales_final where Gu_code = '11110' and year_code > 20233 group by year_code


/* 업종으로 묶어 많은 업종 표시 */
select left(service_code, 3) as code, sum(store) from df_seoul_store_sales_final where year_code = '20244' and Gu_code = '11110' group by code;


/* 점포당 분기 평균 매출액 */
select year_code, avg(Month_sales_pay / store) from df_seoul_store_sales_final where Gu_code = '11110' and year_code > 20233 group by Gu_code, year_code


/* 월 평균 매출건수 */
select year_code, avg(Month_sales_num) from df_seoul_store_sales_final where Gu_code = '11110' and year_code > 20233 group by Gu_code, year_code


/* 요일별 매출 현황 가져오기 */
SELECT 
(select mon_sales_pay FROM df_seoul_store_sales_final where Gu_code = '11110' and year_code = '20244' ORDER BY mon_sales_pay desc LIMIT 1) as Mon,
(select Tue_sales_pay FROM df_seoul_store_sales_final where Gu_code = '11110' and year_code = '20244' ORDER BY Tue_sales_pay desc LIMIT 1) as Tue,
(select wed_sales_pay FROM df_seoul_store_sales_final where Gu_code = '11110' and year_code = '20244' ORDER BY wed_sales_pay desc LIMIT 1) as Wed,
(select Thur_sales_pay FROM df_seoul_store_sales_final where Gu_code = '11110' and year_code = '20244' ORDER BY Thur_sales_pay desc LIMIT 1) as Thur,
(SELECT Fri_sales_pay FROM df_seoul_store_sales_final where Gu_code = '11110' and year_code = '20244' ORDER BY Fri_sales_pay desc LIMIT 1) as Fri,
(select sat_sales_pay FROM df_seoul_store_sales_final where Gu_code = '11110' and year_code = '20244' ORDER BY sat_sales_pay desc LIMIT 1) as Sat,
(select sun_sales_pay FROM df_seoul_store_sales_final where Gu_code = '11110' and year_code = '20244' ORDER BY sun_sales_pay desc LIMIT 1) as Sun


/* 시간별 매출 현황 가져오기 */
SELECT
(select time_00_06_pay FROM df_seoul_store_sales_final where Gu_code = '11110' and year_code = '20244' ORDER BY time_00_06_pay desc LIMIT 1) as fi,
(select time_06_11_pay FROM df_seoul_store_sales_final where Gu_code = '11110' and year_code = '20244' ORDER BY time_06_11_pay desc LIMIT 1) as se,
(select time_11_14_pay FROM df_seoul_store_sales_final where Gu_code = '11110' and year_code = '20244' ORDER BY time_11_14_pay desc LIMIT 1) as th,
(select time_14_17_pay FROM df_seoul_store_sales_final where Gu_code = '11110' and year_code = '20244' ORDER BY time_14_17_pay desc LIMIT 1) as fo,
(SELECT time_17_21_pay FROM df_seoul_store_sales_final where Gu_code = '11110' and year_code = '20244' ORDER BY time_17_21_pay desc LIMIT 1) as fiv,
(select time_21_24_pay FROM df_seoul_store_sales_final where Gu_code = '11110' and year_code = '20244' ORDER BY time_21_24_pay desc LIMIT 1) as six;


/* 성별 매출 현황 가져오기 */
SELECT 
(SELECT F_sales_pay FROM df_seoul_store_sales_final where Gu_code = '11110' ORDER BY F_sales_pay desc LIMIT 1) as F,
(select M_sales_pay FROM df_seoul_store_sales_final where Gu_code = '11110' ORDER BY M_sales_pay desc LIMIT 1) as M


/* 업종, 나이별 매출 현황 가져오기 */
select year_code, sum(age_10_pay) as one, sum(age_20_pay) as two, sum(age_30_pay) as three, sum(age_40_pay) as four, sum(age_50_pay) as fiv, sum(age_60_pay) as six from df_seoul_store_sales_final where Gu_code = '11110' and year_code = '20244' group by year_code;


/* 분기별 총 유동인구수 */
select year_code, all_move_people from df_seoul_all where Gu_code = '11110' and year_code > 20233


/* 성별 & 나이 별 유동 인구 값 */
select year_code, M_move, F_move, age_10_move, age_20_move, age_30_move, age_40_move, age_50_move, age_60_move from df_seoul_all where Gu_code = '11110' and year_code = '20244' group by year_code;


/* 요일별 유동인구 수 */
SELECT 
(select mon_move FROM df_seoul_all where Gu_code = '11110' and year_code = '20244' ORDER BY mon_move desc LIMIT 1) as Mon,
(select Tue_move FROM df_seoul_all where Gu_code = '11110' and year_code = '20244' ORDER BY Tue_move desc LIMIT 1) as Tue,
(select wed_move FROM df_seoul_all where Gu_code = '11110' and year_code = '20244' ORDER BY wed_move desc LIMIT 1) as Wed,
(select Thur_move FROM df_seoul_all where Gu_code = '11110' and year_code = '20244' ORDER BY Thur_move desc LIMIT 1) as Thur,
(SELECT Fri_move FROM df_seoul_all where Gu_code = '11110' and year_code = '20244' ORDER BY Fri_move desc LIMIT 1) as Fri,
(select sat_move FROM df_seoul_all where Gu_code = '11110' and year_code = '20244' ORDER BY sat_move desc LIMIT 1) as Sat,
(select sun_move FROM df_seoul_all where Gu_code = '11110' and year_code = '20244' ORDER BY sun_move desc LIMIT 1) as Sun


/* 시간별 유동인구 수 */
SELECT 
(select time_00_06_move FROM df_seoul_all where Gu_code = '11110' and year_code = '20244' ORDER BY time_00_06_move desc LIMIT 1) as fi,
(select time_06_11_move FROM df_seoul_all where Gu_code = '11110' and year_code = '20244' ORDER BY time_06_11_move desc LIMIT 1) as se,
(select time_11_14_move FROM df_seoul_all where Gu_code = '11110' and year_code = '20244' ORDER BY time_11_14_move desc LIMIT 1) as th,
(select time_14_17_move FROM df_seoul_all where Gu_code = '11110' and year_code = '20244' ORDER BY time_14_17_move desc LIMIT 1) as fo,
(SELECT time_17_21_move FROM df_seoul_all where Gu_code = '11110' and year_code = '20244' ORDER BY time_17_21_move desc LIMIT 1) as fiv,
(select time_21_24_move FROM df_seoul_all where Gu_code = '11110' and year_code = '20244' ORDER BY time_21_24_move desc LIMIT 1) as six;


/* 분기별 총 상주 인구 */
select year_code, all_live_people from df_seoul_all where Gu_code = '11110' and year_code > 20233


/* 성별 & 연령별 상주 인구수 */
select year_code, M_live, F_live, age_10_live, age_20_live, age_30_live, age_40_live, age_50_live, age_60_live from df_seoul_all where Gu_code = '11110' and year_code = '20244' group by year_code;


/* 총 직장인 수 */
select year_code, all_company_people from df_seoul_all where Gu_code = '11110' and year_code > 20233


/* 성별 & 연령별 직장인 수 */
select year_code, M_company, F_company, age_10_company, age_20_company, age_30_company, age_40_company, age_50_company, age_60_company from df_seoul_all where Gu_code = '11110' and year_code = '20244' group by year_code;

or

select year_code, M_company, F_company, F_10_company, M_10_company, F_20_company, M_20_company, F_30_company, M_30_company, F_40_company, M_40_company, F_50_company, M_50_company, F_60_company, M_60_company from df_seoul_all where Gu_code = '11110' and year_code = '20244' group by year_code;


/* 분기별 총 가구 수 */
select year_code, all_family_people from df_seoul_all where Gu_code = '11110' and year_code > 20233


/*  분기별 집객 시설 수*/
select year_code, hospitality_facilities from df_seoul_all where Gu_code = '11110' and year_code > 20233


/* 주요 시설 수 */
select public_office, bank, (general_hospital + hospital + drugstore) as hospital, (baby_care + elementary_school + middle_school + high_school + college) as school, Department, market, Theater, stay, (airport + train + bus_terminal + subway + Bus_stop) as Transportation  from df_seoul_all where Gu_code = '11110' and year_code = '20244'


/* 분기별 자치구 소득분위 */
select year_code, Gu_code_name, income_code from df_seoul_all where Gu_code = '11110' and year_code > 20233




































































































































































