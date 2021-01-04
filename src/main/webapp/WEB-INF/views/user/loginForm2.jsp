<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/includes/font_header.jsp"%>
<link rel="stylesheet" href="/resources/css/RegisterLogin.css">
<style>
	*{
	font-family: 'Do Hyeon', sans-serif;
	font-size: 30px;
	}
</style>
<title>Uniz로그인페이지</title>
</head>
<body>	

<div class="bg">
    <div class="login-box">
        <form id="form" action="/user/loginForm" method="post" onsubmit="return checkForm();">
        <h1 class="loginHeader">
            <svg xmlns="http://www.w3.org/2000/svg" width="250" height="90" viewBox="0 0 1319 554">
                <defs>
                  <style>
                    .cls-1 {
                      writing-mode: tb;
                      glyph-orientation-vertical: 0;
                      font-size: 729.167px;
                      fill: #00a6f3;
                      font-family: Futura;
                      font-weight: 500px;
                      font-family: 'Do Hyeon',sans-serif;
                    }
                  </style>
                </defs>
                <text id="uniz" class="cls-1" transform="translate(-50.515 268.411) rotate(-90)">Uniz</text>
              </svg>
              <p class="regIntro logIntro">취향저격 유튜브 서비스</p>
        </h1>
        <div class="textBox">
            <i class="fa fa-user"></i>
            <input type="text" id="userId" name="userId" placeholder="아이디"><br>
            
        </div>

        <div class="textBox">
            <i class="fa fa-lock"></i>
            <input type="password" id="password" name="password" placeholder="비밀번호">
        </div>

        <div class="cookieBox">
            <input type="checkbox" id="chk" name="chk">
            <label for="chk" >아이디 기억하기</label>
            
            <label>비밀번호 찾기</label>
        </div>
        <div class="regLink">
        
        </div>
 <div class="socialBox">
          <button class="socialBtn"><i class="fab fa-facebook"></i></button>
          <button class="socialBtn">
          <img width="100%" height="100%" src="https://opcd.kr/wp-content/uploads/2020/10/kakao-300x300.png" class="attachment-medium size-medium" alt="" srcset="https://opcd.kr/wp-content/uploads/2020/10/kakao-300x300.png 300w, https://opcd.kr/wp-content/uploads/2020/10/kakao-1024x1024.png 1024w, https://opcd.kr/wp-content/uploads/2020/10/kakao-150x150.png 150w, https://opcd.kr/wp-content/uploads/2020/10/kakao-768x768.png 768w, https://opcd.kr/wp-content/uploads/2020/10/kakao-1536x1536.png 1536w, https://opcd.kr/wp-content/uploads/2020/10/kakao-2048x2048.png 2048w, https://opcd.kr/wp-content/uploads/2020/10/kakao-700x700.png 700w, https://opcd.kr/wp-content/uploads/2020/10/kakao-200x200.png 200w, https://opcd.kr/wp-content/uploads/2020/10/kakao-500x500.png 500w, https://opcd.kr/wp-content/uploads/2020/10/kakao-1000x1000.png 1000w, https://opcd.kr/wp-content/uploads/2020/10/kakao-600x600.png 600w, https://opcd.kr/wp-content/uploads/2020/10/kakao-100x100.png 100w, https://opcd.kr/wp-content/uploads/2020/10/xkakao.png.pagespeed.ic.FnzSkkjbWf.webp 586w" sizes="(max-width: 300px) 100vw, 300px" data-pagespeed-url-hash="3655081754" onload="pagespeed.CriticalImages.checkImageForCriticality(this);">
          </button>
          <button class="socialBtn"><i class="fab fa-google"></i></button>
        </div>
        <div class="btnBox">
            <button class="logBtn"type="submit">로그인</button>
            <button type="button" class="logBtn regBtn" onclick="location.href='/user/register'">회원가입</button>
        </div>
        
        </form>
       
        <input type="hidden" id="result" value="${result}">
    </div> 
</div>
	
	<%@ include file="/WEB-INF/views/includes/script.jsp"%>
	<script type="text/javascript">
	//테스트용 아이디 비밀번호 고정
	/* 	$("#userId").val("test0003");
		$("#password").val("1234"); */
		let result =$("#result").val();
		
		if(result ==-1){
			alert("회원정보가 일치하지않습니다.");
		}
		
		
		function checkForm(){
			let form = document.getElementById("form");
			
			if(form.userId.value == ""){
				alert("아이디를 입력하세요");
				form.userId.focus();
				return false;
			}
			
			if(form.userId.value.length < 4 || form.userId.value.length > 12){
				alert("아이디는 4~12자 이내로 입력 가능합니다!");
				
				form.userId.select(); 
				return false;
			}
			
			
			 if (form.password.value == "")
	            {
	                 alert("비밀번호를 입력해주세요");
	                 form.password.focus();//포커스를 Password박스로 이동.
	                 return false;
	            }
			 
			 if (form.password.value.length < 4 || form.password.value.length > 12)
	            {
	                 alert("비밀번호는 4~12자 이내로 입력 가능 합니다!");

	                 form.password.select();
	                 return false;
	            }
				
			 
			 for (i=0; i<form.userId.value.length; i++)
	            {
	                   var ch = form.userId.value.charAt(i);//문자를 반환(정수형), 범위 검사 가능

	                   //입력된 문자를 검사

	                   if ( (ch < "a" || ch > "z") && (ch < "A" || ch > "Z") && (ch < "0" || ch > "9" )){
		                    alert("아이디는 영문 소문자로만 입력 가능 합니다!");
		                    form.userId.select();
		                    return false;
	                   }
	                   
	                   return ;
	            }
			return true;
		}
		
	</script>
	</body>
</html>