<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ include file="left.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <title>지도 범위 재설정 하기</title>
    <style>
    	.label {margin-bottom: 96px;}
		.label * {display: inline-block;vertical-align: top;}
		body {
		  overflow-x: hidden; 
		  overflow-y: auto;
		  margin: 0px;
}
    </style>
    </head>
<body>
<div id="map" style="width:100%;height:90vh;;" ></div>
<!-- <div style="position:absolute;top:60px;left:20px;width:150px;height:100px;background-color:#fff;box-shadow:0 0 10px #000"><a>나도 곧 사장</a></div>
</div> --> 
<script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=1fdb7ac7e51636cb659c1f91ffa94535"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.544641605, 127.055896738), // 서울의 성수동좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
/* 
//커스텀 오버레이에 표시할 내용입니다     
//HTML 문자열 또는 Dom Element 입니다 
var content = '<div class ="label"><span class="left"></span><span class="center">나도 곧 사장</span><span class="right"></span></div>';

//커스텀 오버레이를 생성합니다
var customOverlay = new kakao.maps.CustomOverlay({
    position: position,
    content: content   
}); */

// 버튼을 클릭하면 아래 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다 
var points = [
    new kakao.maps.LatLng(33.452278, 126.567803),
    new kakao.maps.LatLng(33.452671, 126.574792),
    new kakao.maps.LatLng(33.451744, 126.572441)
];

// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
var bounds = new kakao.maps.LatLngBounds();    

var i, marker;
for (i = 0; i < points.length; i++) {
    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
    marker =     new kakao.maps.Marker({ position : points[i] });
    marker.setMap(map);
    
    // LatLngBounds 객체에 좌표를 추가합니다
    bounds.extend(points[i]);
}

function setBounds() {
    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
    map.setBounds(bounds);
}

/* customOverlay.setMap(map); */
</script>
</body>
</html>