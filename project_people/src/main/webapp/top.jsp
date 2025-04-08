<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="./css/top.css"></link>
<%
String codes = request.getParameter("selectSigun");
%>
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
		<form action="test.jsp" method="get" id="selectGu">
			<select id="selectSigun" class="radius" title="서울 구역 선택" name="selectSigun">
				<option value="11680" <%= codes.equals("11680") ? "selected" : "" %>>서울시 전체</option>
				<option value="11680" <%= codes.equals("11680") ? "selected" : "" %>>강남구</option>
				<option value="11740" <%= codes.equals("11740") ? "selected" : "" %>>강동구</option>
				<option value="11305" <%= codes.equals("11305") ? "selected" : "" %>>강북구</option>
				<option value="11500" <%= codes.equals("11500") ? "selected" : "" %>>강서구</option>
				<option value="11620" <%= codes.equals("11620") ? "selected" : "" %>>관악구</option>
				<option value="11215" <%= codes.equals("11215") ? "selected" : "" %>>구로구</option>
				<option value="11545" <%= codes.equals("11545") ? "selected" : "" %>>금천구</option>
				<option value="11350" <%= codes.equals("11350") ? "selected" : "" %>>노원구</option>
				<option value="11320" <%= codes.equals("11320") ? "selected" : "" %>>도봉구</option>
				<option value="11230" <%= codes.equals("11230") ? "selected" : "" %>>동대문구</option>
				<option value="11590" <%= codes.equals("11590") ? "selected" : "" %>>동작구</option>
				<option value="11440" <%= codes.equals("11440") ? "selected" : "" %>>마포구</option>
				<option value="11410" <%= codes.equals("11410") ? "selected" : "" %>>서대문구</option>
				<option value="11650" <%= codes.equals("11650") ? "selected" : "" %>>서초구</option>
				<option value="11200" <%= codes.equals("11200") ? "selected" : "" %>>성동구</option>
				<option value="11290" <%= codes.equals("11290") ? "selected" : "" %>>성북구</option>
				<option value="11710" <%= codes.equals("11710") ? "selected" : "" %>>송파구</option>
				<option value="11470" <%= codes.equals("11470") ? "selected" : "" %>>양천구</option>
				<option value="11560" <%= codes.equals("11560") ? "selected" : "" %>>영등포구</option>
				<option value="11170" <%= codes.equals("11170") ? "selected" : "" %>>용산구</option>
				<option value="11380" <%= codes.equals("11380") ? "selected" : "" %>>은평구</option>
				<option value="11110" <%= codes.equals("11110") ? "selected" : "" %>>종로구</option>
				<option value="11140" <%= codes.equals("11140") ? "selected" : "" %>>중구</option>
				<option value="11260" <%= codes.equals("11260") ? "selected" : "" %>>중랑구</option>
			</select>
		</form>
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
			<div class="top" style="display:flex;">
				<img src="./img/i_store.svg" style="margin-left: 10px; margin-right: 10px;">
				<p class="topP">순위 TOP 10</p>
				<img src="./img/arrow_bottom.svg" style="margin-left: 165px;">
			</div>
			<hr>
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
		    <button><img src="./img/i_currentSpot.svg"></button>
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