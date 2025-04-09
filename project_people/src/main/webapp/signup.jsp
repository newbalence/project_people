<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<link rel="stylesheet" href="./css/signup.css"></link>
<script src="./js/jquery-3.7.1.js"></script>
</head>
<body>
	<div class="container">
		<div class="back" onclick="history.back();">&larr;</div>
		<div class="tabs">
			<div class="tab active" id="personalTab">회원가입</div>
		</div>
		<form action="signupOk.jsp" method="post" onsubmit="return userFormCheck()">
			<div id="personalForm">
				<div class="group">
	                <input type="text" id="id" name="id" placeholder="아이디">
	                <div id="id-feedback" class="feedback">아이디 입력은 필수입니다.</div>
	                
	                <input type="password" id="pw" name="pw" placeholder="비밀번호">
	                <div id="pw-feedback" class="feedback">비밀번호 입력은 필수입니다.</div>
	                
	                <input type="text" id="name" name="name" placeholder="이름">
	                <div id="name-feedback" class="feedback">이름 입력은 필수입니다.</div>
	                
	                <input type="text" id="email" name="email" placeholder="이메일">
	                <div id="email-feedback" class="feedback">이메일 입력은 필수입니다.</div>
	               
	                <input type="text" id="address" name="address" placeholder="주소">
	                <div id="Address-feedback" class="feedback">주소 입력은 필수입니다.</div>
	  				
	  				<input type="text" id="phoneNumber" name="phoneNumber" placeholder="핸드폰번호">
	                <div id="phoneNumber-feedback" class="feedback">핸드폰번호는 입력은 필수입니다.</div>
                </div>
     		    <div class="actions">
		            <span>이미 아이디가 있으신가요? -&gt;</span>
		            <span onclick="location.href='login.jsp'" style="cursor:pointer;">로그인하기</span>
		        </div>
		        <button type="submit" class="btn">회원가입</button>
	        </div>
		</form>
	</div>
<script>
		
		let idCheckFlag = false;
		let idRegex = /^[a-zA-Z0-9]{4,12}$/;
		$("#id").keyup(function(e){
			
			let id = e.target.value;
			let idFeedback = $("#id-feedback");
			idFeedback.css("display", "block").text("아이디는 영어 대소문자와 숫자 4~12자리만 사용 가능합니다.").removeClass("success");
			idCheckFlag = false;
			
			if(!idRegex.test(id)) {
				return;
			}
			
			$.ajax({
				url : "idCheck.jsp",
				type : "post",
				data : {
					id : id
				},
				success : function(result){
					if(result.trim()=="0"){
						idCheckFlag = true;
						idFeedback.css("display", "block").addClass("success").text("사용 가능한 아이디입니다.");
					}else{
						idCheckFlag = false;
						idFeedback.css("display", "block").removeClass("success").text("사용 불가능한 아이디입니다.");
					}
				},
				error : function(){
					console.log("오류발생");
				}
			});
		});
			
		/*  핸드폰번호 정규식만 왜 안되는지 모르겠음!!!!-> 속성값을 찾지 못함?!(reading'target') */
			
	       	let numCheckFlag = false;
	       	let numRegex = /^\d{3}-\d{3,4}-\d{4}$/;
	       	$("#phoneNumber").keyup(function(e){
	       		try {
	       			
					let num = e.target.value;
					let numFeedback = $("#phoneNumber-feedback");
					numFeedback.css("display", "block").text("전화번호는 -를 포함하여 작성하여주세요.").removeClass("success");
					numCheckFlag = false;
					
					if(!numRegex.test(num)) {
						return;
					}
					
					$.ajax({
						url : "phoneNumberCheck.jsp",
						type : "post",
						data : {
							num : num
						},
						success : function(result){
							if(result.trim()=="0"){
								numCheckFlag = true;
								numFeedback.css("display", "block").addClass("success").text("사용 가능한 전화번호입니다.");
							}else{
								numCheckFlag = false;
								numFeedback.css("display", "block").removeClass("success").text("사용 불가능한 전화번호입니다.");
							}
						},
						error : function(){
							console.log("오류발생");
						}
					});

	       		} catch (err) {
					console.log(err)
	       		}
	       		
	       	});  
	      
	       	let emailRegex = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
	       	let emailCheckFlag = false;
	       	$("#email").keyup(function(e){
				let email = e.target.value;
				let emailFeedback = $("#email-feedback");
				emailFeedback.css("display", "block").text("@와 .을 포함한 이메일을 입력해주세요.").removeClass("success");
				emailCheckFlag = false;
				
				if(!emailRegex.test(email)) {
					return false;
				}
				
				$.ajax({
					url : "emailCheck.jsp",
					type : "post",
					data : {
						email : email
					},
					success : function(result){
						if(result.trim()=="0"){
							emailCheckFlag = true;
							emailFeedback.css("display", "block").addClass("success").text("사용 가능한 이메일입니다.");
						}else{
							emailCheckFlag = false;
							emailFeedback.css("display", "block").removeClass("success").text("사용 불가능한 이메일입니다.");
						}
					},
					error : function(){
						console.log("오류발생");
					}
				});
	       	});
	       	
	       	
	 function userFormCheck(){
       	let id = $("#id");
		let idFeedback = $("#id-feedback");
		if(id.val().trim()==""){
			id.focus();
			id.val("");
			idFeedback.css("display", "block").removeClass("success");	
			return false;
		}else {
			idFeedback.css("display", "none");
		}
		
		if(!idRegex.test(id.val())){
			id.focus();
			id.val();
			idFeedback.css("display", "block").text("아이디는 영어 대소문자와 숫자 4~12자리만 사용 가능합니다.").removeClass("success");
			return false;
		}
		
		if(idCheckFlag==false){
			id.focus();
			id.val();
			idFeedback.css("display", "block").text("아이디 중복 확인이 필요합니다.").removeClass("success");
			return false;
		}
		
		idFeedback.css("display", "block").text("아이디 확인이 완료되었습니다.").addClass("success");
		
		let pw = $("#pw");
		let pwFeedback = $("#pw-feedback");
		if(pw.val().trim()==""){
			pw.focus();
			pw.val("");
			pwFeedback.css("display", "block");				
			return false;
		}else {
			pwFeedback.css("display", "none");
		}
		
		let name = $("#name");
		let nameFeedback = $("#name-feedback");
		if(name.val().trim()==""){
			name.focus();
			name.val("");
			nameFeedback.css("display", "block");				
			return false;
		}else {
			nameFeedback.css("display", "none");
		}
		
		let num = $("#phoneNumber");
		let numFeedback = $("#phoneNumber-feedback");
		if(num.val().trim()==""){
			num.focus();
			num.val("");
			numFeedback.css("display", "block");				
			return false;
		}else {
			numFeedback.css("display", "none");
		}
	
		if(!numRegex.test(num.val())){
			num.focus();
			num.val();
			numFeedback.css("display", "block").text("핸드폰번호는 -를 포함하여 작성하여주세요.").removeClass("success");
			return false;
		}
		
		if(numCheckFlag==false){
			num.focus();
			num.val();
			numFeedback.css("display", "block").text("핸드폰번호 중복 확인이 필요합니다.").removeClass("success");
			return false;
		}
	
		let email = $("#email");
		let emailFeedback = $("#email-feedback");
		if(email.val().trim()==""){
			email.focus();
			email.val("");
			emailFeedback.css("display", "block");				
			return false;
		}else {
			emailFeedback.css("display", "none");
		}
		
		if(!emailRegex.test(email.val())){
			email.focus();
			email.val();
			emailFeedback.css("display", "block").text("@와 .을 포함한 이메일을 입력해주세요.").removeClass("success");
			return false;
		}
		
		if(emailCheckFlag==false){
			email.focus();
			email.val();
			emailFeedback.css("display", "block").text("이메일 중복 확인이 필요합니다.").removeClass("success");
			return false;
		}
	 }
</script>
</body>
</html>
