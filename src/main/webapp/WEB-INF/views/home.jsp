<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
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
            <p>오늘의 추천영상</p>
            <button class="arrow"><i class="fas fa-angle-right"></i></button>
        </div>
        <div class="banner">
            <div class="img1">
                <img id="img" class="style-scope yt-img-shadow" alt="" width="9999" src="https://i.ytimg.com/vi/a_iQqN1Hp74/hq720.jpg?sqp=-oaymwEZCNAFEJQDSFXyq4qpAwsIARUAAIhCGAFwAQ==&amp;rs=AOn4CLBkvwp-LdAIok8XhkupIQL2p5X1Fw">
                <div class="youtubeInfo">
                    <p></p>
                </div>
            </div>
            <div class="img2">
                <img id="img" class="style-scope yt-img-shadow" alt="" width="9999" src="https://i.ytimg.com/vi/yquISGFXz9I/hq720.jpg?sqp=-oaymwEZCNAFEJQDSFXyq4qpAwsIARUAAIhCGAFwAQ==&amp;rs=AOn4CLDdSeJaU0QEXTtW2SEt2Q2WjIA-xw">
                <div class="youtubeInfo">
                    <p></p>
                </div>
            </div>
            <div class="img2">
                <img id="img" class="style-scope yt-img-shadow" alt="" width="9999" src="https://i.ytimg.com/vi/b25nmmgouwE/hq720.jpg?sqp=-oaymwEZCNAFEJQDSFXyq4qpAwsIARUAAIhCGAFwAQ==&amp;rs=AOn4CLDMeKja06tRLgiDjgiNVMJO5U_WKQ">
                <div class="youtubeInfo">
                    <p></p>
                </div>
            </div>
        </div>
        <!-- end banner -->
        <div class="lateTitle">
            <p>최신 영상들</p>
            <button class="seeMore">더 보기</button>
        </div>
        <div class="line"></div>
        <div class="latestVideos">
            <div class="late">
                <img id="img" class="style-scope yt-img-shadow" alt="" width="9999" src="https://i.ytimg.com/vi/v1Ee7kdXUZY/hq720.jpg?sqp=-oaymwEZCNAFEJQDSFXyq4qpAwsIARUAAIhCGAFwAQ==&amp;rs=AOn4CLB8oEOnIdXrI31f_Fyrk3zOUivAag">
            </div>
            <div class="late">
                <img id="img" class="style-scope yt-img-shadow" alt="" width="9999" src="https://i.ytimg.com/vi/gdZLi9oWNZg/hq720.jpg?sqp=-oaymwEXCNAFEJQDSFryq4qpAwkIARUAAIhCGAE=&amp;rs=AOn4CLDIaWB85iTNr812wpJgEdE3XrvN_Q">
            </div>
            <div class="late">
                <img id="img" class="style-scope yt-img-shadow" alt="" width="9999" src="https://i.ytimg.com/vi/1e12paAVxbQ/hq720.jpg?sqp=-oaymwEXCNAFEJQDSFryq4qpAwkIARUAAIhCGAE=&amp;rs=AOn4CLCHqMxA5Ek5XD3T1sqUolja8JAB7g">
            </div>
            <div class="late">
                <img id="img" class="style-scope yt-img-shadow" alt="" width="9999" src="https://i.ytimg.com/vi/NfRNmE63jZ4/hq720.jpg?sqp=-oaymwEXCNAFEJQDSFryq4qpAwkIARUAAIhCGAE=&amp;rs=AOn4CLByFy5L0udX2HVNZVejpSfZlFIg8Q">
            </div>
        </div>
        <div class="lateTitle">
            <p>인기 영상들</p>
            <button class="seeMore">더 보기</button>
        </div>
        <div class="line"></div>
        <div class="latestVideos">
            <div class="late">
                <img id="img" class="style-scope yt-img-shadow" alt="" width="9999" src="https://i.ytimg.com/vi/5CVmMQuhPTI/hq720.jpg?sqp=-oaymwEXCNAFEJQDSFryq4qpAwkIARUAAIhCGAE=&amp;rs=AOn4CLCwaoeO0Fy5N0nDOZpa6SHUdC0nBw">
            </div>
            <div class="late">
                <img id="img" class="style-scope yt-img-shadow" alt="" width="9999" src="https://i.ytimg.com/vi/rod11dE9JaA/hqdefault.jpg?sqp=-oaymwEZCOADEI4CSFXyq4qpAwsIARUAAIhCGAFwAQ==&amp;rs=AOn4CLBN4JFXjzCgCXqiGsdGqZX0_ajqFg">
            </div>
            <div class="late">
                <img id="img" class="style-scope yt-img-shadow" alt="" width="360" src="https://i.ytimg.com/vi/dyRsYk0LyA8/hq720.jpg?sqp=-oaymwEZCOgCEMoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&amp;rs=AOn4CLAkPSRzOCBSqEwu26cTsPXgcnMJKg">
            </div>
            <div class="late">
                <img id="img" class="style-scope yt-img-shadow" alt="" width="360" src="https://i.ytimg.com/vi/ViuDsy7yb8M/hq720.jpg?sqp=-oaymwEZCOgCEMoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&amp;rs=AOn4CLDf3Ox2aWqpWL-bDAeEhgtNG5JvJg">
            </div>
        </div>
    </div>
    <!-- end mainPage -->
    
    <a href="">
    <div class="commuNews">
        <div class="todaysCommu">오늘의 커뮤니티</div>
        <div class="text">
            <p class="boardName">동물 게시판</p>
           <h4> 쿼카 졸귀탱이다 다음 생엔 꼭 쿼카로 태어나야지 </h4>
           <div class="content">
               <div class="inner-content">
               아 디자인 뭐할지 모르겠고요 반응형 어떻게 하는 지 모르겠고요 캐러맬색 고앵이 보고싶다 우리 집 근처 공원에서 트리플로 동상처럼 그루밍할 땐 언제고 왜 요즘 안나와 잉잉 ㅜㅜㅜㅜ고양이 짱 귀엽고요 그냥 귀엽고요 토끼도 귀엽고
               북극여우도 귀엽고 티벳여우도 귀엽고 햄스터도 귀엽고 라따뚜이 보고 싶다. 라따뚜이 그거 파스타인줄 알아ㅆ는데 그냥 채소절이ㅏ넢ㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅍㅇ러ㅣ러넌ㅇ러니러ㅣㄴ어ㅣㅏㅇ너린러ㅣㄴ어린어ㅣㄴ어닝러ㅣ너ㅣㄴ엉니ㅓㅣㅏ와 진짜 속상하고요 디자인 너무 구린데 어디서부터 손봐야 할지 모르겠구요 아이씨 그림그릴 줄안다고 디자인 잘하겠나아아ㅏ아디자인 배운적ㅇ 벗다공 ㄹ뇔ㄴㅇㄹㄴㄴㅇㄴㅇㄹ
            </div>
           </div>
        </div>
    </div>
</a>
<div class="emptyNav"></div>
<div class="creatorBanner">
    <!-- <p>크리에이터 신청하러 가기 </p> -->
    <img src="사진자료/ppl.png" alt="">
    <div class="creatorP">
        <div class="ctP">

            <p>uniz에서 유튜브 영상도 보고 나만의 게시판도 만들자!</p>
            <button>uniz 크리에이터 신청하러 가기</button>
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