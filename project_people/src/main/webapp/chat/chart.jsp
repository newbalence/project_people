<%@page import="report.localReportDAO"%>
<%@page import="report.peopleReportDAO"%>
<%@page import="seoulAll.seoulAllVO"%>
<%@page import="report.storeReportDAO"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="report.payReportDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="shopSales.shopSalesVO"%>
<%@page import="best.bestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String code = request.getParameter("selectSigun");
payReportDAO dao = new payReportDAO();
storeReportDAO storeDao = new storeReportDAO();
payReportDAO payDao = new payReportDAO();
peopleReportDAO peppleDao = new peopleReportDAO();
localReportDAO localDao = new localReportDAO();
ObjectMapper mapper = new ObjectMapper();

//분기별 월평균 매출
List<shopSalesVO> storeMeanPaylist = dao.storeMeanPay(code);
String jsonString = mapper.writeValueAsString(storeMeanPaylist);







//총 점포 수
List<shopSalesVO> storeList = storeDao.storeGrape(code);
String storeListString = mapper.writeValueAsString(storeList);

//분기별 평균 영업 기간
List<seoulAllVO> openMeanLise = storeDao.storeMeanOpen(code);
String openMeanListString = mapper.writeValueAsString(openMeanLise);

//분기별 총 개업 가게 수
List<shopSalesVO> storeOpenList = storeDao.storeOpen(code);
String storeOpenString = mapper.writeValueAsString(storeOpenList);

//분기별 총 폐업 가게 수
List<shopSalesVO> storeCloseList = storeDao.storeClose(code);
String storeCloseString = mapper.writeValueAsString(storeCloseList);

//업종으로 묶어서 많은 업종 표시
List<shopSalesVO> storeServiceList = storeDao.storeService(code);
String storeServiceString = mapper.writeValueAsString(storeServiceList);

//업종으로 묶어 분기별 업종 개수 표시
List<shopSalesVO> storeServiceHalfList = storeDao.storeServiceHalf(code);
String storeServiceHalfString = mapper.writeValueAsString(storeServiceHalfList);

//점포당 분기 평균 매출액
List<shopSalesVO> storeMeanPayList = payDao.storeMeanPay(code);
String storeMeanPayString = mapper.writeValueAsString(storeServiceHalfList);

//점포당 분기 평군 매출건수
List<shopSalesVO> storeMeanNumList = payDao.storeMeanNum(code);
String storeMeanNumString = mapper.writeValueAsString(storeMeanNumList);

//요일별 매출 현황
shopSalesVO weekPayList = payDao.weekPay(code);
String weekPayString = mapper.writeValueAsString(weekPayList);

//시간별 분기 매출
shopSalesVO timePayList = dao.timePay(code);
String timePayString = mapper.writeValueAsString(timePayList);

//성별 분기 매출
shopSalesVO genderPayList = dao.genderPay(code);
String genderPayString = mapper.writeValueAsString(genderPayList);

//업종별 성별 매출 현황
List<shopSalesVO> serviceGenderPayList = payDao.serviceGenderPay(code);
String serviceGenderPayString = mapper.writeValueAsString(serviceGenderPayList);

//나이별 매출 현황
shopSalesVO agePayList = dao.agePay(code);
String agePayString = mapper.writeValueAsString(agePayList);

//업종 & 나이별 매출 현황
List<shopSalesVO> serviceAgePayList = payDao.serviceAgePay(code);
String serviceAgePayString = mapper.writeValueAsString(serviceAgePayList);


//인구
//분기별 유동인구 수
List<seoulAllVO> allMoveList = peppleDao.allMove(code);
String allMoveString = mapper.writeValueAsString(allMoveList);

//성별 & 나이별 유동인구 수
seoulAllVO genderAgeMoveList = peppleDao.genderAgeMove(code);
String genderAgeMoveString = mapper.writeValueAsString(genderAgeMoveList);

//요일별 유동인구 수
seoulAllVO dayMoveList = peppleDao.dayMove(code);
String dayMoveString = mapper.writeValueAsString(dayMoveList);

//시간별 유동인구 수
seoulAllVO timeMoveList = peppleDao.timeMove(code);
String timeMoveString = mapper.writeValueAsString(timeMoveList);

//분기별 상주인구 수
List<seoulAllVO> allLiveList = peppleDao.allLive(code);
String allLiveString = mapper.writeValueAsString(allLiveList);

//성별 & 연령별 상주 인구 수
seoulAllVO genderAgeLiveList = peppleDao.genderAgeLive(code);
String genderAgeLiveString = mapper.writeValueAsString(genderAgeLiveList);

//분기별 직장인 수
List<seoulAllVO> allCompanyList = peppleDao.allCompany(code);
String allCompanyString = mapper.writeValueAsString(allCompanyList);

//성별 & 연령별 직장인 수
seoulAllVO genderAgeCompanyList = peppleDao.genderAgeCompany(code);
String genderAgeCompanyString = mapper.writeValueAsString(genderAgeCompanyList);

//분기별 총 가구 수
List<seoulAllVO> allFamilyList = peppleDao.allFamily(code);
String allFamilyString = mapper.writeValueAsString(allFamilyList);

//시설
//분기별 집객 시설 수
List<seoulAllVO> allLocalList = localDao.allLocal(code);
String allLocalString = mapper.writeValueAsString(allLocalList);

//주요 시설 수
seoulAllVO mainLocalList = localDao.mainLocal(code);
String mainLocalString = mapper.writeValueAsString(mainLocalList);

//분기별 자치구 소득 분위
List<seoulAllVO> allIncomeList = localDao.allIncome(code);
String allIncomeString = mapper.writeValueAsString(allIncomeList);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.8/dist/chart.umd.min.js"></script>
<script src="./js/jquery-3.7.1.js"></script>
<style>

</style>
</head>
<body>
	<form action="chart.jsp" method="post" id="selectGu">
		<select id="selectSigun" class="radius" title="서울 구역 선택" name="selectSigun">
			<option value="11680">서울시 전체<img src="./img/arrow_bottom.svg"></option>
			<option value="11680">강남구</option>
			<option value="11740">강동구</option>
			<option value="11305">강북구</option>
			<option value="11500">강서구</option>
			<option value="11620">관악구</option>
			<option value="11215">구로구</option>
			<option value="11545">금천구</option>
			<option value="11350">노원구</option>
			<option value="11320">도봉구</option>
			<option value="11230">동대문구</option>
			<option value="11590">동작구</option>
			<option value="11440">마포구</option>
			<option value="11410">서대문구</option>
			<option value="11650">서초구</option>
			<option value="11200">성동구</option>
			<option value="11290">성북구</option>
			<option value="11710">송파구</option>
			<option value="11470">양천구</option>
			<option value="11560">영등포구</option>
			<option value="11170">용산구</option>
			<option value="11380">은평구</option>
			<option value="11110">종로구</option>
			<option value="11140">중구</option>
			<option value="11260">중랑구</option>
		</select>
	</form>
	<canvas id="storeBarChart" style="width:100%; min-width:300px"></canvas>
    <canvas id="storePieChart" style="width:100%; min-width:300px"></canvas>
    <canvas id="meanOpenBar" style="width:100%; min-width:300px"></canvas>
    <canvas id="storeOpenBar" style="width:100%; min-width:300px"></canvas>
    <canvas id="storeCloseBar" style="width:100%; min-width:300px"></canvas>
    <canvas id="storeServicePie" style="width:100%; min-width:300px"></canvas>
    <canvas id="storeServiceBar" style="width:100%; min-width:300px"></canvas>
    <hr>
    
    <canvas id="storeMeanPayLine" style="width:100%; min-width:300px"></canvas>
    <canvas id="storeMeanNumLine" style="width:100%; min-width:300px"></canvas>
    <canvas id="weekPayBar" style="width:100%; min-width:300px"></canvas>
	<canvas id="timePayLine" style="width:100%; min-width:300px"></canvas>
	<canvas id="genderPayPie" style="width:100%; min-width:300px"></canvas>
	<canvas id="CS1GenderPie" style="width:100%; min-width:300px"></canvas>
	<canvas id="CS2GenderPie" style="width:100%; min-width:300px"></canvas>
	<canvas id="CS3GenderPie" style="width:100%; min-width:300px"></canvas>
	<canvas id="agePayBar" style="width:100%; min-width:300px"></canvas>
	<canvas id="CS1AgePie" style="width:100%; min-width:300px"></canvas>
	<canvas id="CS2AgePie" style="width:100%; min-width:300px"></canvas>
	<canvas id="CS3AgePie" style="width:100%; min-width:300px"></canvas>
	
    <hr>
   	<canvas id="allMoveBar" style="width:100%; min-width:300px"></canvas>
   	<canvas id="genderAgeMoveBar" style="width:100%; min-width:300px"></canvas>
    <canvas id="dayMoveBar" style="width:100%; min-width:300px"></canvas>
    <canvas id="timeMoveLine" style="width:100%; min-width:300px"></canvas>
    <canvas id="allLiveBar" style="width:100%; min-width:300px"></canvas>
    <canvas id="genderAgeLiveBar" style="width:100%; min-width:300px"></canvas>
    <canvas id="allCompanyBar" style="width:100%; min-width:300px"></canvas>
    <canvas id="genderAgeCompanyBar" style="width:100%; min-width:300px"></canvas>
    <canvas id="allFamilyLineBar" style="width:100%; min-width:300px"></canvas>
    
    <hr>
   	<canvas id="allLocalBar" style="width:100%; min-width:300px"></canvas>
   	<canvas id="mainLocalBar" style="width:100%; min-width:300px"></canvas>
   	<canvas id="allIncomeBar" style="width:100%; min-width:300px"></canvas>
</body>
    <script>
    
    /* 점포수 */
    let storeListJson = <%= storeListString %>;
    let meanOpenListJson = <%= openMeanListString %>;
    let storeOpenListJson = <%= storeOpenString %>
    let storeCloseListJson = <%= storeCloseString %>
    let storeServiceListJson = <%= storeServiceString %>
    let storeServiceHalfJson = <%= storeServiceHalfString %>
    
    /* 매출액 */
    let storeMeanPayJson = <%= storeMeanPayString %>
    let storeMeanNumJson = <%= storeMeanNumString %>
    let weekPayJson = <%= weekPayString %>
    let timePayJson = <%= timePayString %>;
    let genderPayJson = <%= genderPayString %>;
    let serviceGenderPayJson = <%= serviceGenderPayString %>
    let agePayJson = <%= agePayString %>
    let serviceAgePayJson = <%= serviceAgePayString %>
    
    /* 인구수 */
    let allMoveJson = <%= allMoveString %>
    let genderAgeMoveJson = <%= genderAgeMoveString %>
    let dayMoveJson = <%= dayMoveString %>
    let timeMoveJson = <%= timeMoveString %>
    let allLiveJson = <%= allLiveString %>
    let genderAgeLiveJson = <%= genderAgeLiveString %>
    let allCompanyJson = <%= allCompanyString %>
    let genderAgeCompanyJson = <%= genderAgeCompanyString %>
    let allFamilyJson = <%= allFamilyString %>
    
    /* 집객 시설 */
    let allLocalJson = <%= allLocalString %>
    let mainLocalJson = <%= mainLocalString %>
    let allIncomeJson = <%= allIncomeString %>
    
    
    </script>
    <script src="./js/chart.js"></script>
    <script>
    $("#selectSigun").change(function(e){
		$("#selectGu").submit();
	})
    </script>
</html>