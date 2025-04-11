<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String id = (String)session.getAttribute("id");
	
	session.removeAttribute("id");
	
	//아이디저장이 체크되었을 때 쿠키에 저장한 아이디 꺼내오기
		Cookie[] cookies = request.getCookies();
		
		String savedId = null;
	    
	    for(int i=0; i<cookies.length; i++) {
	    	if(cookies[i].getValue().contains("id")){
	    		savedId = cookies[i].getValue();
	    	}
	    }
	    
	    String showId = "";
		
	    //savedId가 null이면 로그인 할 때 저장 안헀거나, 로그인 실패, 로그인 안해봤거나
	    //id가 null이면 로그인 성공했거나, 로그인 실패를 안했거나
	    //만약 id가 null이면
	    if(id == null){
	    	//로그인 성공 , 로그인 안함
	    	if(savedId != null){
	    		showId = savedId.replace("id_", "");
	    	}else{
	    		//로그인 안함
	    	}
	    }else{
	    	showId = id;
	    }
%>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="../css/login.css"></link>
<script src="./js/jquery-3.7.1.js"></script>
</head>
<body>
	<div class="container">
	  <form onsubmit="return formCheck()" method="post" action="loginok.jsp">
	  	<div class="back" onclick="location.href='test.jsp'">&larr;</div>
	  	<div class="tab">
	  		<div class="tab dctive" id="personalTab">서울시 상권분석</div>
	  	</div>
	  	<div>
		  	<div class="group">
		  		<input type="text" id="id" name="id" placeholder="아이디를 입력해주세요." value="<%= showId%>">
		  	</div>
		  	<div class="group">
		  		<input type="password" id="pw" name="pw" placeholder="비밀번호를 입력해주세요.">
		  	</div>
		  	<%
		  		if(id != null){
		  	%>
		  		<div id="pw-feedback" class="feedback" style="display:block">아이디 또는 비밀번호가 일치하지 않습니다.</div>
		  	<%
		  		}else{
		  	%>
		  		<div id="pw-feedback" class="feedback">아이디 또는 비밀번호가 일치하지 않습니다.</div>
		  	<%
		  		}
		  	%>
	  	</div>
	  	<div class="actions">
	  		<label for="idSaveCheck">
	  			<input type="checkbox" name="idSaveCheck" id="idSaveCheck" value="off" <%= savedId != null ? "checked" : "" %>>아이디 저장
	  		</label>
	  		<span onclick="location.href='signup.jsp'" style="cursor:pointer;">회원가입</span>
	  	</div>
	  	<button class="btn" type="submit">로그인</button>
	  </form>
	</div>

<script>
	//체크박스의 체크, 해제 할 때 동작하는 이벤트
	$("#idSaveCheck").change(function(e){
		if(e.target.checked == true){
			$("#idSaveCheck").val("on");
		}else{
			$("#idSaveCheck").val("off");
		}
	});
	
function formCheck(){
	//아이디 입력창이 비었는지 확인
		let id = $("#id");
    	if(id.val().trim() == ""){
    		id.focus();
    		id.val("");
    		
    		id.text("아이디를 입력해주세요");
    		return false;
    	}
    	
    	//비밀번호 입력창이 비었는지 확인
    	let pw = $("#pw");
    	if(pw.val().trim() == ""){
    		pw.focus();
    		pw.val("");
    		
    		pw.text("비밀번호를 입력해주세요");
    		return false;
    	}
    	window.localStorage.setItem("id", id.val());
    	return true;
    	
	}



</script>
</body>
</html>
