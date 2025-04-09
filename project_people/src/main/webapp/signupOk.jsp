<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.userVO"%>
<%@ page import="user.userDAO"%>

<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	String number = request.getParameter("phoneNumber");
	
	System.out.println("아이디는 : " + id);
	System.out.println("비밀번호는 : " + pw);
	// 여기까지는 출력은 잘되는데.......
	
	if(id == null || pw == null || name == null || email == null || address == null || number == null){
		response.sendRedirect("signup.jsp");
		return;
	}
	if(id.isEmpty() || pw.isEmpty() || name.isEmpty() || email.isEmpty() || address.isEmpty() || number.isEmpty()){
		response.sendRedirect("signup.jsp");
		return;
	}
	
	userDAO dao = new userDAO();
	userVO vo = new userVO();
	
	vo.setId(id);
	vo.setPw(pw);
	vo.setName(name);
	vo.setEmail(email);
	vo.setAddress(address);
	vo.setPhoneNumber(number);
	
	dao.join(vo);
	
	response.sendRedirect("login.jsp");
	//sendRedirect 실행안됨?! 로그인페이지로 이동되지 않음!!
%>