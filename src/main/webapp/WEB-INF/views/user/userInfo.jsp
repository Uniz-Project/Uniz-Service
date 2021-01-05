<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:formatDate var="user_createDateTime" value="${user.createDateTime}"
	pattern="yyyy-MM-dd" />
<fmt:formatDate var="user_updateDateTime" value="${user.updateDateTime}"
	pattern="yyyy-MM-dd" />
	
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.22/datatables.min.css"/>
<link rel="stylesheet" href="/resources/css/userInfo.css">
<link rel="stylesheet" href="/resources/css/Navbar.css">
<link rel="stylesheet" href="/resources/css/Footer.css">
<link rel="stylesheet" href="/resources/css/RegisterCreator.css">
<link rel="stylesheet" href="/resources/css/usermodify.css">
<style>
	
	table, td, th {  
   
    text-align: center;
  }
  
  table {
    border-collapse: collapse;
    width: 95%;
    margin: 0 auto;
  }
  th{
      color : black;
  	  font-weight : bold;
      background-color: #eff1ff;
  }
  thead {
  	border-bottom : none;
  }
  
  th, td {
    padding: 15px;
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
  }
  
</style>
</head>

<body>
	<%@ include file="/WEB-INF/views/includes/nav.jsp"%>
<!-- <div class="emptyNav" style="width: 100%; height: 80px; background-color: #f1f1f1;"></div> -->
        
    <div class="mainPage">
         <div class="proBox">
             <div class="title">
                 <p>마이페이지</p>
             </div>
             <div class="downBox">
				 <form class="upload"action="/user/profile" method="post" enctype="multipart/form-data">
  		               <label class="input-file-button" for="input-file"><img src="/resources/imgUpload/UserPhoto/${user.imgUrl}" alt=""></label>
  		               <input type="file" name="imgFile" id="input-file" style="display: none;"/>
  		              
  		               	<button class="btn modBtn3">프로필 수정</button>
				 </form>
                 <div class="userInfo">

                     	<c:if test="${user.userType eq 2}">
                     	<p class="span">
                     	<i class="fab fa-youtube"></i>  Creator</p>
                     	</c:if>
                     	<p class="user">${user.nick}님</p>
              		 <p>닉네임 : ${user.nick}</p>
					<p>아이디 : ${user.userId }</p>
					<c:if test="${user.userType eq 1}">
						<p>일반회원</p>
					</c:if>
					<c:if test="${user.userType eq 2}">
						
					</c:if>
					<c:if test="${user.userType eq 99}">
						<p>관리자</p>
					</c:if>
					<p>가입일 : ${user_createDateTime}</p>


                     <div class="btnBox3">
                         <button class="btn modBtn2"id="modifyB">수정하기</button>
                         <button class="btn delBtn2" id="removeBtn">탈퇴하기</button>
                         <c:if test="${apply eq null }">
	                         <button class="btn crtBtn" id="creatorB" style="display: none;">크리에이터 신청상태</button>
                         </c:if>
                         
                         <c:if test="${apply  ne null }">
	                         <button class="btn crtBtn" id="creatorB">크리에이터 신청상태</button>
                         </c:if>
                     </div>
                </div>
                <!--  end userInfo -->

            </div>
            
            
        </div>
        <!-- end proBox -->
        <div class="btn-links">
            <button class="linkBtn active" id="unizBtn" onclick="location.href='/user/info'">선호 유니즈 포인트</button>
            <button class="linkBtn" id="plogBtn" onclick="showPointLog()">포인트 변경 이력</button>
        </div>
        <div class="content-wrapper" id="content-wrapper">
            <div class="contents">
            	<c:forEach items="${myUnizPoint}" var="myUnizPoint">
                <div class="item">
                    <div class="up"><p>${myUnizPoint.unizKeyword}</p></div>
                    <div class="down"><p>${myUnizPoint.point}</p></div>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <!-- end mainPage -->
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
    
 <!-- The Modal -->
<div id="myModal" class="modal">
  <!-- Modal content -->
  <div class="modal-content">

    <div class="title">
      <h1>크리에이터 신청 상태</h1>
    </div>
    <div class="tableContainer">
      <table>
          <thead>
	        <tr>
            <th>채널 이름</th>
            <th>이메일 주소 </th>
            <th>신청 현황</th>
            <th>신청 날짜</th>
	        </tr>
          </thead>
          <tr>
	        <td><c:out value="${apply.channelTitle}" /></td>
	        <td><c:out value="${apply.email}" /></td>
	            <c:choose>
						<c:when test = "${apply.state == 1}" >
							<td>심사중</td>
						</c:when>
						
						<c:when test = "${apply.state == 2 }" >
							<td>승인</td>
						</c:when>
						
						<c:when test = "${apply.state == 3 }" >
							<td>거절</td>
					</c:when>
				</c:choose>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${apply.createDateTime}"/></td>
			</tr>
      </table>
      <div class="btnBox">
        <button class="goBtn">
          신청내역 보러 가기
        </button>
      </div>
    </div>
  </div>
</div>

<!-- The Modal -->
<div id="myModal2" class="modal2">

  <!-- Modal content -->
  <div class="modal-content2">
      
    <div class="title">
        <h1>My Profile</h1>
    </div>
    <form id="form" class="ModForm" action="/user/modify" method="post" onsubmit="return checkForm();">
       
       <label class="label" for="modal_nick">닉네임</label>
        <input class="form-control3" style="width:72%" id="modal_nick" name="nick" type="text" value="${user.nick}">
        <button type="button" class="duplicateBtn" id="userNickCheckBtn">중복확인</button>
        <p class="label">현재 비밀번호</p>
        <input class="form-control3" name="c_password" type="password">
        <p class="label">새로운 비밀번호</p>
        <input class="form-control3" name="password" type="password" id="myPwdCheck">
        <p class="label">새비밀번호 확인</p>
        <input class="form-control3" name="password2" type="password" >
        
        <div class="showPwd">
            <input type="checkbox" onclick="myFunction()">  Show password
        </div>
        <div class="btnBox">
            <button  class="modOKBtn" type="submit">수정 완료</button>
        </div>
    </form>
    
    <input type = "hidden" id="msg" value = "${param.MSG}">
	<input type ="hidden" id="nickcheck">

  </div>

</div>   
<%@ include file="/WEB-INF/views/includes/script.jsp"%>
<script>
$(document).ready(function(){
	let msg = $("#msg").val()
	//Get the modal
	var modal = document.getElementById("myModal");
	// Get the button that opens the modal
	var btn = document.getElementById("creatorB");
	//Get the modal
	var modal2 = document.getElementById("myModal2");
	// Get the button that opens the modal
	var btn2 = document.getElementById("modifyB");
	
	// When the user clicks the button, open the modal 
	btn.onclick = function() {
	  modal.style.display = "block";
	}
	//When the user clicks the button, open the modal 
	btn2.onclick = function() {
	  modal2.style.display = "block";
	}
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	  
	  if (event.target == modal2) {
		    modal2.style.display = "none";
	   }
	}
	
	$("#removeBtn").click(function() {
		if (confirm("정말로 탈퇴하시겠습니까??") == true) {
			location.href = '/user/delete';
		}
	});
	
	$('#userNickCheckBtn').click(function(){
		
		if($("#modal_nick").val()==""){
			alert("중복체크할 닉네임를 입력해 주세요");
			return ;
		}
		console.log("중복확인버튼클릭");
	
		$.ajax({
			type : "POST",
			url : "/user/userNickCheck",
			data : $("#modal_nick").val(),		
			contentType : "application/json; charset=UTF-8",
			dataType: "json",
			success : function(data){
				
				const SUCCESS = "SUCCESS";
				const DUPLICATION = "DUPLICATION";
				if(data.data == SUCCESS){
					alert("사용할 수 있는 닉네임 입니다.");
					$("#userNickCheckBtn").attr("disabled", "disabled");
					let nick = $("#modal_nick").val();
					$("#nickcheck").val(nick);
				}else if(data.data == DUPLICATION){
					alert("이미 존재하는 닉네임 입니다.")	
				}else{
					alert("데이터 입력 중 오류가 발생하였습니다.입력한 정보를 다시 확인해 주세요.");
				}			
			}
		});			
	});
	
	if(msg == "FAIL"){
		alert("비밀번호가 일치하지않습니다.");
	}
	
});
function checkForm(){
	let form = document.getElementById("form");
	let nick = "${user.nick}";
	let modal_nick = $('#modal_nick').val();
	//닉네임이 변경되었으면 중복확인하도록
  	if(nick != modal_nick){
  		if($("#userNickCheckBtn").attr("disabled") != "disabled"){
	  		alert("닉네임 중복확인을 해주세요");
	  		return false;
  		}
	} 
	
	if (form.password.value.length < 4 || form.password.value.length > 12)
    {
         alert("비밀번호는 4~12자 이내로 입력 가능 합니다!");
         modal.style.display = "none";	
         form.password.select();
         return false;
    }
	if(form.password.value != form.password2.value){
		alert("비밀번호가 일치하지 않습니다. 비밀번호를 확인해주세요");
		return false;
	}
	
	if($("#nickcheck").val() != $("#modal_nick").val()){
		alert("닉네임 중복체크를 해주세요");
		$("#userNickCheckBtn").attr("disabled", false);
		return false;
	}
	
	return true;
}
// 비밀번호 보여주기.  
function myFunction() {
      var x = document.getElementById("myPwdCheck");
      if (x.type === "password") {
        x.type = "text";
      } else {
        x.type = "password";
      }
    }
function showPointLog(){
	
	$("#unizBtn").css("color","black");
	$("#unizBtn").css("font-weight","normal");
	$("#unizBtn").css("border-bottom","none");
	$("#plogBtn").css("color","rgb(0, 162, 255)");
	$("#plogBtn").css("font-weight","bold");
	$("#plogBtn").css("border-bottom","3px solid rgb(0, 162, 255)");
	
	let content = $("#content-wrapper");
	
	let str  = `
	
    			<table id='logTable'>
        		<thead class='logHead'>
	            <tr>
	                <th>유니즈 키워드</th>
	                <th>변동사항</th>
	                <th>변경사유</th>
	                <th>변경일</th>
	            </tr>
       
				</table>
    `;
    
    content.html(str)
    
	$('#logTable').DataTable({
		
		lengthChange : false,
		searching : false,
		processing: true,
		serverSide: false,
		paging: true,
		pagingType: "simple_numbers",
		order: false,
		ordering: false,
		info: true,
		filter: true,
		
		language: {
			"zeroRecords": "데이터가 없습니다.",
			"lengthMenu": "_MENU_ 개씩 보기",
			"info": "_PAGE_ / _PAGES_",
			"infoFiltered": "(전체 _MAX_개의 데이터 중 검색결과)",
			"paginate": {
				"previous": "<",
				"next": ">"
			} 
		},
		ajax:{
			"url": "/user/getMyPointHistory",
			"type" :"GET",
			"dataType" : "json"
		},
		columns: [
			{data: "unizKeyword"},
			{data: "point"},
			{data: "codeName"},
			{data: "createDateTime"}
		]
	
	});
}

$(".goBtn").on("click" , function(){
	self.location="/creator/get?userSN=" + ${user.userSN};
});

</script>
</body>
</html>