<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/menu.css"></link>
</head>
<body>
	<div id="toolA" class="rightMenu">
	  <ul>
	  	<li id="liArea" class="districk liCategory" tabindex="0">
	  	  <a href="#">
	  	  	::before
	  	  	"상권영역"
	  	  </a>
	  	  <div class="submenu">
	  	  	<ul style="display: none;">
	  	  		<li id="liArea1">
	  	  			<a href="#">골목상권</a>
	  	  		</li>
	  	  		<li id="liArea2">
	  	  			<a href="#">발달상권</a>
	  	  		</li>
	  	  		<li id="liArea3">
	  	  			<a href="#">전통시장</a>
	  	  		</li>
	  	  		<li id="liArea4">
	  	  			<a href="#">관광특구</a>
	  	  		</li>
	  	  	</ul>
	  	  </div>
	  	</li>
	  	<li id="liHistPop" class="floating history" tabindex="0">
	  		<a href="#">
	  		  ::before
	  		  점포이력</a>
	  		<div class="submenu" style="top: -78px margin: 0px;">
	  			<ul class="active">
	  				<li>
	  					<spnan class="lable_ara">
	  						<label for="storeServiceL"> 업종선택</label>
	  						<select name="storeServiceL" id="storeSerciceL" class="radius blue" onchange="" title="업종선택">
	  							<option value="CS000000">전체</option>
	  							<option value="CS100000">외식업</option>
	  							<option value="CS200000">서비스업</option>
	  							<option value="CS300000">소매업</option>
	  						</select>
	  					</spnan>
	  					<span class="lable_ara">
	  						<label for="storeServiceM">서부업종</label>
	  						<select name="storeServiceM" id="storeServiceM" class="radius blue" onchange="" title="세부 업종 선택">
	  							<option value>전체</option>
	  						</select>
	  					</span>
	  					<span class="lable_ara">
	  						<label for="storeStatus">상태 선택</label>
	  						<select name="storeStatus" id="storeStatus" class="radius blue" onchange="" title="상태 선택">
	  							<option value>전체</option>
	  							<option value="01">영업</option>
	  							<option value="02">개업</option>
	  							<option value="03">폐업</option>
	  						</select>
	  					</span>
	  				</li>
	  				<li>
	  					<div class="box_legend">
	  					  <p class="tal" style="margin:10px">
	  					    <input type="checkbox" name="storeDemsity" id="storeDensity" class="hidden">
	  					    <label for="storeDensity">점포밀도</label>
	  					    <input type="checkbox" name="hideStore" id="hideStore" class="hidden">
	  					    <label for="hideStore" style="margin-left: 40px;">점포숨기기</label>
	  					  </p>
	  					  <div class="bar">
	  					  	<span>
	  					  	  "적음 "
	  					  	  <span id="storMicost" style="width: auto;">0개</span>  
	  					  	</span>
	  					  	<span>
	  					  	  "많음 "
	  					  	  <span id="storMxcost" style="width: auto;">0개</span>
	  					  	</span>
	  					  </div>
	  					  <div class="bar">
	  					    <ul>
	  					      <li style="background-color: #4641D8;"></li>
	  					      <li style="background-color: #47C83E;"></li>
	  					      <li style="background-color: #FAED7D;"></li>
	  					      <li style="background-color: #F29661;"></li>
	  					      <li style="background-color: #FF0000;"></li>
	  					    </ul>
	  					  </div>
	  					  <div class="standard">
	  					    "일 평균 / "
	  					  	<span id="lgymcdHist">2024.12</span>  
	  					  </div>
	  					</div>
	  				</li>
	  			</ul>
	  			<button class="floatingBtn" aria-expanded="true">
	  			  <span class="aria_hidden">점포이력 버튼 닫기</span>
	  			</button>
	  		</div>
	  	</li>
	  	<li id="liFdty" class="aroundInfo liCategory" tabindex="0">
	  	  <a href="#">
	  	    ::before
	  	    "주변정보""
	  	  </a>
	  	  <div class="submenu">
	  	  	<ul style="display: none;">
	  	  		<li id="liFdty1">
	  	  		  <a href="#">관공서</a>
	  	  		  <input type="hidden" id="rdliFdty1" value="101">
	  	  		</li>
	  	  		<li id="liFdty2">
	  	  		  <a href="#">금융</a>
	  	  		  <input type="hidden" id="rdliFdty2" value="102">
	  	  		</li>
	  	  		<li id="liFdty3">
	  	  		  <a href="#">병원</a>
	  	  		  <input type="hidden" id="rdliFdty3" value="103">
	  	  		</li>
	  	  		<li id="liFdty4">
	  	  		  <a href="#">학교</a>
	  	  		  <input type="hidden" id="rdliFdty4" value="104">
	  	  		</li>
	  	  		<li id="liFdty5">
	  	  		  <a href="#">유통점</a>
	  	  		  <input type="hidden" id="rdliFdty5" value="201">
	  	  		</li>
	  	  		<li id="liFdty6">
	  	  		  <a href="#">문화</a>
	  	  		  <input type="hidden" id="rdliFdty6" value="202">
	  	  		</li>
	  	  		<li id="liFdty7">
	  	  		  <a href="#">호텔</a>
	  	  		  <input type="hidden" id="rdliFdty7" value="204">
	  	  		</li>
	  	  		<li id="liFdty8">
	  	  		  <a href="#">지하철</a>
	  	  		  <input type="hidden" id="rdliFdty8" value="205-1">
	  	  		</li>
	  	  		<li id="liFdty9">
	  	  		  <a href="#">버스</a>
	  	  		  <input type="hidden" id="rdliFdty9" value="205-2">
	  	  		</li>
	  	  		<li id="liFdty10">
	  	  		  <a href="#">종교</a>
	  	  		  <input type="hidden" id="rdliFdty10" value="205-3">
	  	  		</li>
	  	  	</ul>
	  	  </div>
	  	</li>
	  	<li id="liPop" class="float road">
	  	  <a href="#">
	  	    ::before
	  	    "유동인구"
	  	    <br>
	  	    "(도로별)"
	  	  </a>
	  	  <div class="submenu" style="top: -42px; margin: 0px;">
	  	  	<div class="tab_div" style="display: none">
	  	  	  <div id="roadUnit" class="tab_pop f-left tab_active" onclick="">길단위(도로별)</div>
	  	  	</div>
	  	  	<ul class="active">
	  	  	  <li>
	  	  	  	<span class="lable_ara">
	  	  	  	  <label for="dayLegend">요일선택</label>
	  	  	  	  <select name="dayLegend" id="dayLegend" class="radius blue" onchange="" title="요일선택">
	  	  	  	    <option value="1">주중</option>
	  	  	  	    <option value="2">주말</option>
	  	  	  	  </select>
	  	  	  	</span>
	  	  	  	<span class="lable_ara">
	  	  	  	  <label for="ageLegend">연령대 선택</label>
	  	  	  	  <select name="ageLegend" id="ageLegend" class="radius blue" onchange="" title="연령대 선택">
	  	  	  	    <option value="00">전체</option>
	  	  	  	    <option value="10">10대</option>
	  	  	  	    <option value="20">20대</option>
	  	  	  	    <option value="30">30대</option>
	  	  	  	    <option value="40">40대</option>
	  	  	  	    <option value="50">50대</option>
	  	  	  	    <option value="60">60대이상</option>
	  	  	  	  </select>
	  	  	  	</span>
	  	  	  	<span class="lable_ara">
	  	  	  	  <label for="timeLegend">시간대 선택</label>
	  	  	  	  <select name="timeLegend" id="timeLegend" class="radius blue" onchange="" title="시간대 선택">
	  	  	  	  	<option value="00">종일</option>
	  	  	  	  	<option value="01">00~05</option>
	  	  	  	  	<option value="02">06~10</option>
	  	  	  	  	<option value="03">11~13</option>
	  	  	  	  	<option value="04">14~16</option>
	  	  	  	  	<option value="05">17~20</option>
	  	  	  	  	<option value="06">21~23</option>
	  	  	  	  </select>
	  	  	  	</span>
	  	  	  </li>
	  	  	  <li>
	  	  	    <div class="box_legend">
	  	  	      <div class="unit">
	  	  	        <spna>
	  	  	          "적음 "
	  	  	          <span id="micos" style="width: auto;">0명</span>
	  	  	        </spna>
	  	  	        <span>
	  	  	          "많음 "
	  	  	          <span id="mxcost" style="width: auto;">0명</span> 
	  	  	        </span>
	  	  	      </div>
	  	  	      <div class="bar">
	  	  	        <ul>
	  	  	          <li style="background-color: #4641D8"></li>
	  	  	          <li style="background-color: #47C83E"></li>
	  	  	          <li style="background-color: #FAED7D"></li>
	  	  	          <li style="background-color: #F29661"></li>
	  	  	          <li style="background-color: #FF0000"></li>
	  	  	        </ul>
	  	  	      </div>
	  	  	      <div class="standard">
	  	  	      	"일 평균 / "
	  	  	      	<span id="lgymcd">2024.12</span>
	  	  	      </div>
	  	  	    </div>
	  	  	  </li>
	  	  	</ul>
	  	  	<button class="floatinBtn" aria-expanded="true">
	  	  		<span class="aria_hidden">유동인구(도로별) 버튼 닫기</span>
	  	  	</button>
	  	  </div>
	  	</li>
	  	<li id="liPopBuild" class="floating building" tabindex="0">
	  		<a href="#">
	  			::before
	  			"유동인구"
	  			<br>
	  			"(건물별)"
	  		</a>
	  		<div class="submenu" style="top: 3px margin: 0px">
	  		  <div class="tab_div" style="display: none">
	  		  <div id="buildUnit" class="tab_pop tab_active" onclick="">건물단위(건물별)</div>
	  		  </div>
	  		  <ul class="active">
	  		    <li>
	  		      <span class="lable_ara">
	  		        <labal for="dayLegend2">요일선택</labal>
	  		        <select name="dayLegend" id="dayLegend2" class="radius bule" onchange="" title="요일 선택">
	  		          <option value="1">주중</option>
	  		          <option value="2">주말</option>
	  		        </select>
	  		      </span>
	  		      <span class="lable_ara">
	  		        <label for="ageLegend2">연령대 선택</label>
	  		        <select name="ageLegend" id="ageLegend2" class="radius biue" onchange="" title="연령대선택">
	  		          <option value="00">전체</option>
	  		          <option value="10">10대</option>
	  		          <option value="20">20대</option>
	  		          <option value="30">30대</option>
	  		          <option value="40">40대</option>
	  		          <option value="50">50대</option>
	  		          <option value="60">60대이상</option>
	  		        </select>
	  		      </span>
	  		      <span class="lable_ara">
	  		        <label for="timeLegend2">시간대 선택</label>
	  		        <select name="timeLegend" id="timeLegend2" class="radius blue" onchange="" title="시간대 선택">
	  		          <option value="00">종일</option>
	  		          <option value="01">00~05</option>
	  		          <option value="02">06~10</option>
	  		          <option value="03">11~13</option>
	  		          <option value="04">14~16</option>
	  		          <option value="05">17~20</option>
	  		          <option value="06">21~23</option>
	  		        </select>
	  		      </span>
	  		    </li>
	  		    <li>
	  		      <div class="box_legend">
	  		        <div class="unit">
	  		          <span>
	  		            "적음 "
	  		            <span id="micount" style="width: auto;">0명</span>
	  		          </span>
	  		          <span>
	  		            "많음 "
	  		            <span id="mxcount" style="width: auto;">0명</span>
	  		          </span>
	  		        </div>
	  		        <div class="bar">
	  		          <ul>
	  		            <li style="background-color: #4641D8"></li>
	  		            <li style="background-color: #47C83E"></li>
	  		            <li style="background-color: #FAED7D"></li>
	  		            <li style="background-color: #F29661"></li>
	  		            <li style="background-color: #FF0000"></li>
	  		          </ul>
	  		        </div>
	  		        <div class="standard">
	  		          "일 평균 / "
	  		          <span id="lgymcd2">2024.12</span>
	  		        </div>
	  		      </div>
	  		    </li>
	  		  </ul>
	  		  <button class="floatingBtn" aria-expanded="true">
	  		    <spanclass="aria_hidden">유동인구(건물별) 버튼 닫기</span>
	  		  </button>
	  		</div>
	  	</li>
	  	<li id="liHeat" class="floating density" tabindex="0">
	  	  <a href="#">
	  	    ::before
	  	    "인구밀도"
	  	  </a>
	  	  <div class="submenu" style="top: 50px; margin: 0px">
	  	    <ul class="active">
	  	      <li style="width: 100px">
	  	        <span class="lable_ara">
	  	          <label for="typeCatgory">인구밀도 선택</label>
	  	          <select style="width: 100px;" name="catgory" id="typeCatgory" class="radius blue" onchange="" title="인구밀도를 선택하세요">
	  	            <option vlaue="1">유동인구</option>
	  	            <option vlaue="2">주거인구</option>
	  	            <option vlaue="3">직장인구</option>
	  	            <option vlaue="4">승하차인구</option>
	  	            </select>
	  	        </span>
	  	      </li>
	  	      <li>
	  	        <div class="box_legend">
	  	          <div class="unit">
	  	            <span>
	  	              "적음 "
	  	              <span id="densityMicount" style="width: auto;">0명</span>
	  	            </span>
	  	            <span>
	  	              "많음 "
	  	              <span id="densityMxcount" style="width: auto;">0명</span>
	  	            </span>
	  	          </div>
	  	          <div class="bar">
	  	            <ul>
	  	              <li style="background-color: #4641D8;"></li>
	  	              <li style="background-color: #47C83E;"></li>
	  	              <li style="background-color: #FAED7D;"></li>
	  	              <li style="background-color: #F29661;"></li>
	  	              <li style="background-color: #FF0000;"></li>
	  	            </ul>
	  	          </div>
	  	          <div class="standard">
	  	            "일 평균 / "
	  	            <span id="lgymcd3">2024.12</span>
	  	          </div>
	  	        </div>
	  	      </li>
	  	    </ul>
	  	    <button class="floatingBtn" aria-expanded="true">
	  	      <span class="ara_hidden">인구밀도 버튼 닫기</span>
	  	    </button>
	  	  </div>
	  	</li>
	  </ul>	
	</div>
</body>
</html>