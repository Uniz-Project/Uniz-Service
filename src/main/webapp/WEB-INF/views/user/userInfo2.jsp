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
<link rel="stylesheet" href="/resources/css/userInfo2.css">
<link rel="stylesheet" href="/resources/css/Navbar.css">
<link rel="stylesheet" href="/resources/css/Footer.css">
<link rel="stylesheet" href="/resources/css/RegisterCreator.css">
<link rel="stylesheet" href="/resources/css/usermodify.css">

</head>

<body>
	<%@ include file="/WEB-INF/views/includes/nav.jsp"%>

<div class="emptyNav" style="width: 100%; height: 80px; background-color: #f1f1f1;"></div>
        
    <div class="mainPage">
         <div class="proBox">
             <div class="title">
                 <p>마이페이지</p>
             </div>
             <div class="downBox">

                 <img src="사진자료/cafe2.jpg" alt="">
                 <div class="userInfo">

                     <p class="span"><i class="fa fa-crown"></i>  Creator</p><p class="user">노가다님</p>
                     <p>닉네임: 노가다</p>
                     <p>아이디: jinjinjara</p>
                     <p>가입일: 2020/12/25</p>

                     <div class="btnBox3">
                         <button class="btn modBtn2"id="modifyB">수정하기</button>
                         <button class="btn delBtn2">탈퇴하기</button>
                         <button class="btn crtBtn" id="creatorB">크리에이터 신청상태</button>
                     </div>
                </div>
                <!--  end userInfo -->

            </div>
            
            
        </div>
        <!-- end proBox -->
        <div class="btn-links">
            <button class="linkBtn active" onclick="location.href='/user/info'">선호 유니즈 포인트</button>
            <button class="linkBtn" onclick="location.href='/user/info2'">포인트 변경 이력</button>
        </div>
        <div class="content-wrapper">
            <div class="contents">
               
                <table>
                    <thead>
                        <tr>
                            <th>유니즈 키워드</th>
                            <th>변동사항</th>
                            <th>변경사유</th>
                            <th>변경일</th>
                        </tr>
                    </thead>
                      <tr>
                          <td>동물</td>
                          <td>고양이</td>
                          <td>맘에 안들어서 뭐 어쩌라고</td>
                          <td>2020/12/25</td>
                      </tr>
                      <tr>
                        <td>동물</td>
                        <td>고양이</td>
                        <td>맘에 안들어서 뭐 어쩌라고</td>
                        <td>2020/12/25</td>
                    </tr>
                    <tr>
                        <td>엔터테인먼트가 어쩌고 저쩌고 이거 뭐지 </td>
                        <td>고양이</td>
                        <td>맘에 안들어서 뭐 어쩌라고</td>
                        <td>2020/12/25</td>
                    </tr>
                    <tr>
                        <td>동물</td>
                        <td>고양이</td>
                        <td>맘에 안들어서 뭐 어쩌라고</td>
                        <td>2020/12/25</td>
                    </tr>
                </table>
                
                <div class="page-links">
                        <ul>
                            <li>
                                <a href="">&laquo;</a>
                            </li>
                            <li>
                                <a href="">1</a>
                            </li>
                            <li>
                                <a href="">2</a>
                            </li>
                            <li>
                                <a href="">&raquo;</a>
                            </li>
                        </ul>
                </div>
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
        <tr>
          <thead>
            <th>채널 이름</th>
            <th>이메일 주소 </th>
            <th>신청 현황</th>
            <th>신청 날짜</th>
          </thead>
        </tr>
        <td>ㅋㅋㅋㅋㅋㅋsdfsdsdfsfsffdsdfsㅋ</td>
        <td>jinvicky17@gmadfsfssddsdddsfsdsil.com</td>
        <td>2020/12/2sdfsfdsfds5</td>
        <td>ㅋㅋㅋㅋㅋㅋㅋsdfsfdsdssd</td>
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

<script>
// Get the modal
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


</script>
    
</body>

</body>
</html>