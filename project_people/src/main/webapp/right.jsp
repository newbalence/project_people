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
<script src="./js/jquery-3.7.1.js"></script>
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


//랭킹 꺼내오기
rankingDAO rankDao = new rankingDAO();
shopSalesVO guStroeOne = rankDao.guStoreOne(code);
shopSalesVO guPayOne = rankDao.guPayOne(code);
seoulAllVO guMoveOne = rankDao.guMoveOne(code);

%>
<link rel="stylesheet" href="./css/right.css"></link>
<div class="rightB">
	<button class="rightBtn"><img src="./img/i_reduce.svg"></button>
</div>
<div class="right">
	<div class="report">
		<div class="repor">
			<strong>분석리포트</strong>
			<span class="sub">2024년 4분기</span>
			<button class="Btn"><img src="./img/close_w.svg"></button>
		</div>
	</div>
	<div class="tab">
		<div class="tab_report">
			<div>
				<button class="active">간략보고서</button>
			</div>
			<div>
				<button class="active">업종분석</button>
			</div>
			<div>
				<button class="active">매출분석</button>
			</div>
			<div>
				<button class="active">인구분석</button>
			</div>
			<div>
				<button class="active">지역(배후지)분석</button>
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
		<div class="dragRail"></div>
		<div class="explain" id="explain">
				선택면적은 
				<strong id="selectArea"><%= areaCode.getGuArea() %></strong>
				입니다. 
			
			<div class="warning" id="warning">
				본 보고서에 제공하는 내용은 
				<strong>추정정보</strong>
				이므로 
				<strong>실제와 다를 수</strong>
				있기에, 
				<strong>사용자의 책임 하에 활용</strong>
				하시기 바랍니다. 
				
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
					<div class="totalReport">
						<div id="summary">
							<strong>업종전체</strong>
							의 점포수가 전분기대비
							<strong>증가</strong>
							하고 있습니다. 상권이 발달하는 시기인 경우 입지선정에 신중하셔야 합니다.
						</div>
						<div id="summary">
							<strong><%= areaCode.getGuCodeName() %></strong>
							은 자치구에 비해 매출이 감소 추세입니다.
							<strong>업종전체</strong>
							의 평균임대시세 등 고정비용에 대한 관리가 중요합니다.
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
								<p class="jeonBun">+5개</p>
							</div>
						</div>
						<div class="yearBun">
							<p class="yearBun01">2024년 4분기</p>
							<p class="yearBun02">32개</p>
						</div>
						<div class="contrast">
							<div>
								<p class="jeon">전년 동분기 대비</p>
								<p class="jeonBun">+6개</p>
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
								<p class="jeonBun">+21개</p>
							</div>
						</div>
						<div class="yearBun">
							<p class="yearBun01">2024년 4분기</p>
							<p class="yearBun02">364만원</p>
						</div>
						<div class="contrast">
							<div>
								<p class="jeon">전년 동분기 대비</p>
								<p class="jeonBun">+35만원</p>
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
								<p class="jeonBun">+31명</p>
							</div>
						</div>
						<div class="yearBun">
							<p class="yearBun01">2024년 4분기</p>
							<p class="yearBun02">120명/ha</p>
						</div>
						<div class="contrast">
							<div>
								<p class="jeon">전년 동분기 대비</p>
								<p class="jeonBun">+29명</p>
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
					<h2 class="textTit01">Best 업종</h2>
					<div class="reportContentRow">
						<div class="reportContentCell">
							<h3 class="reportTit02">점포수</h3>
							<div class="reportComment">
								<p>화초<br>(5개)</p>
							</div>
						</div>
						<div class="reportContentCell">
							<h3 class="reportTit02">개업</h3>
							<div class="reportComment">
								<p class="reportComment">세탁소<br>(2개)</p>
							</div>
						</div>
						<div class="reportContentCell">
							<h3 class="reportTit02">폐업</h3>
							<div class="reportComment">
								<p class="reportComment">한국음식점<br>(0개)</p>
							</div>
						</div>
						<div class="reportContentCell">
							<h3 class="reportTit02">영업기간</h3>
							<div class="reportComment">
								<p class="reportComment">청과상<br>(114개월)</p>
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
								<p>여성/20대</p>
							</div>
						</div>
						<div class="reportContentCell">
							<h3 class="reportTit02">요일</h3>
							<div class="reportComment">
								<p class="reportComment">금용일(30.4%)</p>
							</div>
						</div>
						<div class="reportContentCell">
							<h3 class="reportTit02">시간대</h3>
							<div class="reportComment">
								<p class="reportComment">14 ~ 17시</p>
							</div>
						</div>
						<div class="reportContentCell">
							<h3 class="reportTit02">최대매출업종<br>(동일면적)</h3>
							<div class="reportComment">
								<p class="reportComment">소매업</p>
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
								<p>여성</p>
							</div>
						</div>
						<div class="reportContentCell">
							<h3 class="reportTit02">연령대</h3>
							<div class="reportComment">
								<p class="reportComment">60대이상(14.2%)</p>
							</div>
						</div>
						<div class="reportContentCell">
							<h3 class="reportTit02">요일</h3>
							<div class="reportComment">
								<p class="reportComment">화요일(14.56%)</p>
							</div>
						</div>
						<div class="reportContentCell">
							<h3 class="reportTit02">시간대</h3>
							<div class="reportComment">
								<p class="reportComment">06 ~ 11시</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="common">
			<div class="jumpoNo">
				<div class="totalJumpoNo">점포수</div>
				<div>
					<div class="list_reportItem">
						<p class="summary">점포수는<a style="color: #0676dd;">32개</a>입니다.</p>
					</div>
					<div class="contRast">
						<p style="font-size: 15px; color: grey">전년 동분기 대비</p>
						<p style="margin: 15px 0px 15px 0px; padding-right: 80px;"><strong id="stor" class="increase" aria-label="증가" style="color: #e02171; font-size: 15px ;"><img src="./img/i_increase.svg" style="width: 13px;">6개</strong></p>
						<p style="font-size: 15px; color: grey">전분기 대비</p>
						<p style="margin: 15px 0px 15px 0px;"><strong id="stor" class="increase" aria-label="증가" style="color: #e02171; font-size: 15px ;"><img src="./img/i_increase.svg" style="width: 13px;">5개</strong></p>
					</div>
					<div class="datail">
						<p><a>업종전체</a>의 점포수가 전분기대비<a>증가</a>하고 있습니다.
						 상권이 발달하는 시기인 경우 입지선정에 신중하셔야 합니다.</p>
					</div>
					<div>
						<div class="chartArea">
							<p class="title">점포수 추이</p>
							<span class="unit" id="storQuSub">단위 : 개 / 2024년 4분기 기준</span>
							<canvas id="storeBarChart" style="width:100%; min-width:300px"></canvas>
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
										<p id="siBtn" class="siBtnColor">서울시<img src="./img/chart_si.svg"></p>
									</div>
									<div>
										<p id="guBtn" class="guBtnColor"><img src="./img/chart_gu.svg">강동구</p>
									</div>
									<div>
										<p id="dongBtn" class="dongBtnColor"><img src="./img/chart_dong.svg">둔촌1동</p>
									</div>
								</div>
								<div class="chart">
									<div class="si" id="mega">648848</div>
									<div class="gu" id="signgu">24494</div>
									<div class="dong" id="adstrd">32</div>
								</div>
							</div>
						</div>
						<div class="chartArea3">
							<p class="title">프랜차이즈와 일반 점포수 비교</p>
							<canvas id="storePieChart" style="width:100%; min-width:300px"></canvas>
						</div>
					</div>
				</div>
				<div class="sin">
					<p class="gi">평균영업기간</p>
					<div>
						<div class="reportItem">
							<p class="summary" id="live">평균영업기간은<a style="color: #0676dd;">0%</a>입니다.</p>
						</div>
						<div class="contRast2">
							<p>
								<span class="half">전년 동분기 대비</span>
								<strong class="percent">0%</strong>
							</p>
							<p>
								<span class="half">전분기 대비</span>
								<strong class="percent"><img src="./img/i_decrease.svg">100%</strong>
							</p>
						</div>
						<div class="datail">
							<p style="color:black;">기준일로부터 3년전에 개업한 업소가 없어 3년 생존율을 계산하지 못하는 상권입니다.</p>
						</div>
						<div class="chartArea">
							<p class="title">평균 영업기간 추이</p>
							<span class="unit">단위 : % / 2024 4분기 기준</span>
							<canvas id="meanOpenBar" style="width:100%; min-width:300px"></canvas>						
						</div>
					</div>
				</div>
				<div class="sin">
					<p class="gi">개업현황</p>
					<div>
						<div class="reportItem">
							<p class="summary" id="live">개업수는<a style="color: #0676dd;">0개</a>입니다.</p>
						</div>
						<div class="contRast2">
							<p>
								<span class="half">전년 동분기 대비</span>
								<strong class="percent">0%</strong>
							</p>
							<p>
								<span class="half">전분기 대비</span>
								<strong class="percent"><img src="./img/i_decrease.svg">100%</strong>
							</p>
						</div>
						<div class="datail">
							<p style="color:black;">기준일로부터 3년전에 개업한 업소가 없어 3년 생존율을 계산하지 못하는 상권입니다.</p>
						</div>
						<div class="chartArea">
							<p class="title">개업수 추이</p>
							<span class="unit">단위 : 개 / 2024 4분기 기준</span>
							<canvas id="storeOpenBar" style="width:100%; min-width:300px"></canvas>					
						</div>
					</div>
				</div>
				<div class="sin">
					<p class="gi">폐업현황</p>
					<div>
						<div class="reportItem">
							<p class="summary" id="live">폐업수는<a style="color: #0676dd;">0개</a>입니다.</p>
						</div>
						<div class="contRast2">
							<p>
								<span class="half">전년 동분기 대비</span>
								<strong class="percent">0%</strong>
							</p>
							<p>
								<span class="half">전분기 대비</span>
								<strong class="percent"><img src="./img/i_decrease.svg">100%</strong>
							</p>
						</div>
						<div class="datail">
							<p style="color:black;">기준일로부터 3년전에 개업한 업소가 없어 3년 생존율을 계산하지 못하는 상권입니다.</p>
						</div>
						<div class="chartArea">
							<p class="title">폐업수 추이</p>
							<span class="unit">단위 : 개 / 2024 4분기 기준</span>
							<canvas id="storeCloseBar" style="width:100%; min-width:300px"></canvas>					
						</div>
					</div>
				</div>
				<div class="sin">
					<p class="gi">업종분포 현황</p>
					<div>
						<div class="reportItem">
							<p class="summary" id="live"><a style="color: #0676dd;">업종</a>이 가장 많고 <a style="color: #0676dd;">업종</a> 이 증가 추세입니다.</p>
						</div>
						<div class="contRast2">
							<p>
								<span class="half">전년 동분기 대비</span>
								<strong class="percent">0%</strong>
							</p>
							<p>
								<span class="half">전분기 대비</span>
								<strong class="percent"><img src="./img/i_decrease.svg">100%</strong>
							</p>
						</div>
						<div class="datail">
							<p style="color:black;">기준일로부터 3년전에 개업한 업소가 없어 3년 생존율을 계산하지 못하는 상권입니다.</p>
						</div>
						<div class="chartArea">
							<p class="title">업종분포</p>
							<span class="unit">단위 : %(개) / 2024 4분기 기준</span>
							<canvas id="storeServicePie" style="width:100%; min-width:300px"></canvas>
						</div>
						<div class="chartArea">
							<p class="title">업종분포 추이</p>
							<span class="unit">단위 : % / 2024 4분기 기준</span>
   	 						<canvas id="storeServiceBar" style="width:100%; min-width:300px"></canvas>					
						</div>
					</div>
				</div>
				<div class="sin">
					<p class="gi">매출액</p>
					<div>
						<div class="reportItem">
							<p class="summary" id="live">점포당 월평균 매출액은 <a style="color: #0676dd;">99만원</a> 입니다.</p>
						</div>
						<div class="contRast2">
							<p>
								<span class="half">전년 동분기 대비</span>
								<strong class="percent">0%</strong>
							</p>
							<p>
								<span class="half">전분기 대비</span>
								<strong class="percent"><img src="./img/i_decrease.svg">100%</strong>
							</p>
						</div>
						<div class="datail">
							<p style="color:black;">기준일로부터 3년전에 개업한 업소가 없어 3년 생존율을 계산하지 못하는 상권입니다.</p>
						</div>
						<div class="chartArea">
							<p class="title">매출액 추이</p>
							<span class="unit">단위 : 원 / 2024 4분기 기준</span>
							<canvas id="storeMeanPayLine" style="width:100%; min-width:300px"></canvas>
						</div>
					</div>
				</div>
				<div class="sin">
					<p class="gi">매출건수</p>
					<div>
						<div class="reportItem">
							<p class="summary" id="live">월평균 매출액은 <a style="color: #0676dd;">99건</a> 입니다.</p>
						</div>
						<div class="contRast2">
							<p>
								<span class="half">전년 동분기 대비</span>
								<strong class="percent">0%</strong>
							</p>
							<p>
								<span class="half">전분기 대비</span>
								<strong class="percent"><img src="./img/i_decrease.svg">100%</strong>
							</p>
						</div>
						<div class="datail">
							<p style="color:black;">기준일로부터 3년전에 개업한 업소가 없어 3년 생존율을 계산하지 못하는 상권입니다.</p>
						</div>
						<div class="chartArea">
							<p class="title">매출건수 추이</p>
							<span class="unit">단위 : 건 / 2024 4분기 기준</span>
							<canvas id="storeMeanNumLine" style="width:100%; min-width:300px"></canvas>
						</div>
					</div>
				</div>
				<div class="sin">
					<p class="gi">요일별 매출</p>
					<div>
						<div class="reportItem">
							<p class="summary" id="live"><a style="color: #0676dd;">요일(00%)</a> 매출이 가장 높아요.</p>
						</div>
						<div class="contRast2">
							<p>
								<span class="half">전년 동분기 대비</span>
								<strong class="percent">0%</strong>
							</p>
							<p>
								<span class="half">전분기 대비</span>
								<strong class="percent"><img src="./img/i_decrease.svg">100%</strong>
							</p>
						</div>
						<div class="datail">
							<p style="color:black;">기준일로부터 3년전에 개업한 업소가 없어 3년 생존율을 계산하지 못하는 상권입니다.</p>
						</div>
						<div class="chartArea">
							<p class="title">요일별 매출 현황</p>
							<span class="unit">단위 : 원 / 2024 4분기 기준</span>
							<canvas id="weekPayBar" style="width:100%; min-width:300px"></canvas>
						</div>
					</div>
				</div>
				<div class="sin">
					<p class="gi">시간대별 매출</p>
					<div>
						<div class="reportItem">
							<p class="summary" id="live"><a style="color: #0676dd;">17 ~ 21시</a> 매출이 가장 높아요.</p>
						</div>
						<div class="contRast2">
							<p>
								<span class="half">전년 동분기 대비</span>
								<strong class="percent">0%</strong>
							</p>
							<p>
								<span class="half">전분기 대비</span>
								<strong class="percent"><img src="./img/i_decrease.svg">100%</strong>
							</p>
						</div>
						<div class="datail">
							<p style="color:black;">기준일로부터 3년전에 개업한 업소가 없어 3년 생존율을 계산하지 못하는 상권입니다.</p>
						</div>
						<div class="chartArea">
							<p class="title">시간대별 매출 현황</p>
							<span class="unit">단위 : 원 / 2024 4분기 기준</span>
							<canvas id="timePayLine" style="width:100%; min-width:300px"></canvas>
						</div>
					</div>
				</div>
				<div class="sin">
					<p class="gi">성별 매출</p>
					<div>
						<div class="reportItem">
							<p class="summary" id="live"><a style="color: #0676dd;">O성(00.0%)</a> 매출이 높아요.</p>
						</div>
						<div class="contRast2">
							<p>
								<span class="half">전년 동분기 대비</span>
								<strong class="percent">0%</strong>
							</p>
							<p>
								<span class="half">전분기 대비</span>
								<strong class="percent"><img src="./img/i_decrease.svg">100%</strong>
							</p>
						</div>
						<div class="datail">
							<p style="color:black;">기준일로부터 3년전에 개업한 업소가 없어 3년 생존율을 계산하지 못하는 상권입니다.</p>
						</div>
						<div class="chartArea">
							<p class="title">성별 매출 현황</p>
							<span class="unit">단위 : 원 / 2024 4분기 기준</span>
							<canvas id="genderPayPie" style="width:100%; min-width:300px"></canvas>
						</div>
						<div class="multipleChartArea">
							<div class="chartArea3">
								<p class="title">외식업</p>
								<canvas id="CS1GenderPie" style="width:100%; min-width:300px"></canvas>
							</div>
							<div class="chartArea3">
								<p class="title">서비스업</p>
								<canvas id="CS2GenderPie" style="width:100%; min-width:300px"></canvas>
							</div>
							<div class="chartArea3">
								<p class="title">소매업</p>
								<canvas id="CS3GenderPie" style="width:100%; min-width:300px"></canvas>
							</div>
						</div>
					</div>
				</div>
				<div class="sin">
					<p class="gi">연령대별 매출</p>
					<div>
						<div class="reportItem">
							<p class="summary" id="live"><a style="color: #0676dd;">외식업의 O대(00.0%)</a> 매출이 높아요.</p>
						</div>
						<div class="contRast2">
							<p>
								<span class="half">전년 동분기 대비</span>
								<strong class="percent">0%</strong>
							</p>
							<p>
								<span class="half">전분기 대비</span>
								<strong class="percent"><img src="./img/i_decrease.svg">100%</strong>
							</p>
						</div>
						<div class="datail">
							<p style="color:black;">기준일로부터 3년전에 개업한 업소가 없어 3년 생존율을 계산하지 못하는 상권입니다.</p>
						</div>
						<div class="chartArea">
							<p class="title">연령대별 외식업 매출 현황</p>
							<span class="unit">단위 : 원 / 2024 4분기 기준</span>
							<canvas id="agePayBar" style="width:100%; min-width:300px"></canvas>
						</div>
						<div class="multipleChartArea">
							<div class="chartArea3">
								<p class="title">연령대별 외식업 매출 현황</p>
									<canvas id="CS1AgePie" style="width:100%; min-width:300px"></canvas>
							</div>
							<div class="chartArea3">
								<p class="title">연령대별 외식업 매출 현황</p>
									<canvas id="CS2AgePie" style="width:100%; min-width:300px"></canvas>
							</div>
							<div class="chartArea3">
								<p class="title">연령대별 외식업 매출 현황</p>
									<canvas id="CS3AgePie" style="width:100%; min-width:300px"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


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
