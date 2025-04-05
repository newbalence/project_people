package report;

import java.util.ArrayList;
import java.util.List;

import db.DBManager;
import seoulAll.seoulAllVO;
import shopSales.shopSalesVO;

public class storeReportDAO extends DBManager {
	
	
	
	
//	점포수 그래프 및 전분기, 전년도 비교할때 사용
	public List<shopSalesVO> storeGrape(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "select year_code, sum(store) as store, sum(Franchise_store) as Franchise_store ";
		sql += "from df_seoul_store_sales_final ";
		sql += "where Gu_code = '" + code + "' and year_code > 20233 group by year_code, Gu_code";
		
		executeQuery(sql);
		
		List<shopSalesVO> list = new ArrayList<>();

		while(next()) {
			String yearCode = getString("year_code");
			String store = getString("store");
			String FranchiseStore = getString("Franchise_store");
			
			shopSalesVO vo = new shopSalesVO();
			vo.setYearCode(yearCode);
			vo.setStore(store);
			vo.setFranchiseStore(FranchiseStore);
			
			list.add(vo);

		}
		DBDisConnect();
		return list;
	}
	
//	분기별 평균영업 기간 월 단위로 표시
	public List<seoulAllVO> storeMeanOpen(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "select year_code, open_month_mean ";
		sql += "from df_seoul_all where Gu_code = '" + code + "' and year_code > 20233";
		
		executeQuery(sql);
		
		List<seoulAllVO> list = new ArrayList<>();

		while(next()) {
			String yearCode = getString("year_code");
			String openMonthMean = getString("open_month_mean");
			
			seoulAllVO vo = new seoulAllVO();
			vo.setYearCode(yearCode);
			vo.setOpenMonthMean(openMonthMean);
			
			list.add(vo);

		}
		DBDisConnect();
		return list;
	}
	
//	분기별 총 개업 가게 수
	public List<shopSalesVO> storeOpen(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "select year_code, sum(`open_store`) as `open_store` ";
		sql += "from df_seoul_store_sales_final where Gu_code = '" + code + "' and year_code > 20233 group by year_code";
		
		executeQuery(sql);
		
		List<shopSalesVO> list = new ArrayList<>();

		while(next()) {
			String yearCode = getString("year_code");
			String openStore = getString("open_store");
			
			shopSalesVO vo = new shopSalesVO();
			vo.setYearCode(yearCode);
			vo.setOpenStore(openStore);
			
			list.add(vo);

		}
		DBDisConnect();
		return list;
	}
	
//	분기별 총 폐업 가게 수
	public List<shopSalesVO> storeClose(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "select year_code, sum(`close_store`)  as `close_store` ";
		sql += "from df_seoul_store_sales_final where Gu_code = '" + code + "' and year_code > 20233 group by year_code";
		
		executeQuery(sql);
		
		List<shopSalesVO> list = new ArrayList<>();

		while(next()) {
			String yearCode = getString("year_code");
			String closeStore = getString("close_store");
			
			shopSalesVO vo = new shopSalesVO();
			vo.setYearCode(yearCode);
			vo.setCloseStore(closeStore);
			
			list.add(vo);

		}
		DBDisConnect();
		return list;
	}
	
//	업종으로 묶어 많은 업종 표시
	public List<shopSalesVO> storeService(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "select left(service_code, 3) as code, sum(store) as store ";
		sql += "from df_seoul_store_sales_final where Gu_code = '" + code + "' and year_code = '20244' group by code";
		
		executeQuery(sql);
		
		List<shopSalesVO> list = new ArrayList<>();

		while(next()) {
			String scode = getString("code");
			String store = getString("store");
			
			shopSalesVO vo = new shopSalesVO();
			vo.setServiceCode(scode);
			vo.setStore(store);
			
			list.add(vo);

		}
		DBDisConnect();
		return list;
	}
	
	
	
	
}
