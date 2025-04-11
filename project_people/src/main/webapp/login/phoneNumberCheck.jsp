<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.userDAO"%>

<%
	String num = request.getParameter("num");
	userDAO dao = new userDAO();
	
	int result = dao.numberCheck(num);
	out.print(result);
%>