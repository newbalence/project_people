package seoulAll;

import db.DBManager;

public class seoulAllDAO extends DBManager {
// 조회
	
	public void selSeoulAll() {
		driverLoad();
		DBConnect();
		
		String sql = "select * from df_seoul_all";
		executeQuery(sql);
		
		while(next()) {
//			vo 만들어서 데이터 가져오기
		}
	}
	
}
