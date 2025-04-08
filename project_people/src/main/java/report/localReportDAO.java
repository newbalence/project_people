package report;

import java.util.ArrayList;
import java.util.List;

import db.DBManager;
import seoulAll.seoulAllVO;
import shopSales.shopSalesVO;

public class localReportDAO extends DBManager {
	
//	분기별 집객 시설 수
	public List<seoulAllVO> allLocal(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "select year_code, hospitality_facilities from df_seoul_all ";
		sql += "where Gu_code = '" + code + "' and year_code > 20233";
		
		executeQuery(sql);
		
		List<seoulAllVO> list = new ArrayList<>();
		while(next()) {
			String yearCode = getString("year_code");
			String allLocal = String.valueOf(getLong("hospitality_facilities"));
			
			seoulAllVO vo = new seoulAllVO();
			vo.setYearCode(yearCode);
			vo.setHospitalityFacilities(allLocal);
			
			list.add(vo);
			
		}
		DBDisConnect();
		return list;
	}
	
//	주요 시설 수
	public seoulAllVO mainLocal(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "select public_office, bank, (general_hospital + hospital + drugstore) as hospital, ";
		sql += "(baby_care + elementary_school + middle_school + high_school + college) as school, ";
		sql += "Department, market, Theater, stay, (airport + train + bus_terminal + subway + Bus_stop) as Transportation ";
		sql += "from df_seoul_all where Gu_code = '" + code + "' and year_code = '20244'";
		
		executeQuery(sql);
		
		if(next()) {
			String office = String.valueOf(getLong("public_office"));
			String bank = String.valueOf(getLong("bank"));
			String hospital = String.valueOf(getLong("hospital"));
			String school = String.valueOf(getLong("school"));
			String Department = String.valueOf(getLong("Department"));
			String market = String.valueOf(getLong("market"));
			String Theater = String.valueOf(getLong("Theater"));
			String stay = String.valueOf(getLong("stay"));
			String Transportation = String.valueOf(getLong("Transportation"));
			
			seoulAllVO vo = new seoulAllVO();
			vo.setPublicOffice(office);
			vo.setBank(bank);
			vo.setHospital(hospital);
			vo.setSchooll(school);
			vo.setDepartment(Department);
			vo.setMarket(market);
			vo.setTheater(Theater);
			vo.setStay(stay);
			vo.setTransportation(Transportation);
			
			DBDisConnect();
			return vo;
			
		}else {
			DBDisConnect();
			return null;
		}
	}
	
	
//	분기별 자치구 소득 분위
	public List<seoulAllVO> allIncome(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "select year_code, income_code from df_seoul_all ";
		sql += "where Gu_code = '" + code + "' and year_code > 20233";
		
		executeQuery(sql);
		
		List<seoulAllVO> list = new ArrayList<>();
		while(next()) {
			String yearCode = getString("year_code");
			String allIncome = String.valueOf(getLong("income_code"));
			
			seoulAllVO vo = new seoulAllVO();
			vo.setYearCode(yearCode);
			vo.setIncomeCode(allIncome);
			
			list.add(vo);
		}
		
		DBDisConnect();
		return list;
	}
	
	
	
}
