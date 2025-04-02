package shopSales;

import db.DBManager;

public class shopSalesDAO extends DBManager {
// 조회?
	
	public void selShopSals() {
		driverLoad();
		DBConnect();
		
		String sql = "select * from df_seoul_store_sales_final";
		executeQuery(sql);
		
		while(next()) {
//			vo 만들어서 데이터 가져오기
		}
	}
	
	
}
