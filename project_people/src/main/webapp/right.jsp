<%@page import="best.bestDAO"%>
<%@page import="ranking.rankingDAO"%>
<%@page import="area.seoulAreaVO"%>
<%@page import="area.seoulAreaDAO"%>
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
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.8/dist/chart.umd.min.js"></script>
<%
String code = request.getParameter("selectSigun");

payReportDAO dao = new payReportDAO();
storeReportDAO storeDao = new storeReportDAO();
payReportDAO payDao = new payReportDAO();
peopleReportDAO peppleDao = new peopleReportDAO();
localReportDAO localDao = new localReportDAO();
seoulAreaDAO areaDao = new seoulAreaDAO();
ObjectMapper mapper = new ObjectMapper();

//자치구 좌표 밀 이름 가져오기
seoulAreaVO areaCode = areaDao.areaCode(code);


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
String storeMeanPayString = mapper.writeValueAsString(storeMeanPayList);

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


//랭킹 꺼내오기
rankingDAO rankDao = new rankingDAO();
shopSalesVO guStroeOne = rankDao.guStoreOne(code);
shopSalesVO guPayOne = rankDao.guPayOne(code);
seoulAllVO guMoveOne = rankDao.guMoveOne(code);


//Best 가져오기
bestDAO bestDao = new bestDAO();
shopSalesVO bestStore = bestDao.bestStore(code);
shopSalesVO bestOpen = bestDao.bestOpen(code);
shopSalesVO bestClose = bestDao.bestClose(code);
shopSalesVO bestFranchise = bestDao.bestFranchise(code);

//서울시 자치구 상점 갯수 가져오기
shopSalesVO allStoreSiGu = storeDao.allStoreSiGu(code);


shopSalesVO listvo = storeList.get(storeList.size() - 1);
%>
<link rel="stylesheet" href="./css/right.css"></link>
<div class="rightB" id="rightAllBox">
	<button class="rightBtn" id="rBtn"><img src="./img/i_reduce.svg"></button>
</div>
<div class="right" id="rightview">
	<div class="report">
		<div class="repor">
			<strong>분석리포트</strong>
			<span class="sub">2024년 4분기</span>
			<button class="Btn" id="closeBtn"><img src="./img/close_w.svg"></button>
		</div>
	</div>
	<div class="tab">
		<div class="tab_report">
			<div>
				<button class="active" id="shortReport">간략보고서</button>
			</div>
			<div>
				<button class="active" id="serviceReport">업종분석</button>
			</div>
			<div>
				<button class="active" id="payReport">매출분석</button>
			</div>
			<div>
				<button class="active" id="peopleReport">인구분석</button>
			</div>
			<div>
				<button class="active" id="LocalReport">지역(배후지)분석</button>
			</div>
		</div>
		<div class="place">
			<div class="pl">
				<span>위치</span>
				<a id="place"><%= areaCode.getGuCodeName() %></a>
			</div>
			<div class="pl">
				<span>업종</span>
				<a id="upjong">업종전체</a>
			</div>
			<div class="pl">
				<span>기준분기</span>
				<a id="bungi">2024년 4분기</a>
			</div>
		</div>
	</div>
	<div class="scroll_y">
		<div class="ScrollBox" style="max-height: none;">
			<div class="container" style="position: relative; top: -4033px; left: 0px;" dir="ltr"></div>
		</div>
		<div class="choiceGu">
				선택자치구 면적은 
				<strong id="selectArea"><%= String.format("%,d", Long.parseLong(areaCode.getGuArea())) %></strong>
				m<sup>2</sup>입니다. 
		</div>
		<div class="explain" id="explain">
			<div class="warning" id="warning">
				<div>
					본 보고서에 제공하는 내용은 
					<strong>추정정보</strong>
					이므로 
					<strong>실제와 다를 수</strong>
					있기에, 
					<strong>사용자의 책임 하에 활용</strong>
					하시기 바랍니다. 
				</div>
				<div class="info_limit">
					<p class="info_limit">책임의 한계 안내</p>
					<hr>
				</div>
				<div class="info_active">
					본 보고서는 서울특별시에서 선택생권분석을 돕기 위해 제공하는 정보입니다.
					<br>
					서울특별시에서 보유하거나 외부기관으로부터 수집되 신뢰할만한 자료 및 정보로부터 얻어진 것이나 통계적으로 추정된 정보를
					이용하여 작성되었기에 리포트 내용에 대한 정확성이나 완전성을 보장할 수 없습니다.
					<br>
					따라서 자신의 판단과 책임하에 보고서를 활용하시기 바랍니다.
					<br>
					또한 서울시는 본 보고서를 활용하여 판단한 결과에 대한 어떠한 법적 책임도 없으며 전적으로
					사용자 자신에게 있음을 알려드립니다.
				</div>
				</div>
			</div>
			<div class="tabWrap">
				<div class="tabWrapLy">
					<h3 class="totalOpi">종합의견</h3>
					<div class="totalReport" id="totalReport">
						<div id="summary">
							<strong>업종전체</strong>
							의 점포수가 전분기대비
							<strong>증가</strong>
							하고 있습니다. 상권이 발달하는 시기인 경우 입지선정에 신중하셔야 합니다.
						</div>
						<div id="summary">
							<strong><%= areaCode.getGuCodeName() %></strong>
							은 전년 동분기에 비해 매출이 
							<strong>감소</strong> 추세입니다.
							업종전체의 평균임대시세 등 고정비용에 대한 관리가 중요합니다.
						</div>
						<div id="summary">
							<strong><%= areaCode.getGuCodeName() %></strong>
							은 전년 동분기에 비해 유동인구가
							<strong>증가</strong>
							하고있는 지역입니다. 경쟁 업소출현을 경계하세요.
						</div>
						<div id="summary">
							서울시 내 자치구
							<strong>25개</strong>
							중 <%= areaCode.getGuCodeName() %>의 점포수는
							<strong><%= guStroeOne.getScore() %>위</strong>
							, 매출액
							<strong><%= guPayOne.getScore() %>위</strong>
							, 유동인구
							<strong><%= guMoveOne.getScore() %>위</strong>
							입니다.
						</div>
					</div>
				</div>
			</div>
			<div class="tabWrapLy">
				<div class="jumpo">
					<div class="relative">점포수</div>
					<div class="chartArea">
						<div class="contrast">
							<div class="">
								<p class="jeon">전분기 대비</p>
								<p class="jeonBun" id="storeHalf">+5개</p>
							</div>
						</div>
						<div class="yearBun">
							<p class="yearBun01">2024년 4분기</p>
							<p class="yearBun02" id="storeNow">32개</p>
						</div>
						<div class="contrast">
							<div>
								<p class="jeon">전년 동분기 대비</p>
								<p class="jeonBun" id="storeYear">+6개</p>
							</div>
						</div>
					</div>
					<div>
						<div class="labelArea">
							<div class="labelA"><p>나의 등수</p></div>
							<div class="labelA"><p><%= guStroeOne.getScore() %>/25위</p></div>
						</div>
					</div>
				</div>
				<div class="jumpo">
					<div class="relative">매출액(점포당 월평균)</div>
					<div class="chartArea">
						<div class="contrast">
							<div class="">
								<p class="jeon">전분기 대비</p>
								<p class="jeonBun" id="storeHalfPay">+21개</p>
							</div>
						</div>
						<div class="yearBun">
							<p class="yearBun01">2024년 4분기</p>
							<p class="yearBun02" id="storeNowPay">364만원</p>
						</div>
						<div class="contrast">
							<div>
								<p class="jeon">전년 동분기 대비</p>
								<p class="jeonBun" id="storeYearPay">+35만원</p>
							</div>
						</div>
					</div>
					<div>
						<div class="labelArea">
							<div class="labelA"><p>나의 등수</p></div>
							<div class="labelA"><p><%= guPayOne.getScore() %>/25위</p></div>
						</div>
					</div>
				</div>
				<div class="jumpo">
					<div class="relative">유동인구(3개월간 인구수)</div>
					<div class="chartArea">
						<div class="contrast">
							<div class="">
								<p class="jeon">전분기 대비</p>
								<p class="jeonBun" id="storehalfMove">+31명</p>
							</div>
						</div>
						<div class="yearBun">
							<p class="yearBun01">2024년 4분기</p>
							<p class="yearBun02" id="storeNowMove">120명/ha</p>
						</div>
						<div class="contrast">
							<div>
								<p class="jeon">전년 동분기 대비</p>
								<p class="jeonBun" id="storeYearMove">+29명</p>
							</div>
						</div>
					</div>
					<div>
						<div class="labelArea">
							<div class="labelA"><p>나의 등수</p></div>
							<div class="labelA"><p><%= guMoveOne.getScore() %>/25위</p></div>
						</div>
					</div>
				</div>				
			</div>
			<div class="tabWrapLy">
				<div class="reportDetail">
					<h2 class="textTit01">예상 매출 1순위 업종</h2>
					<div class="reportContentRow" id="ranking1">
						<div class="reportContentCell">
							<h3 class="reportTit02">외식업</h3>
							<div class="reportComment">
								<p id="CS1Rank1"></p>
							</div>
						</div>
						<div class="reportContentCell">
							<h3 class="reportTit02">서비스업</h3>
							<div class="reportComment">
								<p id="CS2Rank1" class="reportComment"></p>
							</div>
						</div>
						<div class="reportContentCell">
							<h3 class="reportTit02">소매업</h3>
							<div class="reportComment">
								<p id="CS3Rank1" class="reportComment"></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="tabWrapLy">
				<div class="reportDetail">
					<h2 class="textTit01">예상 매출 2순위 업종</h2>
					<div class="reportContentRow" id="ranking2">
						<div class="reportContentCell">
							<h3 class="reportTit02">외식업</h3>
							<div class="reportComment">
								<p id="CS1Rank2"></p>
							</div>
						</div>
						<div class="reportContentCell">
							<h3 class="reportTit02">서비스업</h3>
							<div class="reportComment">
								<p id="CS2Rank2" class="reportComment"></p>
							</div>
						</div>
						<div class="reportContentCell">
							<h3 class="reportTit02">소매업</h3>
							<div class="reportComment">
								<p id="CS3Rank2" class="reportComment"></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="tabWrapLy">
				<div class="reportDetail">
					<h2 class="textTit01">Best 업종</h2>
					<div class="reportContentRow">
						<div class="reportContentCell">
							<h3 class="reportTit02">점포수</h3>
							<div class="reportComment">
								<p><%= bestStore.getServiceCodeName() %><br>(<%=String.format("%,d", Long.parseLong(bestStore.getSimilarStore())) %>개)</p>
							</div>
						</div>
						<div class="reportContentCell">
							<h3 class="reportTit02">개업</h3>
							<div class="reportComment">
								<p class="reportComment"><%= bestOpen.getServiceCodeName() %><br>(<%=bestOpen.getOpenStore() %>개)</p>
							</div>
						</div>
						<div class="reportContentCell">
							<h3 class="reportTit02">폐업</h3>
							<div class="reportComment">
								<p class="reportComment"><%= bestClose.getServiceCodeName() %><br>(<%= bestClose.getCloseStore() %>개)</p>
							</div>
						</div>
						<div class="reportContentCell">
							<h3 class="reportTit02">프랜차이즈 수</h3>
							<div class="reportComment">
								<p class="reportComment"><%= bestFranchise.getServiceCodeName() %><br>(<%= bestFranchise.getFranchiseStore() %>개)</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="tabWrapLy">
				<div class="reportDetail">
					<h2 class="textTit01">Best 매출</h2>
					<div class="reportContentRow">
						<div class="reportContentCell">
							<h3 class="reportTit02">성별/연령대</h3>
							<div class="reportComment">
								<p id="gender_age_pay">여성/20대</p>
							</div>
						</div>
						<div class="reportContentCell">
							<h3 class="reportTit02">요일</h3>
							<div class="reportComment">
								<p class="reportComment" id="week_pay">금용일(30.4%)</p>
							</div>
						</div>
						<div class="reportContentCell">
							<h3 class="reportTit02">시간대</h3>
							<div class="reportComment">
								<p class="reportComment" id="time_pay">14 ~ 17시</p>
							</div>
						</div>
						<div class="reportContentCell">
							<h3 class="reportTit02">최대매출업종</h3>
							<div class="reportComment">
								<p class="reportComment" id="service_pay">소매업</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="tabWrapLy">
				<div class="reportDetail">
					<h2 class="textTit01">Best 유동인구</h2>
					<div class="reportContentRow">
						<div class="reportContentCell">
							<h3 class="reportTit02">성별</h3>
							<div class="reportComment">
								<p id="gender_move">여성</p>
							</div>
						</div>
						<div class="reportContentCell">
							<h3 class="reportTit02">연령대</h3>
							<div class="reportComment">
								<p class="reportComment" id="age_move">60대이상(14.2%)</p>
							</div>
						</div>
						<div class="reportContentCell">
							<h3 class="reportTit02">요일</h3>
							<div class="reportComment">
								<p class="reportComment" id="day_move">화요일(14.56%)</p>
							</div>
						</div>
						<div class="reportContentCell">
							<h3 class="reportTit02">시간대</h3>
							<div class="reportComment">
								<p class="reportComment" id="time_move">06 ~ 11시</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="common">
			<div class="jumpoNo">
				<div class="totalJumpoNo" id="jumpoNum">점포수</div>
				<div>
					<div class="list_reportItem">
						<p class="summary" >점포수는 <a style="color: #e02171;" id="storeCount">32개</a>입니다.</p>
					</div>
					<div class="contRast">
						<p style="font-size: 15px; color: grey">전년 동분기 대비</p>
						<p style="margin: 15px 0px 15px 0px; padding-right: 80px;"><strong id="stor_year" class="increase" aria-label="증가" ><img src="./img/i_increase.svg" style="width: 13px;">6개</strong></p>
						<p style="font-size: 15px; color: grey">전분기 대비</p>
						<p style="margin: 15px 0px 15px 0px;"><strong id="stor_quarter" class="increase" aria-label="증가" ><img src="./img/i_increase.svg" style="width: 13px;">5개</strong></p>
					</div>
					<div class="datail">
						<p><a>업종전체</a>의 점포수가 전분기대비<a>증가</a>하고 있습니다.
						 상권이 발달하는 시기인 경우 입지선정에 신중하셔야 합니다.</p>
					</div>
					<div>
						<div class="chartArea">
							<p class="title">점포수 추이</p>
							<span class="unit" id="storQuSub">단위 : 개</span>
							<canvas id="storeBarChart" style="place-self: center;width: 60vh;height: 35vh;display: block;"></canvas>
						</div>
					</div>
				</div>
				<div class="graph">
					<div class="area_col">
						<div class="chartArea2">
							<p class="title">점포수 현황</p>
							<div id="store2" class="selectDistrict">
								<div class="legend">
									<div class="legendto">
										<p id="siBtn" class="siBtnColor">서울시</p>
										<p id="guBtn" class="guBtnColor"><%= areaCode.getGuCodeName() %></p>
									</div>
								</div>
								<div class="chart">
									<div class="si" id="mega"><%= String.format("%,d", Long.parseLong(allStoreSiGu.getSimilarStore())) %>명</div>
									<div class="gu" id="signgu"><%= String.format("%,d", Long.parseLong(allStoreSiGu.getStore())) %>명</div>
								</div>
							</div>
						</div>
						<div class="chartArea3">
							<p class="title">프랜차이즈와 일반 점포수 비교</p>
							<canvas id="storePieChart" style="place-self: center;width: 60vh;height: 35vh;display: block;"></canvas>
						</div>
					</div>
				</div>
				<div class="sin">
					<p class="gi">평균영업기간</p>
					<div>
						<div class="reportItem">
							<p class="summary">평균영업기간은 <a style="color: #e02171;" id="avgOpen">월</a>입니다.</p>
						</div>
						<div class="contRast2">
							<p>
								<span class="half">전년 동분기 대비</span>
								<strong class="percent" id="yearMeanOpen">0%</strong>
							</p>
							<p>
								<span class="half">전분기 대비</span>
								<strong class="percent" id="halfMeanOpen">100%</strong>
							</p>
						</div>
						<div class="datail">
							<p style="color:black;">준비중 입니다.</p>
						</div>
						<div class="chartArea">
							<p class="title">평균 영업기간 추이</p>
							<span class="unit">단위 : 월</span>
							<canvas id="meanOpenBar" style="place-self: center;width: 60vh;height: 35vh;display: block;"></canvas>						
						</div>
					</div>
				</div>
				<div class="sin">
					<p class="gi">개업현황</p>
					<div>
						<div class="reportItem">
							<p class="summary">개업수는 <a style="color: #e02171;" id="openCount">0개</a>입니다.</p>
						</div>
						<div class="contRast2">
							<p>
								<span class="half">전년 동분기 대비</span>
								<strong class="percent" id="openYear">0%</strong>
							</p>
							<p>
								<span class="half">전분기 대비</span>
								<strong class="percent" id="openQuarter"><img src="./img/i_decrease.svg">100%</strong>
							</p>
						</div>
						<div class="datail">
							<p style="color:black;">준비중 입니다.</p>
						</div>
						<div class="chartArea">
							<p class="title">개업수 추이</p>
							<span class="unit">단위 : 개</span>
							<canvas id="storeOpenBar" style="place-self: center;width: 60vh;height: 35vh;display: block;"></canvas>					
						</div>
					</div>
				</div>
				<div class="sin">
					<p class="gi">폐업현황</p>
					<div>
						<div class="reportItem">
							<p class="summary">폐업수는 <a style="color: #e02171;" id="closeStoreCount">0개</a>입니다.</p>
						</div>
						<div class="contRast2">
							<p>
								<span class="half">전년 동분기 대비</span>
								<strong class="percent" id="yearClose">0%</strong>
							</p>
							<p>
								<span class="half">전분기 대비</span>
								<strong class="percent" id="QuarterClose"><img src="./img/i_decrease.svg">100%</strong>
							</p>
						</div>
						<div class="datail">
							<p style="color:black;">준비중 입니다.</p>
						</div>
						<div class="chartArea">
							<p class="title">폐업수 추이</p>
							<span class="unit">단위 : 개</span>
							<canvas id="storeCloseBar" style="place-self: center;width: 60vh;height: 35vh;display: block;"></canvas>					
						</div>
					</div>
				</div>
				<div class="sin">
					<p class="gi">업종분포 현황</p>
					<div>
						<div class="reportItem">
							<p class="summary"><a style="color: #e02171;" id="service">업종</a>이 가장 많습니다.</p>
						</div>
						<div class="datail">
							<p style="color:black;">준비중 입니다.</p>
						</div>
						<div class="chartArea">
							<p class="title">업종분포</p>
							<span class="unit">단위 : 개 / 2024 4분기 기준</span>
							<canvas id="storeServicePie" style="place-self: center;width: 60vh;height: 35vh;display: block;"></canvas>
						</div>
						<div class="chartArea">
							<p class="title">업종분포 추이</p>
							<span class="unit">단위 : 개</span>
   	 						<canvas id="storeServiceBar" style="place-self: center;width: 60vh;height: 35vh;display: block;"></canvas>					
						</div>
					</div>
				</div>
				<div class="sin">
					<p class="gi">매출액</p>
					<div>
						<div class="reportItem">
							<p class="summary">점포당 월평균 매출액은 <a style="color: #e02171;" id="monthPayCount">99만원</a> 입니다.</p>
						</div>
						<div class="contRast2">
							<p>
								<span class="half">전년 동분기 대비</span>
								<strong class="percent" id="monthPayYear">0%</strong>
							</p>
							<p>
								<span class="half">전분기 대비</span>
								<strong class="percent" id="monthPayQuarter">100%</strong>
							</p>
						</div>
						<div class="datail">
							<p style="color:black;">준비중 입니다.</p>
						</div>
						<div class="chartArea">
							<p class="title">매출액 추이</p>
							<span class="unit">단위 : 만원</span>
							<canvas id="storeMeanPayLine" style="place-self: center;width: 60vh;height: 35vh;display: block;"></canvas>
						</div>
					</div>
				</div>
				<div class="sin">
					<p class="gi">매출건수</p>
					<div>
						<div class="reportItem">
							<p class="summary" id="monthNum">월평균 매출건수는 <a style="color: #e02171;" id="monthNumCount">99건</a> 입니다.</p>
						</div>
						<div class="contRast2">
							<p>
								<span class="half">전년 동분기 대비</span>
								<strong class="percent" id="monthNumYear">0%</strong>
							</p>
							<p>
								<span class="half">전분기 대비</span>
								<strong class="percent" id="monthNumQuarter">100%</strong>
							</p>
						</div>
						<div class="datail">
							<p style="color:black;">준비중 입니다.</p>
						</div>
						<div class="chartArea">
							<p class="title">매출건수 추이</p>
							<span class="unit">단위 : 건</span>
							<canvas id="storeMeanNumLine" style="place-self: center;width: 60vh;height: 35vh;display: block;"></canvas>
						</div>
					</div>
				</div>
				<div class="sin">
					<p class="gi">요일별 매출</p>
					<div>
						<div class="reportItem">
							<p class="summary"><a style="color: #e02171;" id="weekPayCount">요일(00%)</a> 매출이 가장 높아요.</p>
						</div>
						<div class="datail">
							<p style="color:black;">준비중 입니다.</p>
						</div>
						<div class="chartArea">
							<p class="title">요일별 매출 현황</p>
							<span class="unit">단위 : 만원 / 2024 4분기 기준</span>
							<canvas id="weekPayBar" style="place-self: center;width: 60vh;height: 35vh;display: block;"></canvas>
						</div>
					</div>
				</div>
				<div class="sin">
					<p class="gi">시간대별 매출</p>
					<div>
						<div class="reportItem">
							<p class="summary"><a style="color: #e02171;" id="timePayCount">17 ~ 21시</a> 매출이 가장 높아요.</p>
						</div>
						<div class="datail">
							<p style="color:black;">준비중 입니다.</p>
						</div>
						<div class="chartArea">
							<p class="title">시간대별 매출 현황</p>
							<span class="unit">단위 : 만원 / 2024 4분기 기준</span>
							<canvas id="timePayLine" style="place-self: center;width: 60vh;height: 35vh;display: block;"></canvas>
						</div>
					</div>
				</div>
				<div class="sin">
					<p class="gi">성별 매출</p>
					<div>
						<div class="reportItem">
							<p class="summary"><a style="color: #e02171;" id="genderPayCount">O성(00.0%)</a> 매출이 높아요.</p>
						</div>
						<div class="datail">
							<p style="color:black;">준비중 입니다.</p>
						</div>
						<div class="chartArea">
							<p class="title">성별 매출 현황</p>
							<span class="unit">단위 : 만원 / 2024 4분기 기준</span>
							<canvas id="genderPayPie" style="place-self: center;width: 60vh;height: 35vh;display: block;"></canvas>
						</div>
						<div class="multipleChartArea">
							<div class="chartArea3">
								<p class="title">외식업</p>
								<canvas id="CS1GenderPie" style="place-self: center;width: 20vh;height: 35vh;display: block;"></canvas>
							</div>
							<div class="chartArea3">
								<p class="title">서비스업</p>
								<canvas id="CS2GenderPie" style="place-self: center;width: 20vh;height: 35vh;display: block;"></canvas>
							</div>
							<div class="chartArea3">
								<p class="title">소매업</p>
								<canvas id="CS3GenderPie" style="place-self: center;width: 20vh;height: 35vh;display: block;"></canvas>
							</div>
						</div>
					</div>
				</div>
				<div class="sin">
					<p class="gi">연령대별 매출</p>
					<div>
						<div class="reportItem">
							<p class="summary"><a style="color: #e02171;" id="ageServicePayCount">외식업의 O대(00.0%)</a> 매출이 높아요.</p>
						</div>
						<div class="datail">
							<p style="color:black;">준비중 입니다.</p>
						</div>
						<div class="chartArea">
							<p class="title">연령대별 외식업 매출 현황</p>
							<span class="unit">단위 : 만원 / 2024 4분기 기준</span>
							<canvas id="agePayBar" style="place-self: center;width: 20vh;height: 35vh;display: block;"></canvas>
						</div>
						<div class="multipleChartArea">
							<div class="chartArea3">
								<p class="title">연령대별 외식업 매출 현황</p>
									<canvas id="CS1AgePie" style="place-self: center;width: 20vh;height: 35vh;display: block;"></canvas>
							</div>
							<div class="chartArea3">
								<p class="title">연령대별 외식업 매출 현황</p>
									<canvas id="CS2AgePie" style="place-self: center;width: 20vh;height: 35vh;display: block;"></canvas>
							</div>
							<div class="chartArea3">
								<p class="title">연령대별 외식업 매출 현황</p>
									<canvas id="CS3AgePie" style="place-self: center;width: 20vh;height: 35vh;display: block;"></canvas>
							</div>
						</div>
					</div>
				</div>
				<div class="sin">
					<p class="gi">유동인구 수</p>
					<div>
						<div class="reportItem">
							<p class="summary">유동인구 수는 일평균 <a style="color: #e02171;" id="allMoveCount">00,000명</a> 입니다.</p>
						</div>
						<div class="contRast2">
							<p>
								<span class="half">전년 동분기 대비</span>
								<strong class="percent" id="allMoveYear">0%</strong>
							</p>
							<p>
								<span class="half">전분기 대비</span>
								<strong class="percent" id="allMoveQuarter">100%</strong>
							</p>
						</div>
						<div class="datail">
							<p style="color:black;">준비중 입니다.</p>
						</div>
						<div class="chartArea">
							<p class="title">유동인구 추이</p>
							<span class="unit">단위 : 명</span>
							<canvas id="allMoveBar" style="place-self: center;width: 60vh;height: 35vh;display: block;"></canvas>
						</div>
					</div>
				</div>
				<div class="sin">
					<p class="gi">성별, 연령별 유동인구</p>
					<div>
						<div class="reportItem">
							<p class="summary"><a style="color: #e02171;" id="genderAgeMoveCount">O성, 00대 (00%)</a> 유동인구가 가장 많아요.</p>
						</div>
						<div class="datail">
							<p style="color:black;">준비중 입니다.</p>
						</div>
						<div class="chartArea">
							<p class="title">성별, 연령별 유동인구 현황</p>
							<span class="unit">단위 : 명 / 2024 4분기 기준</span>
							<canvas id="genderAgeMoveBar" style="place-self: center;width: 60vh;height: 35vh;display: block;"></canvas>
						</div>
					</div>
				</div>
				<div class="sin">
					<p class="gi">요일별 유동인구</p>
					<div>
						<div class="reportItem">
							<p class="summary" id="weekMove"><a style="color: #e02171;" id="weekMoveCount">O요일</a> 유동인구가 가장 많아요.</p>
						</div>
						<div class="datail">
							<p style="color:black;">준비중 입니다.</p>
						</div>
						<div class="chartArea">
							<p class="title">요일별 유동인구 현황</p>
							<span class="unit">단위 : 명 / 2024 4분기 기준</span>
							<canvas id="dayMoveBar" style="place-self: center;width: 60vh;height: 35vh;display: block;"></canvas>
						</div>
					</div>
				</div>
				<div class="sin">
					<p class="gi">시간대별 유동인구</p>
					<div>
						<div class="reportItem">
							<p class="summary"><a style="color: #e02171;" id="timeMoveCount">00 ~ 00시</a> 유동인구가 가장 많아요.</p>
						</div>
						<div class="datail">
							<p style="color:black;">준비중 입니다.</p>
						</div>
						<div class="chartArea">
							<p class="title">시간대별 유동인구 현황</p>
							<span class="unit">단위 : 명 / 2024 4분기 기준</span>
							<canvas id="timeMoveLine" style="place-self: center;width: 60vh;height: 35vh;display: block;"></canvas>
						</div>
					</div>
				</div>
				<div class="sin">
					<p class="gi">거주인구 수</p>
					<div>
						<div class="reportItem">
							<p class="summary">거주인구는 <a style="color: #e02171;" id="allLiveCount"> 00,000명</a>입니다.</p>
						</div>
						<div class="contRast2">
							<p>
								<span class="half">전년 동분기 대비</span>
								<strong class="percent" id="allLiveYear">0%</strong>
							</p>
							<p>
								<span class="half">전분기 대비</span>
								<strong class="percent" id="allLiveQuarter">100%</strong>
							</p>
						</div>
						<div class="datail">
							<p style="color:black;">준비중 입니다.</p>
						</div>
						<div class="chartArea">
							<p class="title">거주인구 추이</p>
							<span class="unit">단위 : 명</span>
							<canvas id="allLiveBar" style="place-self: center;width: 60vh;height: 35vh;display: block;"></canvas>
						</div>
					</div>
				</div>
				<div class="sin">
					<p class="gi">성별, 연령별 거주인구</p>
					<div>
						<div class="reportItem">
							<p class="summary" id="genderAgeLive"><a style="color: #e02171;" id="genderAgeLiveCount"> 0성, 00대</a> 거주인구가 가장 많아요.</p>
						</div>
						<div class="datail">
							<p style="color:black;">준비중 입니다.</p>
						</div>
						<div class="chartArea">
							<p class="title">성별, 연령별 거주인구 현황</p>
							<span class="unit">단위 : 명 / 2024 4분기 기준</span>
							<canvas id="genderAgeLiveBar" style="place-self: center;width: 60vh;height: 35vh;display: block;"></canvas>
						</div>
					</div>
				</div>
				<div class="sin">
					<p class="gi">직장인구 수</p>
					<div>
						<div class="reportItem">
							<p class="summary">직장인구 수는 <a style="color: #e02171;" id="allCompanyCount"> 00명 </a>입니다.</p>
						</div>
						<div class="contRast2">
							<p>
								<span class="half">전년 동분기 대비</span>
								<strong class="percent" id="allCompanyYear">0%</strong>
							</p>
							<p>
								<span class="half">전분기 대비</span>
								<strong class="percent" id="allCompanyQuarter">100%</strong>
							</p>
						</div>
						<div class="datail">
							<p style="color:black;">준비중 입니다.</p>
						</div>
						<div class="chartArea">
							<p class="title">직장인구 추이</p>
							<span class="unit">단위 : 명</span>
							<canvas id="allCompanyBar" style="place-self: center;width: 60vh;height: 35vh;display: block;"></canvas>
						</div>
					</div>
				</div>
				<div class="sin">
					<p class="gi">성별, 연령별 직장인구</p>
					<div>
						<div class="reportItem">
							<p class="summary"><a style="color: #e02171;" id="genderAgeCompanyCount"> 0성, 00대</a> 직장인구가 가장 많아요.</p>
						</div>
						<div class="datail">
							<p style="color:black;">준비중 입니다.</p>
						</div>
						<div class="chartArea">
							<p class="title">성별, 연령별 직장인구 현황</p>
							<span class="unit">단위 : 명 / 2024 4분기 기준</span>
							<canvas id="genderAgeCompanyBar" style="place-self: center;width: 60vh;height: 35vh;display: block;"></canvas>
						</div>
					</div>
				</div>
				<div class="sin">
					<p class="gi">가구세대 수</p>
					<div>
						<div class="reportItem">
							<p class="summary">가구세대 수 <a style="color: #e02171;" id="allFamilyCount">0,000가구</a> 입니다.</p>
						</div>
						<div class="contRast2">
							<p>
								<span class="half">전년 동분기 대비</span>
								<strong class="percent" id="allFamilyYear">0%</strong>
							</p>
							<p>
								<span class="half">전분기 대비</span>
								<strong class="percent" id="allFamilyQuarter">100%</strong>
							</p>
						</div>
						<div class="datail">
							<p style="color:black;">준비중 입니다.</p>
						</div>
						<div class="chartArea">
							<p class="title">가구세대 수 추이</p>
							<span class="unit">단위 : 가구</span>
							<canvas id="allFamilyLineBar" style="place-self: center;width: 60vh;height: 35vh;display: block;"></canvas>
						</div>
					</div>
				</div>
				<div class="sin">
					<p class="gi">집객시설 수</p>
					<div>
						<div class="reportItem">
							<p class="summary">집객시설 수는 <a style="color: #e02171;" id="localCount"> 00개 </a>입니다.</p>
						</div>
						<div class="contRast2">
							<p>
								<span class="half">전년 동분기 대비</span>
								<strong class="percent" id="localYear">0%</strong>
							</p>
							<p>
								<span class="half">전분기 대비</span>
								<strong class="percent" id="localQuarter">100%</strong>
							</p>
						</div>
						<div class="datail">
							<p style="color:black;">준비중 입니다.</p>
						</div>
						<div class="chartArea">
							<p class="title">집객시설 현황</p>
							<span class="unit">단위 : 개</span>
							<canvas id="allLocalBar" style="place-self: center;width: 60vh;height: 35vh;display: block;"></canvas>
						</div>
					</div>
				</div>
				<div class="sin">
					<p class="gi">주요시설, 집객시설 현황</p>
					<div>
						<div class="reportItem">
							<p class="summary">선택자치구는 <a style="color: #e02171;" id="mainLocalCount"> 0000 </a>이 가장 많아요.</p>
						</div>
						<div class="datail">
							<p style="color:black;">준비중 입니다.</p>
						</div>
						<div class="chartArea">
							<p class="title">주요시설, 집객시설 현황</p>
							<span class="unit">단위 : 명</span>
							<canvas id="mainLocalBar" style="place-self: center;width: 60vh;height: 35vh;display: block;"></canvas>
						</div>
					</div>
				</div>
				<div class="sin">
					<p class="gi">소득수준</p>
					<div>
						<div class="reportItem">
							<p class="summary">소득수준은 <a style="color: #e02171;" id="allIncomeCount"> 00분위</a>입니다.</p>
						</div>
						<div class="contRast2">
							<p>
								<span class="half">전년 동분기 대비</span>
								<strong class="percent" id="allIncomeYear">0%</strong>
							</p>
							<p>
								<span class="half">전분기 대비</span>
								<strong class="percent" id="allIncomeQuarter">100%</strong>
							</p>
						</div>
						<div class="datail">
							<p style="color:black;">준비중 입니다.</p>
						</div>
						<div class="chartArea">
							<p class="title">소득수준 현황</p>
							<span class="unit">단위 : 분위</span>
							<canvas id="allIncomeBar" style="place-self: center;width: 60vh;height: 35vh;display: block;"></canvas>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>

$("#rBtn").click(function(){
	report = $("#rightview").attr('class')
	
	if(report == "right"){
		$("#rightview").attr('class', "rightNone")
		$("#rBtn").attr('class', "rightBtnRight").html('<img src="./img/i_reduce.svg" style="transform: rotateY(180deg);">')
		$("#rightAllBox").attr('class', "rightA")
	}else if(report == "rightNone"){
		$("#rightview").attr('class', "right")
		$("#rBtn").attr('class', "rightBtn").html('<img src="./img/i_reduce.svg">')
		$("#rightAllBox").attr('class', "rightB")
	}else{
		alert("오류발생")
	}
});

$("#closeBtn").click(function(){
	$("#rightview").css('display', "none")
	$("#rBtn").css('display', "none")
});

$("#shortReport").click(function(){
	$(".scroll_y").scrollTop(0);
});

$("#serviceReport").click(function() {
    $('.scroll_y').animate({
        scrollTop: $("#jumpoNum").offset().top
    }, 2000);
});

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


/* 구코드 */
const guCode = "<%= code %>"

</script>
<script>
//종합의견
//점포수
lastYearStore = storeListJson[0]["similarStore"]
lastHalfStore = storeListJson[3]["similarStore"]
nowYearStore = storeListJson[4]["similarStore"]

$("#storeYear").text(Math.abs(parseInt(nowYearStore - lastHalfStore)) + "개 ");
$("#storeNow").text(Number(parseInt(nowYearStore - 0)).toLocaleString() + "개 ");
$("#storeHalf").text(Math.abs(parseInt(nowYearStore - lastHalfStore)) + "개 ");

//종합의견 업종전체 전분기대비 증개 or 감소
if(parseInt(nowYearStore - lastHalfStore) > 0){
	//증가
	$("#stor_quarter").html('<img src="./img/i_increase.svg" style="width: 13px;">'+Math.abs(parseInt(nowYearStore - lastHalfStore))+'개 </strong>').attr('class', 'increaseStore');
	$("#totalReport > div:nth-child(1) > strong:nth-child(2)").attr("class", "increaseStore").text("증가")
	$("#totalReport > div:nth-child(1) > strong:nth-child(1)").attr("class", "increaseStore")
}else if(parseInt(nowYearStore - lastHalfStore) == 0){
	//동일
	$("#stor_quarter").text(Math.abs(parseInt(nowYearStore - lastHalfStore)) + "개 ").attr('class', 'same');
	$("#totalReport > div:nth-child(1) > strong:nth-child(2)").attr("class", "sameStore").text("유지")
	$("#totalReport > div:nth-child(1) > strong:nth-child(1)").attr("class", "sameStore")
}else{
	//감소
	$("#stor_quarter").html('<img src="./img/i_decrease.svg" style="width: 13px;">'+Math.abs(parseInt(nowYearStore - lastHalfStore))+'개 </strong>').attr('class', 'decreaseStore');
	$("#totalReport > div:nth-child(1) > strong:nth-child(2)").attr("class", "decreaseStore").text("감소")
	$("#totalReport > div:nth-child(1) > strong:nth-child(1)").attr("class", "decreaseStore")
}

//점포수 전년대비 증개 or 감소
if(parseInt(nowYearStore -lastYearStore) > 0){
	//증가
	$("#stor_year").html('<img src="./img/i_increase.svg" style="width: 13px;">'+Math.abs(parseInt(nowYearStore -lastYearStore))+'개 </strong>').attr('class', 'increaseStore');
}else if(parseInt(nowYearStore -lastYearStore) == 0){
	//동일
	$("#stor_year").text(Math.abs(parseInt(nowYearStore -lastYearStore)) + "개 ").attr('class', 'sameStore');
}else{
	//감소
	$("#stor_year").html('<img src="./img/i_decrease.svg" style="width: 13px;">'+Math.abs(parseInt(nowYearStore -lastYearStore))+'개 </strong>').attr('class', 'decreaseStore');
}

//점포수 올해 개수
$("#storeCount").text(Number(parseInt(nowYearStore - 0)).toLocaleString() + "개 ");



//영업기간
lastYearAvgStore = meanOpenListJson[0]["openMonthMean"]
lastHalfAvgStore = meanOpenListJson[3]["openMonthMean"]
nowYearAvgStore = meanOpenListJson[4]["openMonthMean"]

avgStoreLastYear = parseInt(nowYearAvgStore - lastYearAvgStore)
avgStorenowYear = parseInt(nowYearAvgStore - 0)
avgStoreLastQuarter = parseInt(nowYearAvgStore - lastHalfAvgStore)

if(avgStoreLastQuarter > 0){
	//증가
	$("#halfMeanOpen").html('<img src="./img/i_increase.svg" style="width: 13px;">'+Math.abs(avgStoreLastQuarter)+'개월 </strong>').attr('class', 'increase');
}else if(openStoreLastQuarter == 0){
	//동일
	$("#halfMeanOpen").text(Math.abs(avgStoreLastQuarter) + "개월 ").attr('class', 'same');
}else{
	//감소
	$("#halfMeanOpen").html('<img src="./img/i_decrease.svg" style="width: 13px;">'+Math.abs(avgStoreLastQuarter)+'개월 </strong>').attr('class', 'decrease');
}

//영업일 전년대비 증개 or 감소
if(avgStoreLastYear > 0){
	//증가
	$("#yearMeanOpen").html('<img src="./img/i_increase.svg" style="width: 13px;">'+Math.abs(avgStoreLastYear)+'개월 </strong>').attr('class', 'increase');
}else if(avgStoreLastYear == 0){
	//동일
	$("#yearMeanOpen").text(Math.abs(avgStoreLastYear) + "개월 ").attr('class', 'same');
}else{
	//감소
	$("#yearMeanOpen").html('<img src="./img/i_decrease.svg" style="width: 13px;">'+Math.abs(avgStoreLastYear)+'개월 </strong>').attr('class', 'decrease');
}

//영업일 올해 개월
$("#avgOpen").text(avgStorenowYear + "개월 ");



//개업 현황
lastYearOpenStore = storeOpenListJson[0]["openStore"]
lastHalfOpenStore = storeOpenListJson[3]["openStore"]
nowYearOpenStore = storeOpenListJson[4]["openStore"]

openStoreLastYear = parseInt(nowYearOpenStore - lastYearOpenStore)
openStorenowYear = parseInt(nowYearOpenStore - 0)
openStoreLastQuarter = parseInt(nowYearOpenStore - lastHalfOpenStore)

if(openStoreLastQuarter > 0){
	//증가
	$("#halfMeanOpen").html('<img src="./img/i_increase.svg" style="width: 13px;">'+Math.abs(openStoreLastQuarter)+'개 </strong>').attr('class', 'increase');
}else if(openStoreLastQuarter == 0){
	//동일
	$("#halfMeanOpen").text(Math.abs(openStoreLastQuarter) + "개 ").attr('class', 'same');
}else{
	//감소
	$("#openQuarter").html('<img src="./img/i_decrease.svg" style="width: 13px;">'+Math.abs(openStoreLastQuarter)+'개 </strong>').attr('class', 'decrease');
}

//개엽수 전년대비 증개 or 감소
if(openStoreLastYear > 0){
	//증가
	$("#openYear").html('<img src="./img/i_increase.svg" style="width: 13px;">'+Math.abs(openStoreLastYear)+'개 </strong>').attr('class', 'increase');
}else if(avgStoreLastYear == 0){
	//동일
	$("#openYear").text(Math.abs(avgStoreLastYear) + "개 ").attr('class', 'same');
}else{
	//감소
	$("#openYear").html('<img src="./img/i_decrease.svg" style="width: 13px;">'+Math.abs(openStoreLastYear)+'개 </strong>').attr('class', 'decrease');
}

//개업수 올해 개수
$("#openCount").text(openStorenowYear + "개 ");



//폐업 현황
lastYearCloseStore = storeCloseListJson[0]["closeStore"]
lastHalfCloseStore = storeCloseListJson[3]["closeStore"]
nowYearCloseStore = storeCloseListJson[4]["closeStore"]

closeStoreLastYear = parseInt(nowYearCloseStore - lastYearCloseStore)
closeStorenowYear = parseInt(nowYearCloseStore - 0)
closeStoreLastQuarter = parseInt(nowYearCloseStore - lastHalfCloseStore)

if(closeStoreLastQuarter > 0){
	//증가
	$("#QuarterClose").html('<img src="./img/i_increase.svg" style="width: 13px;">'+Math.abs(closeStoreLastQuarter)+'개 </strong>').attr('class', 'increase');
}else if(closeStoreLastQuarter == 0){
	//동일
	$("#QuarterClose").text(Math.abs(closeStoreLastQuarter) + "개 ").attr('class', 'same');
}else{
	//감소
	$("#QuarterClose").html('<img src="./img/i_decrease.svg" style="width: 13px;">'+Math.abs(closeStoreLastQuarter)+'개 </strong>').attr('class', 'decrease');
}

//개엽수 전년대비 증개 or 감소
if(closeStoreLastYear > 0){
	//증가
	$("#yearClose").html('<img src="./img/i_increase.svg" style="width: 13px;">'+Math.abs(closeStoreLastYear)+'개 </strong>').attr('class', 'increase');
}else if(closeStoreLastYear == 0){
	//동일
	$("#yearClose").text(Math.abs(closeStoreLastYear) + "개 ").attr('class', 'same');
}else{
	//감소
	$("#yearClose").html('<img src="./img/i_decrease.svg" style="width: 13px;">'+Math.abs(closeStoreLastYear)+'개 </strong>').attr('class', 'decrease');
}

//개업수 올해 개수
$("#closeStoreCount").text(closeStorenowYear + "개 ");



//매출액
lastYearPay = storeMeanPayJson[0]["monthSalesPay"]
lastHalfPay = storeMeanPayJson[3]["monthSalesPay"]
nowYearPay = storeMeanPayJson[4]["monthSalesPay"]

$("#storeNowPay").text(Number(parseInt(nowYearPay / 10000)).toLocaleString() + "만원 ");
$("#storeHalfPay").text(Number(Math.abs(parseInt((nowYearPay - lastHalfPay) / 10000))).toLocaleString() + "만원 ");
$("#storeYearPay").text(Number(Math.abs(parseInt((nowYearPay -lastYearPay ) / 10000))).toLocaleString() + "만원 ");

if(parseInt((nowYearPay - lastHalfPay) / 10000) > 0){
	//증가
	$("#monthPayQuarter").html('<img src="./img/i_increase.svg" style="width: 13px;">'+Number(Math.abs(parseInt((nowYearPay - lastHalfPay) / 10000))).toLocaleString()+'만원 </strong>').attr('class', 'increase');
}else if(parseInt((nowYearPay - lastHalfPay) / 10000) == 0){
	//동일
	$("#monthPayQuarter").text(Math.abs(parseInt((nowYearPay - lastHalfPay) / 10000)) + "만원 ").attr('class', 'same');
}else{
	//감소
	$("#monthPayQuarter").html('<img src="./img/i_decrease.svg" style="width: 13px;">'+Math.abs(parseInt((nowYearPay - lastHalfPay) / 10000))+'만원 </strong>').attr('class', 'decrease');
}

//종합의견 매출액 전년 동분기 증개 or 감소
if(parseInt((nowYearPay -lastYearPay ) / 10000) > 0){
	//증가
	$("#totalReport > div:nth-child(2) > strong:nth-child(2)").attr("class", "increaseStore").text("증가")
	$("#totalReport > div:nth-child(2) > strong:nth-child(1)").attr("class", "increaseStore")
	$("#monthPayYear").html('<img src="./img/i_increase.svg" style="width: 13px;">'+Math.abs(parseInt((nowYearPay -lastYearPay ) / 10000)) +'만원 </strong>').attr('class', 'increase');
}else if(parseInt((nowYearPay -lastYearPay ) / 10000) == 0){
	//동일
	$("#totalReport > div:nth-child(2) > strong:nth-child(2)").attr("class", "sameStore").text("유지")
	$("#totalReport > div:nth-child(2) > strong:nth-child(1)").attr("class", "sameStore")
	$("#monthPayYear").text(Math.abs(parseInt((nowYearPay -lastYearPay ) / 10000)) + "만원 ").attr('class', 'same');
}else{
	//감소
	$("#totalReport > div:nth-child(2) > strong:nth-child(2)").attr("class", "decreaseStore").text("감소")
	$("#totalReport > div:nth-child(2) > strong:nth-child(1)").attr("class", "decreaseStore")
	$("#monthPayYear").html('<img src="./img/i_decrease.svg" style="width: 13px;">'+Math.abs(parseInt((nowYearPay -lastYearPay ) / 10000))+'만원 </strong>').attr('class', 'decrease');
}

$("#monthPayCount").text(Number(parseInt(nowYearPay / 10000)).toLocaleString() + "만원 ");



//월평균 매출건수
lastYearMonthNum = storeMeanNumJson[0]["monthSalesNum"]
lastHalfMonthNum = storeMeanNumJson[3]["monthSalesNum"]
nowYearMonthNum = storeMeanNumJson[4]["monthSalesNum"]

monthNumLastYear = parseInt(nowYearMonthNum - lastYearMonthNum)
monthNumnowYear = parseInt(nowYearMonthNum - 0)
monthNumLastQuarter = parseInt(nowYearMonthNum - lastHalfMonthNum)

if(monthNumLastQuarter > 0){
	//증가
	$("#monthNumQuarter").html('<img src="./img/i_increase.svg" style="width: 13px;">'+Math.abs(monthNumLastQuarter)+'개 </strong>').attr('class', 'increase');
}else if(monthNumLastQuarter == 0){
	//동일
	$("#monthNumQuarter").text(Math.abs(monthNumLastQuarter) + "개 ").attr('class', 'same');
}else{
	//감소
	$("#monthNumQuarter").html('<img src="./img/i_decrease.svg" style="width: 13px;">'+Math.abs(monthNumLastQuarter)+'개 </strong>').attr('class', 'decrease');
}

//월평균 매출건수 전년대비 증개 or 감소
if(monthNumLastYear > 0){
	//증가
	$("#monthNumYear").html('<img src="./img/i_increase.svg" style="width: 13px;">'+Math.abs(monthNumLastYear)+'개 </strong>').attr('class', 'increase');
}else if(monthNumLastYear == 0){
	//동일
	$("#monthNumYear").text(Math.abs(monthNumLastYear) + "개").attr('class', 'same');
}else{
	//감소
	$("#monthNumYear").html('<img src="./img/i_decrease.svg" style="width: 13px;">'+Math.abs(monthNumLastYear)+'개 </strong>').attr('class', 'decrease');
}

//월평균 매출건수 올해 개수
$("#monthNumCount").text(Number(monthNumnowYear).toLocaleString() + "개 ");



//유동인구
lastYearMove = allMoveJson[0]["allMovePeople"]
lasthalfMove = allMoveJson[3]["allMovePeople"]
nowYearMove = allMoveJson[4]["allMovePeople"]

$("#storeNowMove").text(Number(parseInt(nowYearMove - 0)).toLocaleString() + "명");
$("#storehalfMove").text(Number(Math.abs(parseInt(nowYearMove - lasthalfMove))).toLocaleString() + "명 ");
$("#storeYearMove").text(Number(Math.abs(parseInt(nowYearMove -lastYearMove ))).toLocaleString() + "명 ");

//종합의견 유동인구 전년 동분기 증개 or 감소
if(parseInt(nowYearMove -lastYearMove) > 0){
	//증가
	$("#totalReport > div:nth-child(3) > strong:nth-child(2)").attr("class", "increaseStore").text("증가")
	$("#totalReport > div:nth-child(3) > strong:nth-child(1)").attr("class", "increaseStore")
	$("#allMoveYear").html('<img src="./img/i_increase.svg" style="width: 13px;">'+ Number(Math.abs(parseInt(nowYearMove -lastYearMove ))).toLocaleString() +'명 </strong>').attr('class', 'increase');
}else if(parseInt(nowYearMove -lastYearMove) == 0){
	//동일
	$("#totalReport > div:nth-child(3) > strong:nth-child(2)").attr("class", "sameStore").text("유지")
	$("#totalReport > div:nth-child(3) > strong:nth-child(1)").attr("class", "sameStore")
	$("#allMoveYear").text(Number(Math.abs(parseInt(nowYearMove -lastYearMove ))).toLocaleString() + "명 ").attr('class', 'same');
}else{
	//감소
	$("#totalReport > div:nth-child(3) > strong:nth-child(2)").attr("class", "decreaseStore").text("감소")
	$("#totalReport > div:nth-child(3) > strong:nth-child(1)").attr("class", "decreaseStore")
	$("#allMoveYear").html('<img src="./img/i_decrease.svg" style="width: 13px;">'+ Number(Math.abs(parseInt(nowYearMove -lastYearMove ))).toLocaleString() +'명 </strong>').attr('class', 'decrease');
}

if(parseInt(nowYearMove - lasthalfMove) > 0){
	//증가
	$("#allMoveQuarter").html('<img src="./img/i_increase.svg" style="width: 13px;">'+ Number(Math.abs(parseInt(nowYearMove - lasthalfMove))).toLocaleString() +'명 </strong>').attr('class', 'increase');
}else if(parseInt(nowYearMove - lasthalfMove) == 0){
	//동일
	$("#allMoveQuarter").text( Number(Math.abs(parseInt(nowYearMove - lasthalfMove))).toLocaleString()  + "명 ").attr('class', 'same');
}else{
	//감소
	$("#allMoveQuarter").html('<img src="./img/i_decrease.svg" style="width: 13px;">'+ Number(Math.abs(parseInt(nowYearMove - lasthalfMove))).toLocaleString() +'명 </strong>').attr('class', 'decrease');
}


$("#allMoveCount").text(Number(parseInt(nowYearMove - 0)).toLocaleString() + "명 ");



//거주인구
lastYearAllLive = allMoveJson[0]["allMovePeople"]
lastHalfAllLive = allMoveJson[3]["allMovePeople"]
nowYearAllLive = allMoveJson[4]["allMovePeople"]

AllLiveLastYear = parseInt(nowYearAllLive - lastYearAllLive)
AllLivenowYear = parseInt(nowYearAllLive - 0)
AllLiveLastQuarter = parseInt(nowYearAllLive - lastHalfAllLive)

if(AllLiveLastQuarter > 0){
	//증가
	$("#allLiveQuarter").html('<img src="./img/i_increase.svg" style="width: 13px;">'+ Number(Math.abs(AllLiveLastQuarter)).toLocaleString() +'명 </strong>').attr('class', 'increase');
}else if(AllLiveLastQuarter == 0){
	//동일
	$("#allLiveQuarter").text(Number(Math.abs(AllLiveLastQuarter)).toLocaleString() + "명 ").attr('class', 'same');
}else{
	//감소
	$("#allLiveQuarter").html('<img src="./img/i_decrease.svg" style="width: 13px;">'+ Number(Math.abs(AllLiveLastQuarter)).toLocaleString() +'명 </strong>').attr('class', 'decrease');
}

//거주인구 전년대비 증개 or 감소
if(AllLiveLastYear > 0){
	//증가
	$("#allLiveYear").html('<img src="./img/i_increase.svg" style="width: 13px;">'+ Number(Math.abs(AllLiveLastYear)).toLocaleString() +'명 </strong>').attr('class', 'increase');
}else if(AllLiveLastYear == 0){
	//동일
	$("#allLiveYear").text(Number(Math.abs(AllLiveLastYear)).toLocaleString() + "명 ").attr('class', 'same');
}else{
	//감소
	$("#allLiveYear").html('<img src="./img/i_decrease.svg" style="width: 13px;">'+ Number(Math.abs(AllLiveLastYear)).toLocaleString() +'명 </strong>').attr('class', 'decrease');
}

//자치구 올해 거주인구
$("#allLiveCount").text(Number(AllLivenowYear).toLocaleString() + "명 ");



//직장인 수
lastYearAllCompany = allCompanyJson[0]["allCompanyPeople"]
lastHalfAllCompany = allCompanyJson[3]["allCompanyPeople"]
nowYearAllCompany = allCompanyJson[4]["allCompanyPeople"]

AllCompanyLastYear = parseInt(nowYearAllCompany - lastYearAllCompany)
AllCompanynowYear = parseInt(nowYearAllCompany - 0)
AllCompanyLastQuarter = parseInt(nowYearAllCompany - lastHalfAllCompany)

if(AllCompanyLastQuarter > 0){
	//증가
	$("#allCompanyQuarter").html('<img src="./img/i_increase.svg" style="width: 13px;">'+ Number(Math.abs(AllCompanyLastQuarter)).toLocaleString() +'명 </strong>').attr('class', 'increase');
}else if(AllCompanyLastQuarter == 0){
	//동일
	$("#allCompanyQuarter").text(Number(Math.abs(AllCompanyLastQuarter)).toLocaleString() + "명 ").attr('class', 'same');
}else{
	//감소
	$("#allCompanyQuarter").html('<img src="./img/i_decrease.svg" style="width: 13px;">'+ Number(Math.abs(AllCompanyLastQuarter)).toLocaleString() +'명 </strong>').attr('class', 'decrease');
}

//거주인구 전년대비 증개 or 감소
if(AllCompanyLastYear > 0){
	//증가
	$("#allCompanyYear").html('<img src="./img/i_increase.svg" style="width: 13px;">'+ Number(Math.abs(AllCompanyLastYear)).toLocaleString() +'명 </strong>').attr('class', 'increase');
}else if(AllLiveLastYear == 0){
	//동일
	$("#allCompanyYear").text(Number(Math.abs(AllCompanyLastYear)).toLocaleString() + "명 ").attr('class', 'same');
}else{
	//감소
	$("#allCompanyYear").html('<img src="./img/i_decrease.svg" style="width: 13px;">'+ Number(Math.abs(AllCompanyLastYear)).toLocaleString() +'명 </strong>').attr('class', 'decrease');
}

//자치구 올해 직장인 수
$("#allCompanyCount").text(Number(AllCompanynowYear).toLocaleString() + "명 ");



//자치구 올해 가구수
lastYearAllFamily = allFamilyJson[0]["allFamilyPeople"]
lastHalfAllFamily = allFamilyJson[3]["allFamilyPeople"]
nowYearAllFamily = allFamilyJson[4]["allFamilyPeople"]

AllFamilyLastYear = parseInt(nowYearAllFamily - lastYearAllFamily)
AllFamilynowYear = parseInt(nowYearAllFamily - 0)
AllFamilyLastQuarter = parseInt(nowYearAllFamily - lastHalfAllFamily)

if(AllFamilyLastQuarter > 0){
	//증가
	$("#allFamilyQuarter").html('<img src="./img/i_increase.svg" style="width: 13px;">'+ Number(Math.abs(AllFamilyLastQuarter)).toLocaleString() +'가구 </strong>').attr('class', 'increase');
}else if(AllFamilyLastQuarter == 0){
	//동일
	$("#allFamilyQuarter").text(Number(Math.abs(AllFamilyLastQuarter)).toLocaleString() + "가구 ").attr('class', 'same');
}else{
	//감소
	$("#allFamilyQuarter").html('<img src="./img/i_decrease.svg" style="width: 13px;">'+ Number(Math.abs(AllFamilyLastQuarter)).toLocaleString() +'가구 </strong>').attr('class', 'decrease');
}

//거주인구 전년대비 증개 or 감소
if(AllFamilyLastYear > 0){
	//증가
	$("#allFamilyYear").html('<img src="./img/i_increase.svg" style="width: 13px;">'+ Number(Math.abs(AllFamilyLastYear)).toLocaleString() +'가구 </strong>').attr('class', 'increase');
}else if(AllFamilyLastYear == 0){
	//동일
	$("#allFamilyYear").text(Number(Math.abs(AllFamilyLastYear)).toLocaleString() + "가구 ").attr('class', 'same');
}else{
	//감소
	$("#allFamilyYear").html('<img src="./img/i_decrease.svg" style="width: 13px;">'+ Number(Math.abs(AllFamilyLastYear)).toLocaleString() +'가구 </strong>').attr('class', 'decrease');
}

//자치구 올해 직장인 수
$("#allFamilyCount").text(Number(AllFamilynowYear).toLocaleString() + "가구 ");



//자치구 분기별 집객시설
lastYearAllLocal = allLocalJson[0]["hospitalityFacilities"]
lastHalfAllLocal = allLocalJson[3]["hospitalityFacilities"]
nowYearAllLocal = allLocalJson[4]["hospitalityFacilities"]

AllLocalLastYear = parseInt(nowYearAllLocal - lastYearAllLocal)
AllLocalnowYear = parseInt(nowYearAllLocal - 0)
AllLocalLastQuarter = parseInt(nowYearAllLocal - lastHalfAllLocal)

if(AllLocalLastQuarter > 0){
	//증가
	$("#localQuarter").html('<img src="./img/i_increase.svg" style="width: 13px;">'+Math.abs(AllLocalLastQuarter)+'개 </strong>').attr('class', 'increase');
}else if(AllLocalLastQuarter == 0){
	//동일
	$("#localQuarter").text(Math.abs(AllLocalLastQuarter) + "개 ").attr('class', 'same');
}else{
	//감소
	$("#localQuarter").html('<img src="./img/i_decrease.svg" style="width: 13px;">'+Math.abs(AllLocalLastQuarter)+'개 </strong>').attr('class', 'decrease');
}

//집객 시설 수 전년대비 증개 or 감소
if(AllLocalLastYear > 0){
	//증가
	$("#localYear").html('<img src="./img/i_increase.svg" style="width: 13px;">'+Math.abs(AllLocalLastYear)+'개 </strong>').attr('class', 'increase');
}else if(AllLocalLastYear == 0){
	//동일
	$("#localYear").text(Math.abs(AllLocalLastYear) + "개").attr('class', 'same');
}else{
	//감소
	$("#localYear").html('<img src="./img/i_decrease.svg" style="width: 13px;">'+Math.abs(AllLocalLastYear)+'개 </strong>').attr('class', 'decrease');
}

//자치구 집객 시설 수
$("#localCount").text(Number(AllLocalnowYear).toLocaleString() + "개 ");



//자치구 분기별 소득분위
lastYearAllIncome = allIncomeJson[0]["incomeCode"]
lastHalfAllIncome = allIncomeJson[3]["incomeCode"]
nowYearAllIncome = allIncomeJson[4]["incomeCode"]

AllIncomelLastYear = parseInt(nowYearAllIncome - lastYearAllIncome)
AllIncomenowYear = parseInt(nowYearAllIncome - 0)
AllIncomeLastQuarter = parseInt(nowYearAllIncome - lastHalfAllIncome)

if(AllIncomeLastQuarter > 0){
	//증가
	$("#allIncomeQuarter").html('<img src="./img/i_increase.svg" style="width: 13px;">'+Math.abs(AllIncomeLastQuarter)+'분위 </strong>').attr('class', 'increase');
}else if(AllIncomeLastQuarter == 0){
	//동일
	$("#allIncomeQuarter").text(Math.abs(AllIncomeLastQuarter) + "분위 ").attr('class', 'same');
}else{
	//감소
	$("#allIncomeQuarter").html('<img src="./img/i_decrease.svg" style="width: 13px;">'+Math.abs(AllIncomeLastQuarter)+'분위 </strong>').attr('class', 'decrease');
}

//집객 시설 수 전년대비 증개 or 감소
if(AllIncomelLastYear > 0){
	//증가
	$("#allIncomeYear").html('<img src="./img/i_increase.svg" style="width: 13px;">'+Math.abs(AllIncomelLastYear)+'분위 </strong>').attr('class', 'increase');
}else if(AllIncomelLastYear == 0){
	//동일
	$("#allIncomeYear").text(Math.abs(AllIncomelLastYear) + "분위 ").attr('class', 'same');
}else{
	//감소
	$("#allIncomeYear").html('<img src="./img/i_decrease.svg" style="width: 13px;">'+Math.abs(AllIncomelLastYear)+'분위 </strong>').attr('class', 'decrease');
}

//자치구 올해 소득분위
$("#allIncomeCount").text(Number(AllIncomenowYear).toLocaleString() + "분위 ");








//자치구 등수
let jachiScore = 0;

//점포수
if("<%= guStroeOne.getScore() %>" < 25 / 2){
	$("#totalReport > div:nth-child(4) > strong:nth-child(2)").attr("class", "increaseStore")
	jachiScore += 1;
}else{
	$("#totalReport > div:nth-child(4) > strong:nth-child(2)").attr("class", "decreaseStore")
}

//매출액
if("<%= guPayOne.getScore() %>" < 25 / 2){
	$("#totalReport > div:nth-child(4) > strong:nth-child(3)").attr("class", "increaseStore")
	jachiScore += 1;
}else{
	$("#totalReport > div:nth-child(4) > strong:nth-child(3)").attr("class", "decreaseStore")
}

//유동인구
if("<%= guMoveOne.getScore() %>" < 25 / 2){
	$("#totalReport > div:nth-child(4) > strong:nth-child(4)").attr("class", "increaseStore")
	jachiScore += 1;
}else{
	$("#totalReport > div:nth-child(4) > strong:nth-child(4)").attr("class", "decreaseStore")
}

if(jachiScore >= 2){
	$("#totalReport > div:nth-child(4) > strong:nth-child(1)").attr("class", "increaseStore")
}else{
	$("#totalReport > div:nth-child(4) > strong:nth-child(1)").attr("class", "decreaseStore")
}

</script>
<script src="./js/chart.js"></script>
<script src="./js/best.js"></script>
<script>

function strToLocationNumber(data){
	return Number(parseInt(data)).toLocaleString()
}

//레포트 값 꺼내기
//매출
age_pay_value = getAgeBestPay(agePayJson).age
gender_pay_value = getGenderBestPay(genderPayJson).gender
week_pay_value = getWeekBestPay(weekPayJson).week
time_pay_value = getTimeBestPay(timePayJson).time
service_pay_value = getServiceBestPay(serviceGenderPayJson).service

//유동인구
age_move_value = getAgeMove(genderAgeMoveJson).ageMove
gender_move_value = getGenderMove(genderAgeMoveJson).genderMove
week_move_value = getWeekBestMove(dayMoveJson).WeekMove
time_move_value = getTimeBestMove(timeMoveJson).TimeMove

//거주인구
gender_live_value = getGenderLive(genderAgeLiveJson).genderLive
age_live_value = getAgeLive(genderAgeLiveJson).ageLive

//직장인
gender_company_value = getGenderCompany(genderAgeCompanyJson).genderCompany
age_company_value = getAgeCompany(genderAgeCompanyJson).ageCompany

//집객시설
all_local_value = getMainLocal(mainLocalJson).mainLocal

//html에 값 변경
//매출
document.getElementById("gender_age_pay").innerText = gender_pay_value + "/" + age_pay_value
$("#genderPayCount").text(gender_pay_value)
$("#ageServicePayCount").text(age_pay_value)
document.getElementById("week_pay").innerText = week_pay_value
$("#weekPayCount").text(week_pay_value)
document.getElementById("time_pay").innerText = time_pay_value
$("#timePayCount").text(time_pay_value)
document.getElementById("service_pay").innerText = service_pay_value
$("#service").text(service_pay_value)
//유동인구
document.getElementById("age_move").innerText = age_move_value
document.getElementById("gender_move").innerText = gender_move_value
$("#genderAgeMoveCount").text(gender_move_value + ", " + age_move_value)
document.getElementById("day_move").innerText = week_move_value
$("#weekMoveCount").text(week_move_value)
document.getElementById("time_move").innerText = time_move_value
$("#timeMoveCount").text(time_move_value)

$("#genderAgeLiveCount").text(gender_live_value + ", " + age_live_value)

$("#genderAgeCompanyCount").text(gender_company_value + ", " + age_company_value)

$("#mainLocalCount").text(all_local_value)


if(guCode){
	$.ajax({
		url : "http://192.168.0.60:5000/model",
		type : "get",
		data : {
			code : guCode
		},
		success : function(data){
			let expectation = JSON.parse(data).result
		
    		$("#CS1Rank1").html(expectation[0].service_code + "<br>(" + strToLocationNumber(expectation[0].pred_shop_pay / 10000) + "만원)")
			$("#CS1Rank2").html(expectation[1].service_code + "<br>(" + strToLocationNumber(expectation[1].pred_shop_pay / 10000) + "만원)")
			$("#CS2Rank1").html(expectation[2].service_code + "<br>(" + strToLocationNumber(expectation[2].pred_shop_pay / 10000) + "만원)")
			$("#CS2Rank2").html(expectation[3].service_code + "<br>(" + strToLocationNumber(expectation[3].pred_shop_pay / 10000) + "만원)")
			$("#CS3Rank1").html(expectation[4].service_code + "<br>(" + strToLocationNumber(expectation[4].pred_shop_pay / 10000) + "만원)")
			$("#CS3Rank2").html(expectation[5].service_code + "<br>(" + strToLocationNumber(expectation[5].pred_shop_pay / 10000) + "만원)")
			
		},
		error : function(a){
			System.out.println(a);
		}
		
	})	
}

</script>
