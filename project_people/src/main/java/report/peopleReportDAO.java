package report;

import java.util.ArrayList;
import java.util.List;

import db.DBManager;
import seoulAll.seoulAllVO;
import shopSales.shopSalesVO;

public class peopleReportDAO extends DBManager {

//	분기별 총 유동인구 수
	public List<seoulAllVO> allMove(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "select year_code, all_move_people from df_seoul_all ";
		sql += "where Gu_code = '" + code + "' and year_code > 20233";
		
		executeQuery(sql);
		
		List<seoulAllVO> list = new ArrayList<>();
		while(next()) {
			String yearCode = getString("year_code");
			String allMove = String.valueOf(getLong("all_move_people"));
			
			seoulAllVO vo = new seoulAllVO();
			vo.setYearCode(yearCode);
			vo.setAllMovePeople(allMove);
			
			list.add(vo);
			
		}
		DBDisConnect();
		return list;
	}
	
//	성별 & 나이별 유동 인구 값
	public seoulAllVO genderAgeMove(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "select M_move, F_move, age_10_move, age_20_move, age_30_move, age_40_move, age_50_move, age_60_move ";
		sql += "from df_seoul_all where Gu_code = '" + code + "' and year_code = '20244';";
		executeQuery(sql);
		
		if(next()) {
			String Mmove = String.valueOf(getLong("M_move"));
			String Fmove = String.valueOf(getLong("F_move"));
			
			String A10Move = String.valueOf(getLong("age_10_move"));
			String A20Move = String.valueOf(getLong("age_20_move"));
			String A30Move = String.valueOf(getLong("age_30_move"));
			String A40Move = String.valueOf(getLong("age_40_move"));
			String A50Move = String.valueOf(getLong("age_50_move"));
			String A60Move = String.valueOf(getLong("age_60_move"));
			
			seoulAllVO vo = new seoulAllVO();
			vo.setmMove(Mmove);
			vo.setfMove(Fmove);
			
			vo.setAge10Move(A10Move);
			vo.setAge20Move(A20Move);
			vo.setAge30Move(A30Move);
			vo.setAge40Move(A40Move);
			vo.setAge50Move(A50Move);
			vo.setAge60Move(A60Move);
			
			
			DBDisConnect();
			return vo;
		}else {
			DBDisConnect();
			return null;
		}
	}
	
//	요일별 유동인구 수
	public seoulAllVO dayMove(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "select mon_move, tue_move, wed_move, thur_move, fri_move, sat_move, sun_move ";
		sql += "from df_seoul_all where Gu_code = '" + code + "' and year_code = '20244';";
		executeQuery(sql);
		
		if(next()) {
			String monMove = getString("mon_move");
			String tueMove = String.valueOf(getLong("tue_move"));
			String wedMove = String.valueOf(getLong("wed_move"));
			String thurMove = String.valueOf(getLong("thur_move"));
			String friMove = String.valueOf(getLong("fri_move"));
			String satMove = String.valueOf(getLong("sat_move"));
			String sunMove = String.valueOf(getLong("sun_move"));
			
			seoulAllVO vo = new seoulAllVO();
			vo.setMonMove(monMove);
			vo.setTueMove(tueMove);
			vo.setWedMove(wedMove);
			vo.setThurMove(thurMove);
			vo.setFriMove(friMove);
			vo.setSatMove(satMove);
			vo.setSunMove(sunMove);
			
			
			DBDisConnect();
			return vo;
		}else {
			DBDisConnect();
			return null;
		}
	}
	
//	시간별 유동인구 수
	public seoulAllVO timeMove(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "select time_00_06_move, time_06_11_move, time_11_14_move, time_14_17_move, time_17_21_move, time_21_24_move ";
		sql += "from df_seoul_all where Gu_code = '" + code + "' and year_code = '20244';";
		executeQuery(sql);
		
		if(next()) {
			String time0006 = getString("time_00_06_move");
			String time0611 = String.valueOf(getLong("time_06_11_move"));
			String time1114 = String.valueOf(getLong("time_11_14_move"));
			String time1417 = String.valueOf(getLong("time_14_17_move"));
			String time1721 = String.valueOf(getLong("time_17_21_move"));
			String time2124 = String.valueOf(getLong("time_21_24_move"));
			
			seoulAllVO vo = new seoulAllVO();
			vo.setTime0006Move(time0006);
			vo.setTime0611Move(time0611);
			vo.setTime1114Move(time1114);
			vo.setTime1417Move(time1417);
			vo.setTime1721Move(time1721);
			vo.setTime2124Move(time2124);
			
			
			DBDisConnect();
			return vo;
		}else {
			DBDisConnect();
			return null;
		}
	}
	
//	분기별 총 상주 인구
	public List<seoulAllVO> allLive(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "select year_code, all_live_people from df_seoul_all ";
		sql += "where Gu_code = '" + code + "'  and year_code > 20233;";
		executeQuery(sql);
		
		List<seoulAllVO> list = new ArrayList<>();
		while(next()) {
			String yearCode = getString("year_code");
			String allLive = String.valueOf(getLong("all_live_people"));
			
			seoulAllVO vo = new seoulAllVO();
			vo.setYearCode(yearCode);
			vo.setAllLivePeople(allLive);
			
			list.add(vo);
			
			
		}
		DBDisConnect();
		return list;
	}
	
//	성별 & 연령별 상주 인구수
	public seoulAllVO genderAgeLive(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "select M_live, F_live, age_10_live, age_20_live, age_30_live, age_40_live, age_50_live, age_60_live ";
		sql += "from df_seoul_all where Gu_code = '" + code + "' and year_code = '20244';";
		executeQuery(sql);
		
		if(next()) {
			String Mlive = String.valueOf(getLong("M_live"));
			String Flive = String.valueOf(getLong("F_live"));
			
			String A10Live = String.valueOf(getLong("age_10_live"));
			String A20Live = String.valueOf(getLong("age_20_live"));
			String A30Live = String.valueOf(getLong("age_30_live"));
			String A40Live = String.valueOf(getLong("age_40_live"));
			String A50Live = String.valueOf(getLong("age_50_live"));
			String A60Live = String.valueOf(getLong("age_60_live"));
			
			seoulAllVO vo = new seoulAllVO();
			vo.setmLive(Mlive);
			vo.setfLive(Flive);
			
			vo.setAge10Live(A10Live);
			vo.setAge20Live(A20Live);
			vo.setAge30Live(A30Live);
			vo.setAge40Live(A40Live);
			vo.setAge50Live(A50Live);
			vo.setAge60Live(A60Live);
			
			
			DBDisConnect();
			return vo;
		}else {
			DBDisConnect();
			return null;
		}
	}
	
	
//	총 직장인 수
	public List<seoulAllVO> allCompany(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "select year_code, all_company_people from df_seoul_all ";
		sql += "where Gu_code = '" + code + "'  and year_code > 20233;";
		executeQuery(sql);
		
		List<seoulAllVO> list = new ArrayList<>();
		while(next()) {
			String yearCode = getString("year_code");
			String allCompany = String.valueOf(getLong("all_company_people"));
			
			seoulAllVO vo = new seoulAllVO();
			vo.setYearCode(yearCode);
			vo.setAllCompanyPeople(allCompany);
			
			list.add(vo);
					
		}
		DBDisConnect();
		return list;
	}
	
//	성별 & 연령별 직장인 수
	public seoulAllVO genderAgeCompany(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "select M_company, F_company, age_10_company, age_20_company, age_30_company, age_40_company, age_50_company, age_60_company ";
		sql += "from df_seoul_all where Gu_code = '" + code + "' and year_code = '20244';";
		executeQuery(sql);
		
		if(next()) {
			String MCompany = String.valueOf(getLong("M_company"));
			String FCompany = String.valueOf(getLong("F_company"));
			
			String A10Company = String.valueOf(getLong("age_10_company"));
			String A20Company = String.valueOf(getLong("age_20_company"));
			String A30Company = String.valueOf(getLong("age_30_company"));
			String A40Company = String.valueOf(getLong("age_40_company"));
			String A50Company = String.valueOf(getLong("age_50_company"));
			String A60Company = String.valueOf(getLong("age_60_company"));
			
			seoulAllVO vo = new seoulAllVO();
			vo.setmCompany(MCompany);
			vo.setfCompany(FCompany);
			
			vo.setAge10Company(A10Company);
			vo.setAge20Company(A20Company);
			vo.setAge30Company(A30Company);
			vo.setAge40Company(A40Company);
			vo.setAge50Company(A50Company);
			vo.setAge60Company(A60Company);
			
			
			DBDisConnect();
			return vo;
		}else {
			DBDisConnect();
			return null;
		}
	}
	
//	분기별 총 가구 수
	public List<seoulAllVO> allFamily(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "select year_code, all_family_people from df_seoul_all ";
		sql += "where Gu_code = '" + code + "'  and year_code > 20233;";
		executeQuery(sql);
		
		List<seoulAllVO> list = new ArrayList<>();
		while(next()) {
			String yearCode = getString("year_code");
			String allFamily = String.valueOf(getLong("all_family_people"));
			
			seoulAllVO vo = new seoulAllVO();
			vo.setYearCode(yearCode);
			vo.setAllFamilyPeople(allFamily);
			
			list.add(vo);
					
		}
		DBDisConnect();
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
