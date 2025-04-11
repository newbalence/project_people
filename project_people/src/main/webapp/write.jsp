<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서울소식</title>
<link rel="stylesheet" href="./css/write.css"></link>
</head>
<body>
	<div class="board-container">
		<h2>서울소식 글쓰기</h2>
		<form method="post" action="writeok.jsp" enctype="multipart/form-data">
			<div class="title">
				<label for="title">제목</label><br>
	            <input type="text" id="title" name="title" placeholder="제목을 입력하세요"><br>
			</div>
			<div>
	            <label for="content">내용</label><br>
	            <textarea wrap="hard" id="content" name="content" placeholder="내용을 입력하세요"></textarea><br>
			</div>
	<div class="action">
                <button type="submit">등록</button>
                <button type="button" onclick="location.href='seoulNews.jsp'">취소</button>
            </div>
		</form>
    </div>
</body>
</html>