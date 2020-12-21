<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/views/includes/nav.jsp"%>
	<div class="main">

        <div class="historyP">시청 기록</div>
		
        <div class="infiniteScroll">
        <div class="timeP">오늘</div>
        <c:forEach items="${VideoData}" var="list">
			<div class="timeVideo">
            <img src="${list.thumbUrl}" onclick="location.href='/video/${list.videoSN}/${list.lastPosition}'" alt="">
            <div class="timeVInfo">
                <span class="title">${list.title}
                </span>
                <span class="owner">${list.authorNick } </span>
                <p class="time"><i class="far fa-clock"></i> 본 시간: 어제 저녁 8시 반 </p>
   				 <span class="viewCnt"><i class="far fa-eye"></i> ${list.viewCnt}</span>
    			<div class="readMore">read more <i class="fas fa-arrow-right"></i></div>
            </div>
        </div>
		</c:forEach>
        </div>
        <!-- end infinite Scroll -->
    </div>
    
    	<%@ include file="/WEB-INF/views/includes/script.jsp"%>
    <script>
        (function(){
    	var num = 0;
    $(window).scroll(function(){
        // 조건식에서 == 보다 >= 를 사용 한 이유
        // == 스크롤 높이가 뭐빼기 뭐해서 같으면 끝까지 왔다라고 생각하는건데 >= 는 스크롤높이가 뭐빼기 뭐보다 더 커도(더 밑으로 내려가있어도) 끝까지 간거다 
        // 브라우저마다 특성이 다르기 때문에 같다보다는 크거나 같음으로 진행
        if($(window).scrollTop() >= $(document).height() - $(window).height()){ // 스크롤의 마지막 값을 인식한다.
            var $clone = $('.timeVideo').eq(num).first().clone()

            num++
            $('.infiniteScroll').append($clone)
            console.log(num);
        }
    })
	})();
    </script>
</body>
</html>