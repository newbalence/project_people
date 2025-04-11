<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="seoulAll.seoulAllVO"%>
<%@page import="shopSales.shopSalesVO"%>
<%@page import="java.util.List"%>
<%@page import="ranking.rankingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="./css/top.css"></link>
<%
String codes = request.getParameter("selectSigun");

if(codes == null || codes.isEmpty()){
	codes = "";
}

rankingDAO ranksDao = new rankingDAO();
ObjectMapper mapper2 = new ObjectMapper();

List<shopSalesVO> guStoreTen = ranksDao.guStoreTen();
String guStoreTenString = mapper2.writeValueAsString(guStoreTen);

List<shopSalesVO> guPayTen = ranksDao.guPayTen();
String guPayTenString = mapper2.writeValueAsString(guPayTen);

List<seoulAllVO> guMoveTen = ranksDao.guMoveTen();
String guMoveTenString = mapper2.writeValueAsString(guMoveTen);

List<seoulAllVO> guLiveTen = ranksDao.guLiveTen();
String guLiveTenString = mapper2.writeValueAsString(guLiveTen);

%>
<body>
	<nav id="sideMenu">
	<div class="noneSize">
		<div class="you" id="noneBox">
	    	<h3>뜨는 상권</h3>
		</div>
		<div>
			<button id="toggleBtn" class="bigToggle"><img src="./img/arrow_bottom_blue.svg"></button>
		</div>
	</div>
	<div id="leftView" class="leftDisplay">
		<div class="big_distruct">
		<div class="wrap_box">
			<h3>뜨는 상권</h3>
		<div id="searchSigunList">
			<form action="ProjectMap.jsp" method="get" id="selectGu">
				<select id="selectSigun" class="radius" title="서울 구역 선택" name="selectSigun">
					<option value="" <%= codes.equals("") ? "selected" : "" %>>서울시 전체</option>
					<option value="11680" <%= codes.equals("11680") ? "selected" : "" %>>강남구</option>
					<option value="11740" <%= codes.equals("11740") ? "selected" : "" %>>강동구</option>
					<option value="11305" <%= codes.equals("11305") ? "selected" : "" %>>강북구</option>
					<option value="11500" <%= codes.equals("11500") ? "selected" : "" %>>강서구</option>
					<option value="11620" <%= codes.equals("11620") ? "selected" : "" %>>관악구</option>
					<option value="11215" <%= codes.equals("11215") ? "selected" : "" %>>광진구</option>
					<option value="11530" <%= codes.equals("11530") ? "selected" : "" %>>구로구</option>
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
			<%-- <p class="box_checkbox">
				<input type="checkbox" name="allArea" id="allArea" class="hidden">
				<label for="allArea"><img src="./img/checkbox.svg" style="padding-right: 10px;">지도에 전체 지역 표시</label>
			</p>
			<div class="tab_common">
				<div class="relative">
					<button id="searchCommercialTown" onclick="alert('추후제공예정')" class="searchCommercialTown">
						뜨는 동네
					</button>
					</div>
				<div class="relative">
					<button id="searchCommercialArea" onclick="alert('추후제공예정')" class="searchCommercialArea">
						뜨는 상권
					</button>
				</div>
			</div> --%>
		</div>
		</div>
		<div class="wrap_box2">
			<div class="village">
				<div class="village2">
					<div class="store"><button id="shopRank" class="activation"><img src="./img/i_store_gr.svg"><br>점포수</button></div>
					<div class="sales"><button id="payRank"><img src="./img/i_sales_gr.svg"><br>매출</button></div>
					<div class="floating"><button id="moveRank"><img src="./img/i_floating_gr.svg"><br>유동인구</button></div>
					<div class="living"><button id="liveRank"><img src="./img/i_living_gr.svg"><br>주거인구</button></div>
				</div>
			</div>
			<!-- <div class="condition">
				<p class="fewCondition"><img src="./img/i_detAnalysis.svg" style="margin-right: 10px; margin-left: 15px;">상세조건<img src="./img/arrow_bottom.svg" style="margin-left: 190px;"></p>
			</div>	 -->	
		</div>
		<div class="tabcnt">
			<div id="rankTop10">
				<div class="top" id="rankImg" style="display:flex;">
					<img src="./img/i_store.svg" style="margin-left: 10px; margin-right: 10px;">
					<p class="topP">순위 TOP 10</p>
				</div>
				<hr style="width:99.5%;">
				<div class="ranking">
<!-- 					<div class="ranking_datalist"> -->
						<div class="relative2">
							<p class="chose">전체</p>
							<p class="standard">2024년 4분기 기준 분기평균</p>
						</div>
						<hr style="width:99.5%;">
						<div id="rankBox">
							<%
							for(int i = 0; i < 10; i++){
								shopSalesVO vo = guStoreTen.get(i);
								%>
								<div id="rank" onclick="location.href='ProjectMap.jsp?selectSigun=<%= vo.getGuCode() %>'">
									<a class="num"><%= vo.getScore() %></a>
									<a class="subject"><%= vo.getGuCodeName() %></a>
									<a class="value"><%= String.format("%,d", Long.parseLong(vo.getSimilarStore())) %>개</a>
								</div>
								<hr>
								<%	
							}
							%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</nav>
	<!-- <div class="seoul">
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
	</div> -->

	<!-- <div>
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
	</div> -->
	<script>
	
		function strToLocationNumber(data){
			return Number(parseInt(data)).toLocaleString()
		}
	
		function removeButtonClass(){
			$("#shopRank").removeClass("activation")
			$("#payRank").removeClass("activation")
			$("#moveRank").removeClass("activation")
			$("#liveRank").removeClass("activation")
		}
	
		let guStoreTenJson = <%= guStoreTenString %>
		let guPayTenJson = <%= guPayTenString %>
		let guMoveTenJson = <%= guMoveTenString %>
		let guLiveTenJson = <%= guLiveTenString %>
		
		$("#selectSigun").change(function(e){
			$("#selectGu").submit();
		})
		$("#toggleBtn").click(function(){
			report = $("#leftView").attr('class')
			
			if(report == "leftDisplay"){
				$("#leftView").attr("class", "leftDisplayNone")
				$("#noneBox").attr("class", "bigArea me")
			}else if(report == "leftDisplayNone"){
				$("#leftView").attr("class", "leftDisplay")
				$("#noneBox").attr("class", "you")
			}else{
				alert("오류발생")
			}
		})
		
		
		
		$("#shopRank").click(function(e){
			removeButtonClass()
			$(this).addClass("activation")
			$("#rankBox").empty()
			
			let imgHtml = '';
			imgHtml += '<img src="./img/i_store.svg" style="margin-left: 10px; margin-right: 10px;">'
			imgHtml += '<p class="topP">순위 TOP 10</p>'
			
			$("#rankImg").html(imgHtml);
			for(let i = 0; i < guStoreTenJson.length; i ++){
				let html = '';
				html += '<div id="rank" onclick="location.href=`ProjectMap.jsp?selectSigun='+guStoreTenJson[i].guCode+'`">'
				html += '<a class="num">'+guStoreTenJson[i].score+'</a>'
				html += '<a class="subject">'+guStoreTenJson[i].guCodeName+'</a>'
				html += '<a class="value">'+strToLocationNumber(guStoreTenJson[i].similarStore)+'개</a>'
				html += '</div>'
				html += '<hr>'
				$("#rankBox").append(html)
			}
		})
		
		$("#payRank").click(function(e){
			removeButtonClass()
			$(this).addClass("activation")
			$("#rankBox").empty()
			
			let imgHtml = '';
			imgHtml += '<img src="./img/i_sales_gr.svg" style="margin-left: 10px; margin-right: 10px;">'
			imgHtml += '<p class="topP">순위 TOP 10</p>'
			
			$("#rankImg").html(imgHtml);
			for(let i = 0; i < guPayTenJson.length; i ++){
				let html = '';
				html += '<div id="rank" onclick="location.href=`ProjectMap.jsp?selectSigun='+guPayTenJson[i].guCode+'`">'
				html += '<a class="num">'+guPayTenJson[i].score+'</a>'
				html += '<a class="subject">'+guPayTenJson[i].guCodeName+'</a>'
				html += '<a class="value">'+strToLocationNumber(guPayTenJson[i].monthSalesPay / 10000)+'만원</a>'
				html += '</div>'
				html += '<hr>'
				$("#rankBox").append(html)
			}
		})
		
		$("#moveRank").click(function(e){
			removeButtonClass()
			$(this).addClass("activation")
			$("#rankBox").empty()
			
			let imgHtml = '';
			imgHtml += '<img src="./img/i_floating_gr.svg" style="margin-left: 10px; margin-right: 10px;">'
			imgHtml += '<p class="topP">순위 TOP 10</p>'
			
			$("#rankImg").html(imgHtml);
			for(let i = 0; i < guMoveTenJson.length; i ++){
				let html = '';
				html += '<div id="rank" onclick="location.href=`ProjectMap.jsp?selectSigun='+guMoveTenJson[i].guCode+'`">'
				html += '<a class="num">'+guMoveTenJson[i].score+'</a>'
				html += '<a class="subject">'+guMoveTenJson[i].guCodeName+'</a>'
				html += '<a class="value">'+strToLocationNumber(guMoveTenJson[i].allMovePeople)+'명</a>'
				html += '</div>'
				html += '<hr>'
				$("#rankBox").append(html)
			}
		})
		
		$("#liveRank").click(function(e){
			removeButtonClass()
			$(this).addClass("activation")
			$("#rankBox").empty()
			
			let imgHtml = '';
			imgHtml += '<img src="./img/i_living_gr.svg" style="margin-left: 10px; margin-right: 10px;">'
			imgHtml += '<p class="topP">순위 TOP 10</p>'
			
			$("#rankImg").html(imgHtml);
			for(let i = 0; i < guLiveTenJson.length; i ++){
				let html = '';
				html += '<div id="rank" onclick="location.href=`ProjectMap.jsp?selectSigun='+guLiveTenJson[i].guCode+'`">'
				html += '<a class="num">'+guLiveTenJson[i].score+'</a>'
				html += '<a class="subject">'+guLiveTenJson[i].guCodeName+'</a>'
				html += '<a class="value">'+strToLocationNumber(guLiveTenJson[i].allLivePeople)+'명</a>'
				html += '</div>'
				html += '<hr>'
				$("#rankBox").append(html)
			}
		})
	</script>
</body>