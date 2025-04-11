<%@page import="board.boardVO"%>
<%@page import="board.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	
	String title = request.getParameter("title");
	String content = request. getParameter("content");
	
	if(title == null || content == null){
		response.sendRedirect("write.jsp");
		return;
	}
	
	if(title.isEmpty() || content.isEmpty()){
		response.sendRedirect("write.jsp");
		return;
	}
	
	boardDAO dao = new boardDAO();
	boardVO vo = new boardVO();
	
	vo.setTitle(title);
	vo.setContent(content);
	/* vo.setBoardType(1); */
	
	
	int no = dao.write(vo);
	
	response.sendRedirect("seoulNews.jsp?no="+no);
	%>