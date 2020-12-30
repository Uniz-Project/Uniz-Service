<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<link rel="stylesheet" href="/resources/css/chcreate.css"/>
	<link rel="stylesheet" href="/resources/css/Navbar.css">
</head>
<body>


	<%@ include file="/WEB-INF/views/includes/nav.jsp"%>
	
	
	<div class="applyMain">
		<div class="creatorRegisterHeader">
			<h1>채널 게시판 개설 페이지</h1>

		</div>
		<div class="createForm">
			<form action="/channel/chcreate" method="post" onsubmit="">
				<div class="RegisterForm">
					<label class="label">채널 이름 <button class="submitBtn" id="titleModify">채널 이름 수정하러 가기</button></label>
					<input class="form-control" id='channelTitle' value="<c:out value="${apply.channelTitle}"/>" name='channelTitle'  readonly="readonly">
					<label class="label"> 게시판 사용 목적</label>
					<textarea class="form-control" id='channelComment' name='channelComment'></textarea>
					<input type="hidden" class="form-control"name='userSN' value="${user.userSN}">
					

			
					<div class="applyBtnBox">
							<button class="submitBtn" data-oper='create' id='create' type='submit'>채널 만들기</button> 
							<button class="submitBtn" data-oper='list' id='list'>채널 목록으로 이동</button>
					</div>
				</div>
			</form>
				
			</div>
		</div>
		

		

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>	

<script type="text/javascript">

$(document).ready(function(){
	
	console.log("ggggg");
	
	var formObj = $("form");
	
	$('button').on("click", function(e){
		
		console.log("click");
		
		console.log(oper);
		
		
		
		e.preventDefault();
		
		var oper = $(this).data('oper');
		
		if(oper == 'list'){
			
			self.location="/channel/ch";
			return;
			
		} if(oper == 'create'){
			
			alert("test");
			formObj.submit();
			
		}
		
	});
	
	$("#titleModify").on("click", function(){
		
		self.location="../creator/modify?userSN="+${user.userSN};
		
	});
	
	function checkValid(){
		
		var channelTitle = document.getElementById("channelTitle");
		var channelContent = document.getElementById("channelComment");
		
		var blank_pattern = /^\s+|\s+$/g;
		
		if(channelTitle.value == '' || channelTitle.value == null || channelTitle.value.replace(blank_pattern, '').length == 0){
			alert("채널 이름을 입력해 주세요.");
			return false;
		}
		
		if(channelContent.value == '' || channelContent.value == null || channelContent.value.replace(blank_pattern, '').length == 0){
			alert("채널 개설 목적을 적어주세요.");
			return false;
		}
		
	}
	
});

</script>

</body>
</html>