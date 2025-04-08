package area;

import db.DBManager;

public class seoulAreaDAO extends DBManager {
//	좌표 가져오기
	public seoulAreaVO areaCode(String code) {
		driverLoad();
		DBConnect();
		
		String sql = "select Gu_code_name, x_code, y_code, Gu_area from df_seoul_area where Gu_code = '" + code + "'";
		
		executeQuery(sql);
		
		if(next()) {
			String GuCodeName = getString("Gu_code_name");
			String xCode = getString("x_code");
			String yCode = getString("y_code");
			String GuArea= String.valueOf(getLong("Gu_area"));
			
			seoulAreaVO vo = new seoulAreaVO();
			vo.setGuCodeName(GuCodeName);
			vo.setxCode(xCode);
			vo.setyCode(yCode);
			vo.setGuArea(GuArea);
			
			DBDisConnect();
			return vo;
			
		}else {
			DBDisConnect();
			return null;
		}
	}
}
