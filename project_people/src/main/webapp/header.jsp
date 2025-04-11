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
	<script src="./js/jquery-3.7.1.js"></script>
</head>
<body>
	<div class="wrap">
		<div class="header">
			<ul class="nav">
				<li><img src="./img/free-icon-thumb-up-12526118.png" alt="아이콘 사진" class="icon-img"><a onclick="location.href='https://www.seoul.go.kr/main/index.jsp'" title="새창알림" class="main">EZEN Project</a></li>
			</ul>
			<!-- <div class="seoul-gnb-news">
				<div class="news">
					<a href="https://www.seoul.go.kr/realmnews/in/list.do" target="_blank" title="새창열림(서울소식)" class="seoul-gnb-icon-notice"><img style="border-radius: 10px; width: 35px; margin-right: 10px;" src="./img/announcement.png"></a>
					<a href="https://news.seoul.go.kr/culture/archives/527415" target="_blank" title="새창열림" style="color: #fff; font-size: 15px;">서울스트링페스타 로드쇼 편 아니트워크 5K 5월4일 광화문광장 청화대일원</a>
				</div>
			</div> -->
			<div class="hea">
				<li><a class="main" onclick="alert('추후 제공 예정')">소식</a></li>
				<li><a class="main" onclick="alert('추후 제공 예정')">응답소</a></li>
				<li><a class="main" onclick="location.href='https://data.seoul.go.kr/'">정보공개</a></li>
				<li id="type"><a class="main">분야별정보</a>
				<div id="information" class="infort">
					<div class="category">안녕</div>
					<div class="category">클래오</div>
					<div class="category">파트라</div>
				</div>
				</li>
			</div>
		</div>
	</div>
	<div id="hd" class="hd">
		<div id="icon">
		  <img src="./img/shop.svg">
		  <a id="name">EZEN <spnan id="shop">상권분석</spnan> 서비스 </a>
		 </div>
		<div id="second">
			<li class="commercial"><a onclick="location.href='test.jsp'" class="inner">떠오르는 상권</a></li>
			<!-- <li class="onner"><a class="inner">나는 사장</a></li>
			<li class="onner_soon"><a class="inner">나도 곧 사장?!</a></li>
			<li class="state"><a class="inner">지역·상권별 현황</a></li> -->
			<li class="step"><a onclick="location.href='guide.jsp'" class="inner">이용안내</a></li>
		</div>
		<div id="thrd">
			<div id="login">
				<img style="padding: 0px 8px;" src="./img/log.svg">
			    <a onclick="location.href='login.jsp'" style="cursor:pointer;">로그인</a>
		    </div>
		    <!-- <img src="./img/chat.svg">
		    <a href="#" class="chatbot" ></a> -->
		</div>
		
	</div>
</body>
<script>
$("#type").click(function(){
	report = $("#information").attr('class')
	
	if(report == "infort"){
		$("#information").attr('class', "infortview")
	}else if(report == "infortview"){
		$("#information").attr('class', "infort")
	}else{
		alert("오류발생")
	}
});
</script>
</html>
