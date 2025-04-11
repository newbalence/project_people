package board;

import db.DBManager;
import java.util.ArrayList;
import java.util.List;

public class boardDAO extends DBManager {

	//글작성
	public int write(boardVO vo) {
		
		String author = vo.getAuthor();
		String title = vo.getTitle();
		String content = vo.getContent();
		
		driverLoad();
		DBConnect();
		
		String sql = "insert into board(author, title, content) ";
		sql += "values('"+author+"', '"+title+"', '"+content+")";
		executeUpdate(sql);
		
		sql = "select last_insert_id() as no";
		executeQuery(sql);
		
		if(next()) {
			int no = getInt("no");
			DBDisConnect();
			return no;
		}else {
			DBDisConnect();
			return 0;
		}
	}
	
	//글수정
		public void modify(boardVO vo) {
			
			String title = vo.getTitle();
			String content = vo.getContent();
			String no = vo.getNo();
			
			driverLoad();
			DBConnect();
			
			String sql = "update board set title = '"+title+"', content = '"+content+"', ";
			sql += "update_date = now() where no = "+no+" ";
			executeUpdate(sql);
			
			DBDisConnect();
		}
		
		//글삭제
		public void delete(String no) {
			driverLoad();
			DBConnect();
			
			String sql = "update board set board_type = 99 where no = " + no;
			executeUpdate(sql);
			
			DBDisConnect();
		}
		
		//4. 글 조회(단건)
		public boardVO view(String bno) {
			driverLoad();
			DBConnect();
			
			String sql = "";
			sql += "select * from board where board_type != 99 ";
			sql += "and no = " + bno;
			executeQuery(sql);
			
			if(next()) {
				String no = getString("no");
				String title = getString("title");
				String content = getString("content");
				String author = getString("author");
				String createDate = getString("create_date");
				String updateDate = getString("update_date");
							
				boardVO vo = new boardVO();
				vo.setNo(no);
				vo.setTitle(title);
				vo.setContent(content);
				vo.setAuthor(author);
				vo.setCreateDate(createDate);
				vo.setUpdateDate(updateDate);
				
				
				DBDisConnect();
				return vo;
			}else {
				DBDisConnect();
				return null;
			}
		}
		
	//5. 글 조회(여러건)
	public List<boardVO> listView(String searchType, String keyword, int startNum, int limitSize){
		driverLoad();
		DBConnect();
		
		String sql = "select * from board where board_type != 99";
		if(searchType != null && keyword != null) {
			sql += " and "+searchType+" like '%"+keyword+"%'";
		}
		sql += " limit "+ startNum + ", " + limitSize;
		
		executeQuery(sql);
		
		List<boardVO> list = new ArrayList<>();
		
		while(next()) {
			String no = getString("no");
			String title = getString("title");
			String author = getString("author");
			String createDate = getString("create_date");
			
			boardVO vo = new boardVO();
			vo.setNo(no);
			vo.setTitle(title);
			vo.setAuthor(author);
			vo.setCreateDate(createDate);
			
			list.add(vo);
		}
		DBDisConnect();
		return list;
	}
	
	//6.게시글 갯수 조회
		public int getCount(String searchType, String keyword) {
			driverLoad();
			DBConnect();
			
			String sql = " select count(*) as cnt from board where board_type != 99";
			if(searchType != null && keyword != null) {
				sql += " and " + searchType + " like '%" + keyword + "%'";
			}
			executeQuery(sql);
			
			if(next()) {
				int count = getInt("cnt");
				DBDisConnect();
				return count;
			}else {
				DBDisConnect();
				return 0;
			}
		}
		
}
