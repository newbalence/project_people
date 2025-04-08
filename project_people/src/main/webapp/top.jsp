<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="./css/top.css"></link>
</head>
<body>
	<nav id="sideMenu">
	<div class="me">
	  <!-- <div class="toggle_view bigArea"">
	    <dt>뜨는 상권</dt>
	  </div> -->
	  <button onclick="toggle_view" class="bigToggle"><img src="./img/arrow_bottom_blue.svg"></button>
	</div>
	<div class="big_distruct">
	<div class="wrap_box">
		<h3>뜨는 상권</h3>
	<div id="searchSigunList">
		<select id="selectSigun" class="radius" title="서울 구역 선택">
			<option vlaue="11">서울시 전체<img src="./img/arrow_bottom.svg"></option>
			<option vlaue="11680">강남구</option>
			<option vlaue="11740">강동구</option>
			<option vlaue="11305">강북구</option>
			<option vlaue="11500">강서구</option>
			<option vlaue="11620">관악구</option>
			<option vlaue="11215">구로구</option>
			<option vlaue="11545">금천구</option>
			<option vlaue="11350">노원구</option>
			<option vlaue="11320">도봉구</option>
			<option vlaue="11230">동대문구</option>
			<option vlaue="11590">동작구</option>
			<option vlaue="11440">마포구</option>
			<option vlaue="11410">서대문구</option>
			<option vlaue="11650">서초구</option>
			<option vlaue="11200">성동구</option>
			<option vlaue="11290">성북구</option>
			<option vlaue="11710">송파구</option>
			<option vlaue="11470">양천구</option>
			<option vlaue="11560">영등포구</option>
			<option vlaue="11170">용산구</option>
			<option vlaue="11380">은평구</option>
			<option vlaue="11110">종로구</option>
			<option vlaue="11140">중구</option>
			<option vlaue="11260">중랑구</option>
		</select>
	</div>
		<p class="box_checkbox">
			<%-- <input type="checkbox" name="allArea" id="allArea" class="hidden">--%>
			<label for="allArea"><img src="./img/checkbox.svg" style="padding-right: 10px;">지도에 전체 지역 표시</label>
		</p>
		<div class="tab_common">
			<div class="relative">
				<button id="searchCommercialTown" class="searchCommercialTown">
					뜨는 동네
				</button>
				</div>
			<div class="relative">
				<button id="searchCommercialArea" class="searchCommercialArea">
					뜨는 상권
				</button>
			</div>
		</div>
	</div>
	</div>
	<div class="wrap_box2">
		<div class="village">
			<div class="village2">
				<div class="store"><button><img src="./img/i_store_gr.svg"><br>점포수</button></div>
				<div class="sales"><button><img src="./img/i_sales_gr.svg"><br>매출</button></div>
				<div class="floating"><button><img src="./img/i_floating_gr.svg"><br>유동인구</button></div>
				<div class="living"><button><img src="./img/i_living_gr.svg"><br>주거인구</button></div>
			</div>
		</div>
		<div class="condition">
			<p class="fewCondition"><img src="./img/i_detAnalysis.svg" style="margin-right: 10px; margin-left: 15px;">상세조건<img src="./img/arrow_bottom.svg" style="margin-left: 190px;"></p>
		</div>		
	</div>
	<div class="tabcnt">
		<div style="background-color: #fff; border-radius: 5px;">
			<div class="top">
				<p class="topP"><img src="./img/i_store.svg" style="margin-left: 10px; margin-right: 10px;">순위 TOP 10<img src="./img/arrow_bottom.svg" style="margin-left: 165px;"></p><hr>
			</div>
			<div class="ranking">
				<div class="ranking_datalist">
					<div class="relative2">
						<p class="chose">전체</p>
						<p class="standard">2024년 4분기 기준(전분기)</p>
					</div>
					<div>
						<a class="num">1</a>
						<a class="subject">강동구 둔촌1동</a>
						<a class="value">32개</a>
						<a class="inde">18.55<img class="inde" src="./img/i_increase.svg"></a>
						<hr>
					</div>
					<div>
						<a class="num">2</a>
						<a class="subject">종로구 창신3동</a>
						<a class="value">187개</a>
						<a class="inde">2.2<img class="inde" src="./img/i_increase.svg"></a>
						<hr>
					</div>
				</div>
			</div>
		</div>
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