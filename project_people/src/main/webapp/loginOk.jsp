<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.userDAO"%>
<%@page import="user.userVO"%>
<%
String id = request.getParameter("userId");
String pw = request.getParameter("password");
String idSaveCheck = request.getParameter("idSaveCheck");

if(id == null || pw == null){
	System.out.println("아이디 비밀번호 null?");
	response.sendRedirect("login.jsp");
	return;
}		
if(id.isEmpty() || pw.isEmpty()){
	response.sendRedirect("login.jsp");
	return;
}

userDAO dao = new userDAO();
userVO vo = new userVO();
vo.setId(id);
vo.setPw(pw);

userVO user = dao.login(vo);

if( user == null){
	session.setAttribute("id", id);
	response.sendRedirect("login.jsp");
	return;
} 
 
session.removeAttribute("id");
session.setAttribute("user", user);
if(idSaveCheck != null){
	//화면에서 자동로그인 체크 했을 때 아이디 저장
	Cookie cookie = new Cookie("id", "id_"+id);
	cookie.setMaxAge(1 * 60 * 60 * 24 * 10);
	
	response.addCookie(cookie);
}

session.setAttribute("user", user);

response.sendRedirect("test.jsp");


%>