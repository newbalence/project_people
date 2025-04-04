import ranking.rankingDAO;
import seoulAll.seoulAllVO;
import shopSales.shopSalesVO;

public class test {

	public static void main(String[] args) {
		rankingDAO dao = new rankingDAO();
		String code = "11110" ;
		seoulAllVO vo = dao.guMoveOne(code);
		System.out.println(vo.getScore());
		System.out.println(vo.getGuCode());
		System.out.println(vo.getGuCodeName());
		
		shopSalesVO svo = dao.guPayOne(code);
		System.out.println(vo.getScore());
		System.out.println(vo.getGuCode());
		System.out.println(vo.getGuCodeName());
		
		svo = dao.guStoreOne(code);
		System.out.println(svo.getScore());
		System.out.println(svo.getGuCode());
		System.out.println(svo.getGuCodeName());
		
		
	}

}
