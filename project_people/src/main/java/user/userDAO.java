package user;

import java.util.ArrayList;
import java.util.List;

import db.DBManager;


public class userDAO extends DBManager {
	//회원가입
	public void join(userVO vo) {
		String id = vo.getId();
		String pw = vo.getPw();
		String name = vo.getName();
		String email = vo.getEmail();
		String address = vo.getAddress();
		String phoneNumber = vo.getPhoneNumber();
		
		
		driverLoad();
		DBConnect();
		
		String sql = "";
		sql += "insert into user(id, pw, name, email, address, phoneNumber)";
		sql += "values('"+id+"', '"+pw+"', '"+name+"', '"+email+"', '"+address+"', '"+phoneNumber+"');";
		executeUpdate(sql);
		
		DBDisConnect();
	}
	//로그인
	public userVO login(userVO uvo) {
		driverLoad();
		DBConnect();
		
		String sql ="";
		sql += "select * from user where ";
		sql += "id='"+uvo.getId()+"' and pw= '"+uvo.getPw()+"' and user_type != 99";
		executeQuery(sql);
		
		if(next()) {
			userVO vo = new userVO();
			vo.setId(getString("id"));
			vo.setPw(getString("pw"));
			vo.setName(getString("name"));
			vo.setEmail(getString("email"));
			vo.setAddress(getString("address"));
			vo.setPhoneNumber(getString("phoneNumber"));
			
			DBDisConnect();
			return vo;
		}else {
			DBDisConnect();
			return null;
		}
	}
	
	//회원수정
	public void modify(userVO vo) {
		driverLoad();
		DBConnect();
		
		String sql ="update user set ";
		sql += "pw = '"+vo.getPw()+"', update_date = now() ";
		sql += "where id = '"+vo.getId()+"'";
		executeUpdate(sql);
		DBDisConnect();
	}
	
	//회원탈퇴
	public void delete(String id) {
		driverLoad();
		DBConnect();
		
		String sql ="update user set user_type = 99 where id = '"+id+"'";
		executeUpdate(sql);
		
		DBDisConnect();
	}
	
	//아이디 중복체크
	public int idCheck(String id) {
		driverLoad();
		DBConnect();
		
		String sql="select count(*) as cnt from user where id = '"+id+"';";
		executeQuery(sql);
		
		if(next()) {
			int cnt = getInt("cnt");
			DBDisConnect();
			return cnt;
		}else {
			DBDisConnect();
			return 1;
		}
	}
	
	//이메일 중복체크
	public int emailCheck(String email) {
		driverLoad();
		DBConnect();
		
		String sql="select count(*) as cnt from user where email = '"+email+"';";
		executeQuery(sql);
		
		if(next()) {
			int cnt = getInt("cnt");
			DBDisConnect();
			return cnt;
		}else {
			DBDisConnect();
			return 1;
		}
	}
	
	//전화번호 중복체크
	public int numberCheck(String phoneNumber) {
		driverLoad();
		DBConnect();
		
		String sql="select count(*) as cnt from user where phoneNumber = '"+phoneNumber+"';";
		executeQuery(sql);
		
		if(next()) {
			int cnt = getInt("cnt");
			DBDisConnect();
			return cnt;
		}else {
			DBDisConnect();
			return 1;
		}
	}
	//회원목록조회
	public List<userVO> getAllUser() {
		driverLoad();
		DBConnect();
		
		String sql="";
		executeQuery(sql);
		
		List<userVO> list = new ArrayList<>();
		
		while(next()) {
			userVO vo = new userVO();
			vo.setId(getString("id"));
			vo.setPw(getString("pw"));
			vo.setEmail(getString("email"));
			vo.setName(getString("name"));
			
			list.add(vo);
		}
		DBDisConnect();
		return list;
	}
}
