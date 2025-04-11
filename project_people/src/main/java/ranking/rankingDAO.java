package ranking;

import java.util.ArrayList;
import java.util.List;

import org.w3c.dom.html.HTMLDListElement;

import db.DBManager;
import seoulAll.seoulAllVO;
import shopSales.shopSalesVO;

public class rankingDAO extends DBManager {

	
//	자치구 점포수 순위
	public shopSalesVO guStoreOne(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "select Gu_code, Gu_code_name, t.score ";
		sql += "from (select Gu_code, Gu_code_name, rank() over(order by sum(similar_store) desc) ";
		sql += "as score from df_seoul_test where year_code = 20244 group by Gu_code, Gu_code_name) ";
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
		sql += "as score from df_seoul_test where year_code = 20244 group by Gu_code, Gu_code_name) ";
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
		sql += "as score from df_seoul_all where year_code = 20244 group by Gu_code, Gu_code_name) ";
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
	
	
	
//	전체 10위 랭킹 구하기
//	자치구 점포수 순위
	public List<shopSalesVO> guStoreTen() {
		driverLoad();
		DBConnect();
		
		String sql = "select Gu_code, Gu_code_name, t.score , sumsim ";
		sql += "from (select Gu_code, Gu_code_name, sum(similar_store)as sumsim, rank() over(order by sum(similar_store) desc) ";
		sql += "as score from df_seoul_test where year_code = 20244 group by Gu_code, Gu_code_name) t limit 10";
		
		executeQuery(sql);
		
		List<shopSalesVO> list = new ArrayList<>();
		while(next()) {
			String guCode = getString("Gu_code");
			String guCodeName = getString("Gu_code_name");
			String score = getString("score");
			String store = String.valueOf(getLong("sumsim"));
			
			shopSalesVO vo = new shopSalesVO();
			vo.setGuCode(guCode);
			vo.setGuCodeName(guCodeName);
			vo.setScore(score);
			vo.setSimilarStore(store);
			
			list.add(vo);
		}
		DBDisConnect();
		return list;
	}

//	자치구 매출액 순위
	public List<shopSalesVO> guPayTen() {
		driverLoad();
		DBConnect();
		
		String sql = "select Gu_code, Gu_code_name, t.score , (sumsim / sumstore / 3) as sumsims ";
		sql += "from (select Gu_code, Gu_code_name, sum(similar_store) as sumstore, sum(Month_sales_pay)as sumsim, rank() over(order by sum(Month_sales_pay) desc) ";
		sql += "as score from df_seoul_test where year_code = 20244 group by Gu_code, Gu_code_name) t limit 10;";
		
		executeQuery(sql);
		
		List<shopSalesVO> list = new ArrayList<>();
		while(next()) {
			String guCode = getString("Gu_code");
			String guCodeName = getString("Gu_code_name");
			String score = getString("score");
			String pay = String.valueOf(getLong("sumsims"));
			
			shopSalesVO vo = new shopSalesVO();
			vo.setGuCode(guCode);
			vo.setGuCodeName(guCodeName);
			vo.setScore(score);
			vo.setMonthSalesPay(pay);
			
			list.add(vo);
		}
		DBDisConnect();
		return list;
	}
	
	
//	자치구 유동인구 수 순위
	public List<seoulAllVO> guMoveTen() {
		driverLoad();
		DBConnect();
		
		String sql = "select Gu_code, Gu_code_name, t.score , sumsim ";
		sql += "from (select Gu_code, Gu_code_name, sum(all_move_people)as sumsim, rank() over(order by sum(all_move_people) desc) ";
		sql += "as score from df_seoul_all where year_code = 20244 group by Gu_code, Gu_code_name) t limit 10;";
		
		executeQuery(sql);

		List<seoulAllVO> list = new ArrayList<>();
		while(next()) {
			String guCode = getString("Gu_code");
			String guCodeName = getString("Gu_code_name");
			String score = getString("score");
			String move = String.valueOf(getLong("sumsim"));
			
			seoulAllVO vo = new seoulAllVO();
			vo.setGuCode(guCode);
			vo.setGuCodeName(guCodeName);
			vo.setScore(score);
			vo.setAllMovePeople(move);
			
			list.add(vo);
		}
		DBDisConnect();
		return list;
	}
	
//	자치구 거주인구 순위
	public List<seoulAllVO> guLiveTen() {
		driverLoad();
		DBConnect();
		
		String sql = "select Gu_code, Gu_code_name, t.score , sumsim ";
		sql += "from (select Gu_code, Gu_code_name, sum(all_live_people)as sumsim, rank() over(order by sum(all_live_people) desc) ";
		sql += "as score from df_seoul_all where year_code = 20244 group by Gu_code, Gu_code_name) t limit 10;";
		
		executeQuery(sql);

		List<seoulAllVO> list = new ArrayList<>();
		while(next()) {
			String guCode = getString("Gu_code");
			String guCodeName = getString("Gu_code_name");
			String score = getString("score");
			String live = String.valueOf(getLong("sumsim"));
			
			seoulAllVO vo = new seoulAllVO();
			vo.setGuCode(guCode);
			vo.setGuCodeName(guCodeName);
			vo.setScore(score);
			vo.setAllLivePeople(live);
			
			list.add(vo);
		}
		DBDisConnect();
		return list;
	}
	
	//서비스 코드 가져오기
	public List<seoulAllVO> serviceCodeName() {
		driverLoad();
		DBConnect();
		
		String sql = "select Gu_code, Gu_code_name, t.score , sumsim ";
		sql += "from (select Gu_code, Gu_code_name, sum(all_live_people)as sumsim, rank() over(order by sum(all_live_people) desc) ";
		sql += "as score from df_seoul_all where year_code = 20244 group by Gu_code, Gu_code_name) t limit 10;";
		
		executeQuery(sql);

		List<seoulAllVO> list = new ArrayList<>();
		while(next()) {
			String guCode = getString("Gu_code");
			String guCodeName = getString("Gu_code_name");
			String score = getString("score");
			String live = String.valueOf(getLong("sumsim"));
			
			seoulAllVO vo = new seoulAllVO();
			vo.setGuCode(guCode);
			vo.setGuCodeName(guCodeName);
			vo.setScore(score);
			vo.setAllLivePeople(live);
			
			list.add(vo);
		}
		DBDisConnect();
		return list;
	}
	
	
	
	
	
	
	
	
}
