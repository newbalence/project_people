<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/left.css"></link>
</head>
<body>
	<nav id="sideMenu" style="height: 80px;">
	  <div class="toggle_view bigArea"">
	    <dt>나도 곧 사장</dt>
	  </div>
	  <button onclick="toggle_view" class="bigToggle"><img src="./img/arrow_bottom_blue.svg"></button>
	</nav>
	<div class="recentAddr" style="z-index:9;">
	  <img src="./img/i_address.svg">
	  <span class="seo">서울특별시</span>
	<div class="all">
      <span class="che">전체</span>
      <img src="./img/arrow_bottom_blue.svg">
	</div>
	<div class="All">
      <span class="che">전체</span>
      <img src="./img/arrow_bottom_blue.svg">
	</div>
	</div>
	<div class="mapBtn">
	  <span id="now" class="now">
	    <button><img src="./img/i_currentSpot.svg" style="width: 25px; height:25px;"></button>
	  </span>
	  <ul class="maptype">
	    <li id="btnContour" class="btnContour">
	      <button>
	        <span>지형도</span>
	      </button>
	    </li>
	  </ul>
	</div>
</body>
</html>