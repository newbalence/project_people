<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.userDAO"%>
<%
	String id = request.getParameter("id");
	userDAO dao = new userDAO();
	
	int result = dao.idCheck(id);
%>