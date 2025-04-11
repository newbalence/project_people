<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>챗봇</title>
<link rel="stylesheet" href="./css/chat.css"></link>
</head>
<body>
	<div class="chatbot-layer">
		<div class="chat-header">
			<div class="chat-about">
				<img style="width: 30px;" src="./img/shop.svg" alt="서울시 상권분석 서비스">
				<a>서울시 상권분석 서비스</a>
				<button type="button" class="close" onclick="">X</button>
			</div>
			<div class="container">
				<div class="chat-wrap">
					<div class="chat" id="chat-history">
						<ul class="message" id="message">
							<li class="bot">
								<div class="abata"><img src="./img/chat.svg"></div>
								<div class="name">챗봇</div>
								<div class="bubble">
									<div class="b-tail"></div>
									<p class="botP">안녕하세요. 상권분석 도움챗봇 입니다!
									<br>
									<br>
									무엇을 도와드릴까요?
									<br>
									<br>
									</p>
									<ul class="p-info">
										<li class="tag">
											<button type="button" class="ellipsis" onclick="" value="업종분석">업종분석</button>
											<button type="button" class="ellipsis" onclick="" value="매출분석">매출분석</button>
											<button type="button" class="ellipsis" onclick="" value="인구분석">인구분석</button>
											<button type="button" class="ellipsis" onclick="" value="지역분석">지역분석</button>
											<button type="button" class="ellipsis" onclick="" value="상권검색">상권검색</button>
											<button type="button" class="ellipsis" onclick="" value="투자수익률">투자수익률</button>
											<button type="button" class="ellipsis" onclick="" value="손익분기점">손익분기점</button>
											<button type="button" class="ellipsis" onclick="" value="소비트렌드">소비트렌드</button>
											<p></p>
											<div class="time">오전 11:40</div>
										</li>
									</ul>
								</div>
							</li>
						</ul>
					</div>
					<div class="write-form">
						<label for="textarea-b" class="aria_hidden"></label>
						<textarea id="textarea-b" rows="1" placeholder="궁금한 사항을 입력해주세요" title="궁금한 사항을 입력해주세요" autofocus></textarea>
						<span tabindex="0" class="send" id="send">send</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>