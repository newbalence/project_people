<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="./css/header.css"></link>
	<link rel="stylesheet" href="./img/icon.jpg"></link>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	
</head>
<body>
	<div class="wrap">
		<div class="header">
			<ul class="nav">
				<li><img src="./img/bi_seoul.svg" alt="아이콘 사진" class="icon-img"><a href="https://www.seoul.go.kr" title="새창알림" class="seoul">서울특별시</li>
			</ul>
			<div class="hea">
				<li><a onclick="location.href='https://www.seoul.go.kr/realmnews/in/list.do'">서울소식</a></li>
				<li><a onclick="location.href='https://eungdapso.seoul.go.kr/main.do'">응답소</a></li>
				<li><a onclick="location.href='https://opengov.seoul.go.kr/'">정보공개</a></li>
				<li><a>분야별정보</a>
				<div id="information">
					<div>안녕</div>
					<div>클래오</div>
					<div>파트라</div>
				</div>
				</li>
			</div>
		</div>
	</div>
	<div id="hd" class="hd">
		<div id="icon">
		  <img src="./img/shop.svg">
		  <a href="https://golmok.seoul.go.kr/main.do" id="name">서울시 <spnan id="shop">상권분석</spnan> 서비스 </a>
		 </div>
		<div id="second">
			<li class="commercial"><a class="inner">떠오르는 상권</a></li>
			<li class="onner"><a class="inner">나는 사장</a></li>
			<li class="onner_soon"><a class="inner">나도 곧 사장?!</a></li>
			<li class="state"><a class="inner">지역·상권별 현황</a></li>
			<li class="step"><a onclick="location.href='use_info.jsp'" class="inner">이용안내</a></li>
		</div>
		<div id="thrd">
			<div id="login">
				<img src="./img/log.svg">
			    <a href="#">로그인</a>
		    </div>
		    <img src="./img/chat.svg">
		    <a href="#" class="chatbot" ></a>
		</div>
	</div>
</body>
<script>

</script>
</html>