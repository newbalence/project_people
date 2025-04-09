package report;

import java.util.ArrayList;
import java.util.List;

import db.DBManager;
import seoulAll.seoulAllVO;
import shopSales.shopSalesVO;

public class payReportDAO extends DBManager {
	
//	점포당 분기 평균 매출액
	public List<shopSalesVO> storeMeanPay(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "select year_code, avg(Month_sales_pay / similar_store) as Month_sales_pay ";
		sql += "from df_seoul_store_sales_final where Gu_code = '" + code + "' and year_code > 20233 group by Gu_code, year_code";
		
		executeQuery(sql);
		

		List<shopSalesVO> list = new ArrayList<>();
		while(next()) {
			String yearCode = getString("year_code");
			String monthSalespay = getString("Month_sales_pay");
			
			shopSalesVO vo = new shopSalesVO();
			vo.setYearCode(yearCode);
			vo.setMonthSalesPay(monthSalespay);
			
			list.add(vo);		
			
		}
		
		DBDisConnect();
		return list;
	}
	
//	점포당 분기 평균 매출건수
	public List<shopSalesVO> storeMeanNum(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "select year_code, avg(Month_sales_num) as Month_sales_num ";
		sql += "from df_seoul_store_sales_final where Gu_code = '" + code + "' and year_code > 20233 group by Gu_code, year_code";
		
		executeQuery(sql);
		

		List<shopSalesVO> list = new ArrayList<>();
		while(next()) {
			String yearCode = getString("year_code");
			String monthSalesNum = getString("Month_sales_num");
			
			shopSalesVO vo = new shopSalesVO();
			vo.setYearCode(yearCode);
			vo.setMonthSalesNum(monthSalesNum);
			
			list.add(vo);
			
		}
		
		DBDisConnect();
		return list;
	}
	
//	요일별 매출 현황 가져오기
	public shopSalesVO weekPay(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "select sum(mon_sales_pay) as Mon, sum(Tue_sales_pay) as Tue, sum(Wed_sales_pay) as Wed, ";
		sql += "sum(Thur_sales_pay) as Thur, sum(Fri_sales_pay) as Fri, sum(Sat_sales_pay) as Sat, sum(Sun_sales_pay) as Sun ";
		sql += "from df_seoul_store_sales_final ";
		sql += "where Gu_code = '" + code + "' and year_code = '20244'";
		executeQuery(sql);
		
		if(next()) {
			String Mon = getString("Mon");
			String Tue = getString("Tue");
			String Wed = getString("Wed");
			String Thur = getString("Thur");
			String Fri = getString("Fri");
			String Sat = getString("Sat");
			String Sun = getString("Sun");
			
			shopSalesVO vo = new shopSalesVO();
			vo.setMonSalesPay(Mon);
			vo.setTueSalesPay(Tue);
			vo.setWedSalesPay(Wed);
			vo.setThurSalesPay(Thur);
			vo.setFriSalesPay(Fri);
			vo.setSatSalesPay(Sat);
			vo.setSunSalesPay(Sun);
			
			DBDisConnect();
			return vo;
		}else {
			DBDisConnect();
			return null;
		}

	}
	
//	시간별 매출 현황 가져오기
	public shopSalesVO timePay(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "select sum(time_00_06_pay) as fi, sum(time_06_11_pay) as se, sum(time_11_14_pay) as th, ";
		sql += "sum(time_14_17_pay) as fo, sum(time_17_21_pay) as fiv, sum(time_21_24_pay) as six ";
		sql += "from df_seoul_store_sales_final ";
		sql += "where Gu_code = '" + code + "' and year_code = '20244'";

		executeQuery(sql);
		
		if(next()) {
			String fi = String.valueOf(getLong("fi"));
			String se = String.valueOf(getLong("se"));
			String th = String.valueOf(getLong("th"));
			String fo = String.valueOf(getLong("fo"));
			String fiv = String.valueOf(getLong("fiv"));
			String six = String.valueOf(getLong("six"));
			
			shopSalesVO vo = new shopSalesVO();
			vo.setTime0006Pay(fi);
			vo.setTime0611Pay(se);
			vo.setTime1114Pay(th);
			vo.setTime1417Pay(fo);
			vo.setTime1721Pay(fiv);
			vo.setTime2124Pay(six);
			
			DBDisConnect();
			return vo;
		}else {
			DBDisConnect();
			return null;
		}

	}
	
	
//	성별 매출 현황 가져오기
	public shopSalesVO genderPay(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "SELECT sum(F_sales_pay) AS F, sum(M_sales_pay) AS M ";
		sql += "FROM df_seoul_store_sales_final ";
		sql += "WHERE Gu_code = '" + code + "' AND year_code = '20244'";
		
		executeQuery(sql);
		if(next()) {
			String M = String.valueOf(getLong("M"));
			String F = String.valueOf(getLong("F"));

			shopSalesVO vo = new shopSalesVO();
			vo.setmSalesPay(M);
			vo.setfSalesPay(F);
			
			DBDisConnect();
			return vo;
			
		}else {
			DBDisConnect();
			return null;
		}
	}
	
	
//	서비스종별 성별 매출 현황 가져오기
	public List<shopSalesVO> serviceGenderPay(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "SELECT ";
		sql += "LEFT(service_code, 3) AS code, sum(F_sales_pay) AS F, sum(M_sales_pay) AS M ";		
		sql += "FROM df_seoul_store_sales_final WHERE Gu_code = '" + code + "' AND year_code = '20244' group by code";
		
		executeQuery(sql);
		
		List<shopSalesVO> list = new ArrayList<>();
		while(next()) {
			String scode = getString("code");
			String M = String.valueOf(getLong("M"));
			String F = String.valueOf(getLong("F"));

			shopSalesVO vo = new shopSalesVO();
			vo.setServiceCode(scode);
			vo.setmSalesPay(M);
			vo.setfSalesPay(F);
			
			list.add(vo);
		}
		DBDisConnect();
		return list;
	}
	
//	나이별 매출 현황 가져오기
	public shopSalesVO agePay(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "select sum(age_10_pay) as one, sum(age_20_pay) as two, sum(age_30_pay) as three, ";
		sql += "sum(age_40_pay) as four, sum(age_50_pay) as fiv, sum(age_60_pay) as six ";
		
		sql += "from df_seoul_store_sales_final ";
		
		sql += "where Gu_code = '" + code + "' and year_code = '20244'";
		
		executeQuery(sql);
		if(next()) {
			String A10 = String.valueOf(getLong("one"));
			String A20 = String.valueOf(getLong("two"));
			String A30 = String.valueOf(getLong("three"));
			String A40 = String.valueOf(getLong("four"));
			String A50 = String.valueOf(getLong("fiv"));
			String A60 = String.valueOf(getLong("six"));

			shopSalesVO vo = new shopSalesVO();
			vo.setAge10Pay(A10);
			vo.setAge20Pay(A20);
			vo.setAge30Pay(A30);
			vo.setAge40Pay(A40);
			vo.setAge50Pay(A50);
			vo.setAge60Pay(A60);
			
			DBDisConnect();
			return vo;
			
		}else {
			DBDisConnect();
			return null;
		}
	}
	
	
//	업종, 나이별 매출 현황 가져오기
	public List<shopSalesVO> serviceAgePay(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "select LEFT(service_code, 3) AS code, sum(age_10_pay) as one, sum(age_20_pay) as two, sum(age_30_pay) as three,  ";
		sql += "sum(age_40_pay) as four, sum(age_50_pay) as fiv, sum(age_60_pay) as six ";
		
		sql += "from df_seoul_store_sales_final ";
		sql += "where Gu_code = '" + code + "' and year_code = '20244' ";
		sql += "group by code;";
		
		executeQuery(sql);
		
		List<shopSalesVO> list = new ArrayList<>();
		while(next()) {
			String scode = getString("code");
			String A10 = String.valueOf(getLong("one"));
			String A20 = String.valueOf(getLong("two"));
			String A30 = String.valueOf(getLong("three"));
			String A40 = String.valueOf(getLong("four"));
			String A50 = String.valueOf(getLong("fiv"));
			String A60 = String.valueOf(getLong("six"));

			shopSalesVO vo = new shopSalesVO();
			vo.setServiceCode(scode);
			vo.setAge10Pay(A10);
			vo.setAge20Pay(A20);
			vo.setAge30Pay(A30);
			vo.setAge40Pay(A40);
			vo.setAge50Pay(A50);
			vo.setAge60Pay(A60);
			list.add(vo);
		}
		DBDisConnect();
		return list;
	}
	
	
	
}
