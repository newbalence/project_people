<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.userDAO"%>

<%
	String email = request.getParameter("email");
	userDAO dao = new userDAO();
	
	int result = dao.emailCheck(email);
%>
