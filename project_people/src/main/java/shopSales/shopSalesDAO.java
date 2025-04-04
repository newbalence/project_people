package shopSales;

import java.util.ArrayList;
import java.util.List;

import db.DBManager;
import seoulAll.seoulAllVO;

public class shopSalesDAO extends DBManager {
// 조회?
//	여러건 조회
	public List<shopSalesVO> selShSaAll() {
		driverLoad();
		DBConnect();
		
		String sql = "select * from df_seoul_store_sales_final";
		executeQuery(sql);
		
		List<shopSalesVO> list = new ArrayList<>();
		while(next()) {
			shopSalesVO vo = new shopSalesVO();
//			vo 만들어서 데이터 가져오기
			
			
			
			list.add(vo);
		}
		
		DBDisConnect();
		return list;
		
	}
	
	
	public List<shopSalesVO> selShSaOne(String yearCode, String GuCode) {
		driverLoad();
		DBConnect();
		
		String sql = "select * from df_seoul_store_sales_final where year_code = '" + yearCode + "' ans Gu_code = '" + GuCode + "'";
		executeQuery(sql);
		
		List<shopSalesVO> list = new ArrayList<>();
		while(next()) {
			shopSalesVO svo = new shopSalesVO();
//			vo 만들어서 데이터 가져오기
			
			
			
			list.add(svo);
		}
		
		DBDisConnect();
		return list;
		
	}
	
	
	public shopSalesVO selShSa(shopSalesVO vo) {
		driverLoad();
		DBConnect();
		
		String sql = "select * from df_seoul_store_sales_final where year_code = '" + vo.getYearCode() + "' ans Gu_code = '" + vo.getGuCode() + "' and service_code like '%" + vo.getServiceCode() + "%'";
		executeQuery(sql);
		
		if(next()) {
			shopSalesVO svo = new shopSalesVO();
			svo.setAge10Num(getInt("age_10_num"));
			
			
			DBDisConnect();
			return svo;
		}else {
			DBDisConnect();
			return null;
		}
		

		
	}
	
	
}
