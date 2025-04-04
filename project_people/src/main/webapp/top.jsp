<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/top.css"></link>
</head>
<body>
	<nav id="sideMenu">
	<div class="me">
	  <div class="toggle_view bigArea"">
	    <dt>나도 곧 사장</dt>
	  </div>
	  <button onclick="toggle_view" class="bigToggle"><img src="./img/arrow_bottom_blue.svg"></button>
	</div>
	</nav>
	<div class="seoul">
	<div class="recentAddr">
		<img src="./img/i_address.svg" style="height: 25px;">
	  	<span class="seo">서울특별시</span>
	</div>
		<div class="all">
	      <span class="che">전체</span>
	      <img src="./img/arrow_bottom_blue.svg">
		</div>
		<div class="All">
	      <span class="che">전체</span>
	      <img src="./img/arrow_bottom_blue.svg">
		</div>
	</div>

	<div>
		<div class="mapBtn">
		  <div id="now" class="now">
		    <button><img src="./img/i_currentSpot.svg"f></button>
		  </div>
		  <div class="bong">
			  <div class="maptype">
			    <button><img src="./img/i_contour.svg"></button>
			  </div>
			  <div class="btnSat">
			    <button><img src="./img/i_satellite.svg"></button>
			  </div>
			  <div class="btnRv">
			    <button><img src="./img/i_road.svg"></button>
			  </div>
		  </div>
		  <div class="bong">
		  	  <div class="distance">
			    <button><img src="./img/i_distance.svg"></button>
			  </div>
			  <div class="Area">
			    <button><img src="./img/i_area.svg"></button>
			  </div>
			  <div class="clear">
			    <button><img src="./img/i_erase.svg"></button>
			  </div>
		  </div>
		  <div class="bong">
		  	  <div class="zmin">
			    <button><img src="./img/i_zoomin.svg"></button>
			  </div>
			  <div class="zmout">
			    <button><img src="./img/i_zoomout.svg"></button>
			  </div>
		</div>
		</div>
	</div>
</body>
</html>