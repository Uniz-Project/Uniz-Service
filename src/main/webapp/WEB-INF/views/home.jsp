<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="stylesheet" href="/resources/css/Navbar.css">
	<link rel="stylesheet" href="/resources/css/main.css">
	<link rel="stylesheet" href="/resources/css/Footer.css">
</head>
  <body>
	<%@ include file="/WEB-INF/views/includes/nav.jsp"%>		
	  <!-- Nav bar -->
       
    <!-- end navbar -->
    <div class="mainPage">
        <div class="title4">
            <p>랜덤 추천영상</p>
            <button class="arrow"><i class="fas fa-angle-right"></i></button>
        </div>
        <div class="banner">
        		<c:forEach items="${randomVideo}" var="list" varStatus="status" end="2">
	        	<div class="img${status.count}">
        			<a href="/video/${list.videoSN }"><img id="img" class="style-scope yt-img-shadow" alt="" width="9999" src="${list.thumbUrl}"></a>
        			<!-- <div class="youtubeInfo">
                    	<p></p>
                	</div> -->
        		</div>
        	</c:forEach>
        </div>
        <!-- end banner -->
        <div class="lateTitle">
            <p>최신 영상들</p>
            <button class="seeMore">더 보기</button>
        </div>
        <div class="line"></div>
        <div class="latestVideos">
        	<c:forEach items="${latestVideo}" var="list">
	            <div class="late">
	                <a href="/video/${list.videoSN}"><img id="img" class="style-scope yt-img-shadow" alt="" width="9999" src="${list.thumbUrl}"></a>
	            </div>
        	</c:forEach>
        </div>
        
        <div class="lateTitle">
            <p>인기 영상들</p>
            <button class="seeMore">더 보기</button>
        </div>
        <div class="line"></div>
        <div class="latestVideos">
            <c:forEach items="${popVideo}" var="list">
	            <div class="late">
	                <a href="/video/${list.videoSN}"><img id="img" class="style-scope yt-img-shadow" alt="" width="9999" src="${list.thumbUrl}"></a>
	            </div>
        	</c:forEach>
        </div>
    </div>
    <!-- end mainPage -->
    
    <a href="/category/board/${board.boardSN}">
    <div class="commuNews">
     <img src="\resources\img\coofee.jpg" class="commuImg" alt=""> 
        <div class="todaysCommu">오늘의 커뮤니티</div>
        <div class="text">
            <p class="boardName">${board.boardComment}</p>
           <h4> ${board.title}</h4>
           <div class="content">
               <div class="inner-content">
               ${board.postContent}
              </div>
           </div>
        </div>
    </div>
	</a>
	
<div class="emptyNav"></div>
<div class="creatorBanner">
    <!-- <p>크리에이터 신청하러 가기 </p> -->
    <img src="\resources\img\ppl.png" alt="">
    <div class="creatorP">
        <div class="ctP">

            <p>uniz에서 유튜브 영상도 보고 나만의 게시판도 만들자!</p>
            <button class="goChannel" onclick="location.href='channel/ch'">uniz 크리에이터 신청하러 가기</button>
        </div>
    </div>
</div>
<!-- end creatorBanner -->
    <!-- <div class="commuBoard">

    </div> -->
    
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

<script>
        (function(){
    var num = 0;
    $(window).scroll(function(){
        // 조건식에서 == 보다 >= 를 사용 한 이유
        // == 스크롤 높이가 뭐빼기 뭐해서 같으면 끝까지 왔다라고 생각하는건데 >= 는 스크롤높이가 뭐빼기 뭐보다 더 커도(더 밑으로 내려가있어도) 끝까지 간거다 
        // 브라우저마다 특성이 다르기 때문에 같다보다는 크거나 같음으로 진행
        if($(window).scrollTop() >= $(document).height() - $(window).height()){ // 스크롤의 마지막 값을 인식한다.
            var $clone = $('.popVideoBox').eq(num).first().clone()

            num++
            $('.infiniteScroll').append($clone)
            console.log(num);
        }
    })
})();

var btns = document.getElementsByClassName("keyword");
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function() {
  var current = document.getElementsByClassName("active");
  current[0].className = current[0].className.replace(" active", "");
  this.className += " active";
  });
}


    </script>
  </body>
</html>