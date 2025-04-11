<%@page import="seoulAll.seoulAllVO"%>
<%@page import="shopSales.shopSalesVO"%>
<%@page import="java.util.List"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="report.localReportDAO"%>
<%@page import="report.peopleReportDAO"%>
<%@page import="report.storeReportDAO"%>
<%@page import="report.payReportDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ include file="top.jsp" %>
<%
	String mainCode = request.getParameter("selectSigun");
	seoulAreaDAO mainAreaDao = new seoulAreaDAO();
	seoulAreaVO mainAreaCode = mainAreaDao.areaCode(mainCode);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>지도 범위 재설정 하기</title>
    <style>
    	.label {margin-bottom: 96px;}
		.label * {display: inline-block;vertical-align: top;}
		body {
			overflow-x: hidden; 
			overflow-y: hidden;
			margin: 0px;
		}
		.rightinclude{
			justify-self: right;
			width: 95vh;
			height: 100%;
			display: flex;
		}
    </style>
    </head>
<body>
<div class="rightinclude">
	<% 
		if(mainCode != null && !mainCode.isEmpty() && !mainCode.equals("")){
			%><%@ include file="right.jsp" %><%
		}
	 %>
</div>
<div id="map" style="width: 179vh; height: 90vh;">
</div>
<script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=1fdb7ac7e51636cb659c1f91ffa94535"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.15.0/proj4.js" integrity="sha512-zlBm5j/0UjgCzqBVLkATd/2b9Yun4SzATXJ7v1T2KfjmP0iw8FUcG5mPD60SrdxU+tRkACm3IQRq55pEkp9Qow==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>

$(async function(){
	//EPSG:5179와 WGS84  좌표계에 대한 정의를 먼저 선언한다.
	proj4.defs('EPSG:5179','+proj=tmerc +lat_0=38 +lon_0=127.5 +k=0.9996 +x_0=1000000 +y_0=2000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs');
	proj4.defs('EPSG:4326', '+proj=longlat +datum=WGS84 +no_defs');

	const gu_code ={
		  "11680": "11230",
		  "11740": "11250",
		  "11305": "11090",
		  "11500": "11160",
		  "11620": "11210",
		  "11215": "11050",
		  "11530": "11170",
		  "11545": "11180",
		  "11350": "11110",
		  "11320": "11100",
		  "11230": "11060",
		  "11590": "11200",
		  "11440": "11140",
		  "11410": "11130",
		  "11650": "11220",
		  "11200": "11040",
		  "11290": "11080",
		  "11710": "11240",
		  "11470": "11150",
		  "11560": "11190",
		  "11170": "11030",
		  "11380": "11120",
		  "11110": "11010",
		  "11140": "11020",
		  "11260": "11070"
	}

	let s_srs = new proj4.Proj("EPSG:5179");
	let t_srs = new proj4.Proj("EPSG:4326");

	function epsg5179To4326(coord){
		let pt = new proj4.Point(coord[0],coord[1]);
		let result =proj4.transform(s_srs,t_srs,pt);
		return result
	}

	let accessToken; // accessToken을 먼저 정의해 주고

	async function getAccessToken(){
		let params = {
		  "consumer_key": "c501e0ecfb7e4bc3830d", // 서비스 ID
		  "consumer_secret": "be5f7937448b4dfd8332" // 보안 Key
		};
		//자바스크립트 객체
		
		const queryString = new URLSearchParams(params).toString();
		//자바스크립트 객체를 url 파라미터에 맞게 수정
		//consumer_key=c501e0ecfb7e4bc3830d&consumer_secret=be5f7937448b4dfd8332
		
		let data = await fetch("https://sgisapi.kostat.go.kr/OpenAPI3/auth/authentication.json?"+queryString)
		data = await data.json()
		return data.result.accessToken
	}

	accessToken = await getAccessToken()	

	let polygon = null;

	function getPolygon(gu){
		polygon?.setMap(null);
		if(gu == null){
			return;
		}
		let params = {
		  "accessToken": accessToken,
		  "year": 2023,
		  "low_search" : 0,
		  "adm_cd" : gu_code[gu]
		};
		//자바스크립트객체
		
		const queryString = new URLSearchParams(params).toString();
		//자바스크립트 객체를 url 파라미터에 맞게 수정
		
		fetch("https://sgisapi.kostat.go.kr/OpenAPI3/boundary/hadmarea.geojson?"+queryString)
			.then(function(response){
				return response.json()
			})
			.then(function(data){
				//위에서 반환한 응답데이터를 가져온다.
				if(data.errCd == 0){
					let bounds = new kakao.maps.LatLngBounds();    
					let polygonPath = []
					coordinates = data.features[0].geometry.coordinates[0]
					for(let i = 0; i < coordinates.length; i ++){
						let result = epsg5179To4326(coordinates[i])
						
						coords = new kakao.maps.LatLng(result.y, result.x);
						polygonPath.push(coords)
						bounds.extend(coords)
					}
					// 지도에 표시할 다각형을 생성합니다
					polygon = new kakao.maps.Polygon({
					    path:polygonPath, // 그려질 다각형의 좌표 배열입니다
					    strokeWeight: 3, // 선의 두께입니다
					    strokeColor: '#af2ada', // 선의 색깔입니다
					    strokeOpacity: 0.8, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
					    strokeStyle: 'line', // 선의 스타일입니다
					    fillColor: '#d655ff', // 채우기 색깔입니다
					    fillOpacity: 0.6 // 채우기 불투명도 입니다
					});

					// 지도에 다각형을 표시합니다
					polygon.setMap(map);
					map.setBounds(bounds);
				}
			})
	}


	let centerX = "<%= mainAreaCode == null ? 126.978601 :  mainAreaCode.getxCode() %>";
	let centerY = "<%= mainAreaCode == null ? 37.566793 :  mainAreaCode.getyCode() %>";

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(centerY, centerX), // 서울의 성수동좌표
	        level: 5 // 지도의 확대 레벨
	    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


	let marker = new kakao.maps.Marker({ position : new kakao.maps.LatLng(centerY, centerX) });
	marker.setMap(map);

	getPolygon(<%= mainCode %>)
})


</script>
</body>

</html>