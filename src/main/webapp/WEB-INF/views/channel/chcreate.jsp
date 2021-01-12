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
	<link rel="stylesheet" href="/resources/css/Footer.css">
</head>
<body>


	<%@ include file="/WEB-INF/views/includes/nav.jsp"%>
	
	<div class="leftSidebar">
            <div class="fixed">
                <div class="SideHd">커뮤니티</div>
                <button id="channelPost" class="moveChannel">채널 게시판</button>
                <button id="channelPost" class="moveCategory">카테고리별 게시판</button>
            </div>
    </div>
	<div class="applyMain">
		<div class="creatorRegisterHeader">
			<h1>채널 게시판 개설 페이지</h1>
		</div>
			<div class="createForm">
				<form  style="height: auto;"action="/channel/chcreate" method="post" onsubmit="">
					<div class="RegisterForm">
					<!--  여기여기      i class~ fas fa- 부분을 봐주세요. class="pencil"로 클래스 이름을 바꿨습니다.  -->
						<label class="label">채널 이름 <button class="pencil" id="titleModify"><i class="fas fa-pencil-alt"></i></button></label>
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
		<!--  여기여기  includes 안 먹혀서 대신 이걸 넣었습니다.  -->
<div class="footer">
        <div class="foot">
            <div class="header">
                <h3> 고객센터</h3> <span>|</span> <h3>공지사항</h3>
            </div>
            <div class="midInfo">
                <p>콘텐츠 제공 문의</p>
                <p>페이스북</p>
                <p>회사 소개 </p>
                <p>인스타그램</p>
                <p>인재 채용</p>
                <p>사업 제휴 문의 </p>
            </div>
            
            <div class="address">
                <p>서울특별시 종로구 종로2가 9 YMCA 7F</p>
                <div class="conf">
    
                    <p>@uniz Corp</p>
                    <p>이용 약관</p>
                    <p>|</p>
                    <p>개인정보 처리방침</p>
                    <p>|</p>
                    <p>청소년 보호 정책</p>
                    <p>|</p>
                    <p>사업자 정보 확인</p>
                </div>
            </div>
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
			
			alert("채널이 개설되었습니다.");
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