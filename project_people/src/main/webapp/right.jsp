<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<a id="place">둔촌1동</a>
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
<div class="scroll_y" style="height: 700px;">
	<div class="ScrollBox" style="max-height: none;">
		<div class="container" style="position: relative; top: -4033px; left: 0px;" dir="ltr"></div>
	</div>
	<div class="dragRail"></div>
<div class="explain" id="explain">
		선택면적은 
		<strong id="selectArea">912, 178m2</strong>
		이며 분석된 면적은 
		<strong id="analysiArea">912, 178m2</strong>
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
					<strong>둔촌1동</strong>
					은 자치구에 비해 매출이 감소 추세입니다.
					<strong>업종전체</strong>
					의 평균임대시세 등 고정비용에 대한 관리가 중요합니다.
				</div>
				<div id="summary">
					<strong>둔촌1동</strong>
					은 전년 동분기에 비해 유동인구가
					<strong>증가</strong>
					하고있는 지역입니다. 경쟁 업소출현을 경계하세요.
				</div>
				<div id="summary">
					자치구 내 행정동
					<strong>18개</strong>
					중 둔촌1동의 점포수는
					<strong>18위</strong>
					, 매출액
					<strong>-위</strong>
					, 유동인구
					<strong>18위</strong>
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
						<div class="labelA"><p>18/18위</p></div>
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
						<div class="labelA"><p>-/-위</p></div>
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
						<div class="labelA"><p>18/18위</p></div>
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
						<p class="reportTit02">세탁소<br>(2개)</p>
					</div>
				</div>
				<div class="reportContentCell">
					<h3 class="reportTit02">폐업</h3>
					<div class="reportComment">
						<p class="reportTit02">한국음식점<br>(0개)</p>
					</div>
				</div>
				<div class="reportContentCell">
					<h3 class="reportTit02">영업기간</h3>
					<div class="reportComment">
						<p class="reportTit02">청과상<br>(114개월)</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="scrollbar" style="display: block;">
	<div class="dragContainer">
		<div class="drag_vertical" style="position: absolute; min-height: 30px; display: block; height: 25px; max-height: 690px; top: 141px;">
		<div class="drag_bar" style="line-height: 30px;"></div>
		</div>
	</div>
	<div class="dragRail"></div>
</div>
</div>
