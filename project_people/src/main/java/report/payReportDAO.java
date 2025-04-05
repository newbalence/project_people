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
		
		String sql = "select year_code, avg(Month_sales_pay / store) as Month_sales_pay ";
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
		
		String sql = "SELECT ";
		sql += "(select mon_sales_pay FROM df_seoul_store_sales_final ";
		sql += "where Gu_code = '" + code + "' and year_code = '20244' ORDER BY mon_sales_pay desc LIMIT 1) ";
		sql += "as Mon, ";
		
		sql += "(select Tue_sales_pay FROM df_seoul_store_sales_final ";
		sql += "where Gu_code = '" + code + "' and year_code = '20244' ORDER BY Tue_sales_pay desc LIMIT 1) ";
		sql += "as Tue, ";
		
		sql += "(select wed_sales_pay FROM df_seoul_store_sales_final ";
		sql += "where Gu_code = '" + code + "' and year_code = '20244' ORDER BY wed_sales_pay desc LIMIT 1) ";
		sql += "as Wed, ";
		
		sql += "(select Thur_sales_pay FROM df_seoul_store_sales_final ";
		sql += "where Gu_code = '" + code + "' and year_code = '20244' ORDER BY Thur_sales_pay desc LIMIT 1) ";
		sql += "as Thur, ";
		
		sql += "(SELECT Fri_sales_pay FROM df_seoul_store_sales_final ";
		sql += "where Gu_code = '" + code + "' and year_code = '20244' ORDER BY Fri_sales_pay desc LIMIT 1) ";
		sql += "as Fri, ";
		
		sql += "(select sat_sales_pay FROM df_seoul_store_sales_final ";
		sql += "where Gu_code = '" + code + "' and year_code = '20244' ORDER BY sat_sales_pay desc LIMIT 1) ";
		sql += "as Sat, ";
		
		sql += "(select sun_sales_pay FROM df_seoul_store_sales_final ";
		sql += "where Gu_code = '" + code + "' and year_code = '20244' ORDER BY sun_sales_pay desc LIMIT 1) ";
		sql += "as Sun ";
		executeQuery(sql);
		
		shopSalesVO vo = new shopSalesVO();
		if(next()) {
			String Mon = getString("Mon");
			String Tue = getString("Tue");
			String Wed = getString("Wed");
			String Thur = getString("Thur");
			String Fri = getString("Fri");
			String Sat = getString("Sat");
			String Sun = getString("Sun");
			
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
	
	
	
//	성별 매출 현황 가져오기
	
	
	
//	서비스종별 성별 매출 현황 가져오기
	
	
	
//	업종, 나이별 매출 현황 가져오기
	
	
	
	
}
