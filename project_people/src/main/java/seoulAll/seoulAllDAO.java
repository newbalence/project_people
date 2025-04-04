package seoulAll;

import java.util.ArrayList;
import java.util.List;

import db.DBManager;
import shopSales.shopSalesVO;

public class seoulAllDAO extends DBManager {
// 조회
	
	public List<seoulAllVO> selSeoulAll() {
		driverLoad();
		DBConnect();
		
		String sql = "select * from df_seoul_all";
		executeQuery(sql);
		
		List<seoulAllVO> list = new ArrayList<>();
		while(next()) {
			seoulAllVO vo = new seoulAllVO();
//			vo 만들어서 데이터 가져오기
			
			
			
			
			list.add(vo);
		}
		DBDisConnect();
		return list;
	}
	
//	컬럼명으로 단건조회
	public seoulAllVO selSeoulOne(seoulAllVO vo) {
		driverLoad();
		DBConnect();
		
		String sql = "select * from df_seoul_all where where year_code = '" + vo.getYearCode() + "' ans Gu_code = '" + vo.getGuCode() + "'";
		executeQuery(sql);
		
		
		if(next()) {
//			vo.setAge10Company(getString(sql)); 으로 vo에 넣어주기
			
			seoulAllVO svo = new seoulAllVO();
			
//			
			
			DBDisConnect();
			return svo;
		}else {
			DBDisConnect();
			return null;
		}
	}
	
//	전체 파일 left join으로 불러서 연도 구 서비스 로 조회
	public seoulAllVO joinSeoulOne(shopSalesVO vo) {
		driverLoad();
		DBConnect();
		
		String sql = "select * from df_seoul_store_sales_final as sFinal left join df_seoul_all as sAll on sAll.year_code = sfinal.year_code and sAll.Gu_code = sFinal.Gu_code where (sAll.year_code = '" + vo.getYearCode() + "' and sAll.Gu_code = '" + vo.getGuCode() + "' and sfinal.service_code like '%" + vo.getServiceCode() + "%')";
//		서비스 코드까지 조회해서 가져온다
		
//		"select * from df_seoul_store_sales_final as sFinal left join df_seoul_all as sAll on sAll.year_code = sfinal.year_code and sAll.Gu_code = sFinal.Gu_code where (sAll.year_code = '" + vo.getYearCode() + "' and sAll.Gu_code = '" + vo.getGuCode() + "')"

		executeQuery(sql);
		
		
		if(next()) {
//			vo.setAge10Company(getString(sql)); 으로 vo에 넣어주기
			
			seoulAllVO svo = new seoulAllVO();
			
//			
			
			DBDisConnect();
			return svo;
		}else {
			DBDisConnect();
			return null;
		}
	}
	
//	전체 파일 left join으로 불러오기
	public List<seoulAllVO> joinSeoulAll(shopSalesVO vo) {
		driverLoad();
		DBConnect();
		
		String sql = "select * from df_seoul_store_sales_final as sFinal left join df_seoul_all as sAll on sAll.year_code = sfinal.year_code and sAll.Gu_code = sFinal.Gu_code where (sAll.year_code = '" + vo.getYearCode() + "' and sAll.Gu_code = '" + vo.getGuCode() + "')";
		executeQuery(sql);
		
		List<seoulAllVO> list = new ArrayList<>();
		while(next()) {
			seoulAllVO svo = new seoulAllVO();
//			vo 만들어서 데이터 가져오기
			
			
			
			
			list.add(svo);
		}
		DBDisConnect();
		return list;
	}
	
}
