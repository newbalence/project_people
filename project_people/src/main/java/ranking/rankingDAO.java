package ranking;

import db.DBManager;
import seoulAll.seoulAllVO;
import shopSales.shopSalesVO;

public class rankingDAO extends DBManager {

	
//	자치구 점포수 순위
	public shopSalesVO guStoreOne(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "select Gu_code, Gu_code_name, t.score ";
		sql += "from (select Gu_code, Gu_code_name, rank() over(order by sum(store) desc) ";
		sql += "as score from df_seoul_store_sales_final group by Gu_code, Gu_code_name) ";
		sql += "t where Gu_code = '" + code + "';";
		
		executeQuery(sql);
		
		shopSalesVO vo = new shopSalesVO();
		if(next()) {
			String guCode = getString("Gu_code");
			String guCodeName = getString("Gu_code_name");
			String score = getString("score");
			
			vo.setGuCode(guCode);
			vo.setGuCodeName(guCodeName);
			vo.setScore(score);
			
			DBDisConnect();
			return vo;
		}else {			
			DBDisConnect();
			return null;
		}
	}
	
	
//	자치구 매출액 순위
	public shopSalesVO guPayOne(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "select Gu_code, Gu_code_name, t.score ";
		sql += "from (select Gu_code, Gu_code_name, rank() over(order by sum(month_sales_pay) desc) ";
		sql += "as score from df_seoul_store_sales_final group by Gu_code, Gu_code_name) ";
		sql += "t where Gu_code = '" + code + "';";
		
		executeQuery(sql);
		
		shopSalesVO vo = new shopSalesVO();
		if(next()) {
			String guCode = getString("Gu_code");
			String guCodeName = getString("Gu_code_name");
			String score = getString("score");
			
			vo.setGuCode(guCode);
			vo.setGuCodeName(guCodeName);
			vo.setScore(score);
			
			DBDisConnect();
			return vo;
		}else {			
			DBDisConnect();
			return null;
		}
	}
	
	
//	자치구 유동인구 수 순위
	public seoulAllVO guMoveOne(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "select Gu_code, Gu_code_name, t.score ";
		sql += "from (select Gu_code, Gu_code_name, rank() over(order by sum(all_move_people) desc) ";
		sql += "as score from df_seoul_all group by Gu_code, Gu_code_name) ";
		sql += "t where Gu_code = '" + code + "';";
		
		executeQuery(sql);

		seoulAllVO vo = new seoulAllVO();
		if(next()) {
			String guCode = getString("Gu_code");
			String guCodeName = getString("Gu_code_name");
			String score = getString("score");
			
			vo.setGuCode(guCode);
			vo.setGuCodeName(guCodeName);
			vo.setScore(score);
			
			DBDisConnect();
			return vo;
		}else {			
			DBDisConnect();
			return null;
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
