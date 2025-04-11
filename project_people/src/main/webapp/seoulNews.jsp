<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@page import="board.boardVO"%>
<%@page import="board.boardDAO"%>
<%@page import="java.util.List"%>

<%

String no = request.getParameter("no");
if(no == null){
	response.sendRedirect("seoulNews.jsp");
	return;
}

boardDAO dao = new boardDAO();
boardVO vo = dao.view(no);
String title = vo.getTitle();
String author = vo.getAuthor();
String content = vo.getContent();
String createDate = vo.getCreateDate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서울 소식</title>
<link rel="stylesheet" href="./css/seolNews.css"></link>
</head>
<body>
	<div class="detail-container">
		<div class="back" onclick="history.back()">&larr;</div>
        <h2>제목</h2>
        <div class="meta">작성자:  | 작성일: </div>
        <div class="post-content">
            <p>내용</p>
        </div>
               
       <%--  <%
        	
        	//게시글을 작성한 작성자 아이디(author)==관리자가 같으면 수정 삭제 버튼 표출
        	if((user.getId().equals(author) || user.getUserType() == 0)){
        		%> --%>
        <div class="post-actions">
            <button onclick="location.href='modify.jsp?no=<%-- <%=no %> --%>'">게시글 수정</button>
            <button onclick="deletePost(<%-- <%=no %> --%>)">게시글 삭제</button>
        </div>
        <%-- 		<%
        	}
        %>
         --%>
        
        </div>
         <div class="actions">
            <button class="return" onclick="history.back()">뒤로가기</button>
        </div> 
  
</body>
</html>