<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
</head>
<body>	

<div class="bg">
    <div class="login-box">
        <form id="form" action="/user/loginForm" method="post" onsubmit="return checkForm();">
        <h1 class="loginHeader">
            <svg xmlns="http://www.w3.org/2000/svg" width="119" height="90" viewBox="0 0 1319 554">
                <defs>
                  <style>
                    .cls-1 {
                      writing-mode: tb;
                      glyph-orientation-vertical: 0;
                      font-size: 729.167px;
                      fill: #00a6f3;
                      font-family: Futura;
                      font-weight: 500;
                    }
                  </style>
                </defs>
                <text id="uniz" class="cls-1" transform="translate(-50.515 268.411) rotate(-90)">uniz</text>
              </svg>
              <p class="regIntro">취향저격 유튜브 서비스</p>
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
            <label for="chk">아이디 기억하기</label>
        </div>
        <div class="regLink">
        
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