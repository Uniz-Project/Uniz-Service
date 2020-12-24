<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="/resources/css/Navbar.css">
<link rel="stylesheet" href="/resources/css/hitVideo.css">
<link rel="stylesheet" href="/resources/css/Footer.css">
</head>
<body>
<%@ include file="/WEB-INF/views/includes/nav.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

        
        <div class="Pbanner">
            <!-- <img src="사진자료/3186535.jpg" alt=""> -->
            <!-- <img src="사진자료/party2.jpg" alt=""> -->

            <img src="https://media2.giphy.com/media/vd7RtrKYy1Y1W/giphy.gif?cid=ecf05e4788d5b0f703291fffade39c8b6f1029e1ea5ed692&amp;rid=giphy.gif" alt="dance party dancing GIF" style="width: 100%; height: 100%; left: 0px; top: 0px; opacity: 1;">
        </div>
	<div class="main">
    
		<div class="keywordBox" id="unitags"></div>
		
	<div class="box">
		<h3>검색 결과</h3>
		
			<!--리스트 5개 반복되는 구조 -->
			<div class='container' id="hit">
				<c:forEach items="${VideoData}" var="list" >
					<div class='item'>
						<a href='/video/${list.videoSN}'><img src='${list.thumbUrl}'></a>
					</div>
				</c:forEach>
			</div>
						
			<!--end -->

    </div>
    
    <%@ include file="/WEB-INF/views/includes/footer.jsp"%>	
    

</div>
</body>
</html>