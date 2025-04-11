package best;

import db.DBManager;
import shopSales.shopSalesVO;

public class bestDAO extends DBManager {
	
//	Best 업종 점포수
	public shopSalesVO bestStore(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "select service_code, service_code_name, similar_store ";
		sql += "from df_seoul_test ";
		sql += "where Gu_code = '" + code + "' and year_code ='20244' ";
		sql += "order by store desc limit 1";
		
		executeQuery(sql);

		shopSalesVO vo = new shopSalesVO();
		if(next()) {
			String serviceCode = getString("service_code");
			String serviceCodeName = getString("service_code_name");
			String similarStore = String.valueOf(getInt("similar_store"));
			
			vo.setServiceCode(serviceCode);
			vo.setServiceCodeName(serviceCodeName);
			vo.setSimilarStore(similarStore);
			
			DBDisConnect();
			return vo;
			
		}else {
			DBDisConnect();
			return null;
		}
	}
	
//	Best 업종 개업수
	public shopSalesVO bestOpen(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "select service_code, service_code_name, open_store ";
		sql += "from df_seoul_test ";
		sql += "where Gu_code = '" + code + "' and year_code ='20244' ";
		sql += "order by open_store desc limit 1";
		
		executeQuery(sql);

		shopSalesVO vo = new shopSalesVO();
		if(next()) {
			String serviceCode = getString("service_code");
			String serviceCodeName = getString("service_code_name");
			String openStore = String.valueOf(getInt("open_store"));
			
			vo.setServiceCode(serviceCode);
			vo.setServiceCodeName(serviceCodeName);
			vo.setOpenStore(openStore);
			
			DBDisConnect();
			return vo;
			
		}else {
			DBDisConnect();
			return null;
		}
	}
	
//	Best 업종 폐업수
	public shopSalesVO bestClose(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "select service_code, service_code_name, close_store ";
		sql += "from df_seoul_test ";
		sql += "where Gu_code = '" + code + "' and year_code ='20244' ";
		sql += "order by close_store desc limit 1";
		
		executeQuery(sql);

		shopSalesVO vo = new shopSalesVO();
		if(next()) {
			String serviceCode = getString("service_code");
			String serviceCodeName = getString("service_code_name");
			String closeStore = String.valueOf(getInt("close_store"));
			
			vo.setServiceCode(serviceCode);
			vo.setServiceCodeName(serviceCodeName);
			vo.setCloseStore(closeStore);
			
			DBDisConnect();
			return vo;
			
		}else {
			DBDisConnect();
			return null;
		}
	}
	
//	Best 업종 프렌차이즈수
	public shopSalesVO bestFranchise(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "select service_code, service_code_name, Franchise_store ";
		sql += "from df_seoul_test ";
		sql += "where Gu_code = '" + code + "' and year_code ='20244' ";
		sql += "order by Franchise_store desc limit 1";
		
		executeQuery(sql);

		shopSalesVO vo = new shopSalesVO();
		if(next()) {
			String serviceCode = getString("service_code");
			String serviceCodeName = getString("service_code_name");
			String FranchiseStore = String.valueOf(getInt("Franchise_store"));
			
			vo.setServiceCode(serviceCode);
			vo.setServiceCodeName(serviceCodeName);
			vo.setFranchiseStore(FranchiseStore);
			
			DBDisConnect();
			return vo;
			
		}else {
			DBDisConnect();
			return null;
		}
	}
	

	
	
	
	
	
	
	
	
}
