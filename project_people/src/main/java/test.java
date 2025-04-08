import java.util.ArrayList;
import java.util.List;

import best.bestDAO;
import ranking.rankingDAO;
import report.localReportDAO;
import report.payReportDAO;
import report.peopleReportDAO;
import report.storeReportDAO;
import seoulAll.seoulAllVO;
import shopSales.shopSalesVO;

public class test {

	public static void main(String[] args) {

		localReportDAO dao = new localReportDAO();
		seoulAllVO vo = new seoulAllVO();
		String code = "11110";
		List<seoulAllVO> list = new ArrayList<>();
		list = dao.allIncome(code);
		
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
		
//		System.out.println(vo);
		
		
		
		
	}

}
