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
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/usermodify.css">
<link rel="stylesheet" href="/resources/css/RegisterCreator.css">
</head>

<body>
	<%@ include file="/WEB-INF/views/includes/nav.jsp"%>
	<div class="mainPage">
	
		<div class="emptyBox">
			<h1>내 프로필</h1>
		</div>
		<div class="myTotalbox">
			<div class="myPageBanner">
				<div class="profileBox">
					<div class="profileImg">
						<img src="profile.jpg" alt="">
					</div>
				</div>
				<div class="myinfoBox">
					<h6>${user.nick}님의마이페이지</h6>
					<p>닉네임 : ${user.nick}</p>
					<p>아이디 : ${user.userId }</p>
					<c:if test="${user.userType eq 1}">
						<p>일반회원</p>
					</c:if>
					<c:if test="${user.userType eq 2}">
						<p>크리에이터</p>
					</c:if>
					<c:if test="${user.userType eq 99}">
						<p>관리자</p>
					</c:if>
					<p>가입일 : ${user_createDateTime}</p>

					<div class="myButtonBox">
						<button class="myModify" id="myBtn2"
							onclick="location.href='/user/modify'">수정하기</button>
						<button class="myDelete" id="removeBtn">탈퇴하기</button>
						<c:if test="${apply eq null }">
						<button id="showModal" style="display: none;">크리에이터 신청 현황 </button>
						</c:if>
						
						<c:if test="${apply ne null }">
							<button id="showModal">크리에이터 신청 현황 </button>
						</c:if>
					</div>
				</div>
			</div>
			
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
									
					<c:when test = "${apply.state == 10}" >
						<td>심사중</td>
					</c:when>
					
					<c:when test = "${apply.state == 11 }" >
						<td>승인</td>
					</c:when>
					
					<c:when test = "${apply.state == 12 }" >
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
			
<%-- 			<div id="myModal" class="modal">
				<div class="modal-content">
					<h3>[ 크리에이터 신청 상태 ]</h3>
					<div class="applyInfo">
						
						<table style="width: 100%; all:none;" >
							<thead class="thead-light">
								<tr>
									<th> [채널 이름] </th>
									<th> [이메일 주소] </th>
									<th> [신청 현황] </th>
									<th> [신청 날짜] </th>
									</tr>
							</thead>
							
								<tr>
									<td></a><c:out value="${apply.channelTitle}" /></td>
									<td><c:out value="${apply.email}" /></td>
									
									<c:choose>
									
										<c:when test = "${apply.state == 10}" >
											<td>심사중</td>
										</c:when>
										
										<c:when test = "${apply.state == 11 }" >
											<td>승인</td>
										</c:when>
										
										<c:when test = "${apply.state == 12 }" >
											<td>거절</td>
										</c:when>
										
									</c:choose>
									
									<td><fmt:formatDate pattern="yyyy-MM-dd" 
								 value="${apply.createDateTime}"/></td>
								</tr>
								
						</table>		
							
							<button class="moveApplyInfo">신청 내역 보러가기</button>
							
					</div>
				</div>
			</div> --%>

			<div class="MyPageunizPointBox">
				<div class="line2"></div>
				<div class="myUnizPoints">
					<div class="myPointsClassHeaderBox">
					<div class="pointttt">
						<p class="myPointsHeader">내 유니즈 포인트 리스트</p>
						<p class="myPointsHeader">내 포인트 이력</p>
					</div>
					</div>

					 <div class="boxboxbox">
					<div class="myPointsBox">
						<c:forEach items="${myUnizPoint}" var="myUnizPoint">
							<div class="myPoint">
								<div class="pointUp">
									<p>${myUnizPoint.unizKeyword}</p>
								</div>
								<div class="pointDown">
									<p>${myUnizPoint.point}</p>
								</div>
							</div>

					</c:forEach>


						<!-- 계속 추가하면 된다.  -->
					</div>
					
					<div class="pointHistory">
                      <table class="ui table" style="width: 100%; all:none;" id="logTable">
							<thead class="thead-light">
								<tr>
									<th>유니즈키워드</th>
									<th>변동사항</th>
									<th>변경사유</th>
									<th>변경일</th>
								</tr>
							</thead>
						</table>
                    </div>
                    <!-- end pointHistory -->
					</div>
				</div>
			</div>
			
			<div id="myModal2" class="modal2">

		  <!-- Modal content -->
		  <div class="modal-content2">
		      
		    <div class="title">
		        <h1>My Profile</h1>
		    </div>
		    <form class="ModForm" action="">
		       <p class="label">닉네임</p>
		        <input class="form-control3"type="text">
		        <p class="label">유저 아이디</p>
		        <input class="form-control3" type="text" readonly="readonly">
		        <p class="label">현재 비밀번호</p>
		        <input class="form-control3" type="password">
		        <p class="label">새로운 비밀번호</p>
		        <input class="form-control3" type="password" id="myPwdCheck">
		        <div class="showPwd">
		            <input type="checkbox" onclick="myFunction()">  Show password
		        </div>
		        <p class="label">비밀번호 확인</p>
		        <input class="form-control3" type="password" >
		        <div class="btnBox">
		            <button  class="modOKBtn"type="submit">수정 완료</button>
		        </div>
		    </form>


  </div>

</div>
		</div>
		
	</div>
	
	
	<%@ include file="/WEB-INF/views/includes/script.jsp"%>
	<script>
		
		var modal = document.getElementById("myModal");
		
		var showModal = document.getElementById("showModal");
		// Get the modal
		var modal2 = document.getElementById("myModal2");
		
		// Get the button that opens the modal
		var btn2 = document.getElementById("myBtn2");
		
		showModal.onclick = function(){
			modal.style.display = "block";
		}
		
		window.onclick = function(event) {
			if (event.target == modal) {
		        modal.style.display = "none";
		    }
		}
		
		// When the user clicks the button, open the modal 
		btn2.onclick = function() {
		  modal2.style.display = "block";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
		  if (event.target == modal2) {
		    modal2.style.display = "none";
		  }
		}
		
		$(".moveApplyInfo").on("click", function(){
			
			self.location = "../creator/get?userSN="+ ${user.userSN};
			
		});
	
		$(document).ready(function() {
			$("#removeBtn").click(function() {
				if (confirm("정말로 탈퇴하시겠습니까??") == true) {
					location.href = '/user/delete';
				}
			});
			
			$('#logTable').DataTable({
				
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
					"search": "검색:",
					"info": "_PAGE_ / _PAGES_",
					"infoFiltered": "(전체 _MAX_개의 데이터 중 검색결과)",
					"paginate": {
						"previous": "이전",
						"next": "다음"
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
					{data: "type"},
					{data: "createDateTime"}
				]
			

		});
			
			
	});

		
	</script>

</body>
</html>