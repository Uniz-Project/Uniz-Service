<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Uniz-회원가입</title>
<link rel="stylesheet" href="/resources/css/RegisterLogin.css">
<link rel="stylesheet" href="/resources/css/RegisterModel.css">
</head>
<body>

<div class="bg">
    <div class="register-box">
        <form id="form" action="/user/register" method="post" onsubmit="return checkForm();">
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
       
        <div class="regTextBox">
            <p class="regHeader"><i class="fa fa-user"></i>아이디</p>
            <input type="text" id="userId" name="userId" placeholder="아이디를 입력하세요" size="70">
            <button type="button" class="duplicateBtn" id="userIdCheckBtn">중복확인</button>
        </div>
        
        <div class="regTextBox"><p class="regHeader"><i class="fa fa-lock"></i>비밀번호</p>
            <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요">
        </div>
    
        <div class="regTextBox">
            <p class="regHeader">비밀번호 확인</p>
            <input type="password" id="password2" name="password2"placeholder="">
        </div>
    
        <div class="regTextBox">
            <p class="regHeader"><i class="far fa-laugh-squint"></i>닉네임</p>
            <input type="text" id="nick" name="nick" placeholder="닉네임을 입력하세요" size="70">
            <button type="button" class="duplicateBtn" id="userNickCheckBtn">중복확인</button>
        </div>
        
        <div class="btnBox">
            <button type="button" class="logBtn regBtn" id="myBtn" onclick="">다음</button>
            <button class="logBtn" type="button" onclick="location.href='/'">취소</button>
        </div>
        
        
    </div> 
    
    <!-- The Modal -->
		<div id="myModal" class="modal">
		
		  <!-- Modal content -->
		  <div class="modal-content">
		    <div class="title">
		      <p>마지막 단계입니다! 당신의 유튜브 취향을 선택해주세요!</p>
		    </div>
			<div class="gridContainer">
				<c:forEach items="${PresetList}" var="preset" varStatus="status">
					<input type="checkbox" id="uniz${status.count}" name ="unizSN" value="${preset.unizSN}">
      					<label for="uniz${status.count}" class="item uniz${status.count}"><p class="p${status.count}">${preset.unizKeyword}</p></label>
      					
				</c:forEach>
				
				<input type="hidden" name="state" value="1">
		        <button class="submitBtn"type="submit">완료</button>
		    </div>
		    <!-- end gridContainer -->
		    
		  </div>
		
		</div>
    </form>
</div>
	
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
	
	
	
    // Get the modal
    var modal = document.getElementById("myModal");
    
    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");
    
    function checkForm(){
		let form = document.getElementById("form");
		
		if(form.userId.value == ""){
			alert("아이디를 입력하세요");
			modal.style.display = "none";
			form.userId.focus();
			return false;
		}
		
		if(form.userId.value.length < 4 || form.userId.value.length > 12){
			alert("아이디는 4~12자 이내로 입력 가능합니다!");
			modal.style.display = "none";
			form.userId.select(); 
			return false;
		}
		
		
		 if (form.password.value == "")
            {
                 alert("비밀번호를 입력해주세요");
                 modal.style.display = "none";
                 form.password.focus();//포커스를 Password박스로 이동.
                 return false;
            }
		 
		 if (form.password.value.length < 4 || form.password.value.length > 12)
            {
                 alert("비밀번호는 4~12자 이내로 입력 가능 합니다!");
                 modal.style.display = "none";	
                 form.password.select();
                 return false;
            }
		 
		 if(form.nick.value == ""){
				alert("닉네임을 입력해주세요");
				modal.style.display = "none";
				form.nick.focus();
				return false;
			}
			
			if(form.nick.value.length < 2 || form.nick.value.length > 9){
				alert("닉네임은는 2~8자 이내로 입력 가능합니다!");
				modal.style.display = "none";
				form.nick.select(); 
				return false;
			}
			
			if(form.password.value != form.password2.value){
				alert("비밀번호가 일치하지 않습니다. 비밀번호를 확인해주세요");
				return false;
			}
			
			if($("#userIdCheckBtn").is(":disabled") == false){
				alert("아이디 중복체크를 해주세요");
				return false;
			}
			
			if($("#userNickCheckBtn").is(":disabled") == false){
				alert("닉네임 중복체크를 해주세요");
				return false;
			}
			
		 
		 for (i=0; i<form.userId.value.length; i++)
            {
                   var ch = form.userId.value.charAt(i);//문자를 반환(정수형), 범위 검사 가능

                   //입력된 문자를 검사

                   if ( (ch < "a" || ch > "z") && (ch < "A" || ch > "Z") && (ch < "0" || ch > "9" )){
	                    alert("아이디는 영문 소문자로만 입력 가능 합니다!");
	                    modal.style.display = "none";
	                    form.userId.select();
	                    return false;
                   }
                   
                   return ;
            }
		return true;
	}
    // When the user clicks the button, open the modal 
    btn.onclick = function() {
        modal.style.display = "block";        
    }
        
    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
      if (event.target == modal) {
        modal.style.display = "none";
      }
    }

    $(document).ready(function(){
		
		$('#userIdCheckBtn').click(function(){
			
			if($("#userId").val()==""){
			alert("중복체크할 아이디를 입력해 주세요");
			return ;
			}
		
		$.ajax({
			type : "POST",
			url : "/user/userIdCheck",
			data : $("#userId").val(),		
			contentType : "application/json; charset=UTF-8",
			dataType: "json",
			success : function(data){
				
				const SUCCESS = "SUCCESS";
				const DUPLICATION = "DUPLICATION";
				
				if(data.result == SUCCESS){
					alert("사용할 수 있는 아이디 입니다.")
					$("#userId").attr("readonly", "true");
					$("#userIdCheckBtn").attr("disabled", "true");
				}else if(data.result == DUPLICATION){
					alert("이미 존재하는 아이디 입니다.")	
				}else{
					alert("데이터 입력 중 오류가 발생하였습니다.\n입력한 정보를 다시 확인해 주세요.");
				}			
			}
		});
	});
	
	$('#userNickCheckBtn').click(function(){
		
		if($("#nick").val()==""){
			alert("중복체크할 닉네임를 입력해 주세요");
			return ;
		}
		console.log("중복확인버튼클릭");

		$.ajax({
			type : "POST",
			url : "/user/userNickCheck",
			data : $("#nick").val(),		
			contentType : "application/json; charset=UTF-8",
			dataType: "json",
			success : function(data){
				
				const SUCCESS = "SUCCESS";
				const DUPLICATION = "DUPLICATION";
				if(data.data == SUCCESS){
					alert("사용할 수 있는 닉네임 입니다.");
					$("#nick").attr("readonly", "true");
					$("#userNickCheckBtn").attr("disabled", "true");
				}else if(data.data == DUPLICATION){
					alert("이미 존재하는 닉네임 입니다.")	
				}else{
					alert("데이터 입력 중 오류가 발생하였습니다.입력한 정보를 다시 확인해 주세요.");
				}			
			}
		});			
	});
	
	
});
</script>

</body>
</html>