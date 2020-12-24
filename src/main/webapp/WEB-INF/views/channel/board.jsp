<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/resources/css/Navbar.css">
    <link rel="stylesheet" href="/resources/css/channelMain.css">
    <link rel="stylesheet" href="/resources/css/channelBoard.css">
    
    <link rel="stylesheet" href="/resources/css/Footer.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/includes/nav.jsp"%>
	
	<div class="mainPage">
	
	
	<div class="leftSidebar">	
		<div class="fixed">
			<div class="SideHd">커뮤니티</div>
			<button id="channelPost" class="channelPost">채널 게시판</button>
			<button id="channelPost" class="categoryPost">카테고리별 게시판</button>
		</div>
	</div>
	
	<div class="comPage">
 <div class="FForm">
 
 
	
	<c:forEach items="${channel}" var="channel">
 <p class="channelPartp">커뮤니티 > 채널 게시판 > <c:out value="${channel.channelTitle}"/> 게시판  </p>
	<h1 class="boardHeader"><c:out value="${channel.channelTitle}"/></h1>
	</c:forEach>
	<div id ="board"></div>
	
	<div class="board"></div>
	<div></div>

	<h3 class="list">게시글 목록</h3>

	<div class="post">
	
	</div>
	
	<div class="chBoardBtn">
		<c:if test="${user.userSN ne null }" >
		<button id="createBtn" type="button">게시글 작성</button>
		<button id="listBtn" type="button">채널 게시판으로 이동</button>
		</c:if>
	</div>
	
	<div class="postFooter" id="postFooter">
	</div>
	
			</div>
			<!-- end FForm -->
	</div> <!-- comPage end -->
	

	</div>
	<!-- mainPage end  -->
	
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
<script type="text/javascript" src="/resources/js/channel.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	var channelTitle = '<c:out value="${channelTitle}"/>';
	
	var channelSN = '<c:out value="${channelSN}"/>';
	var board = $(".board");
	var post = $(".post");
	var postFooter = $("#postFooter");
	
	console.log( "channelTitle" + channelTitle);
	showList(1);
	
	function showList(page){
		
		console.log("show List " + page);
		
		channelService.getChannelPostList( { channelSN : channelSN ,page: page || 1 }, function(postCnt, list){
		
			console.log("postCnt= " + postCnt);
			
			if(page == -1 ){
				pageNum = Math.ceil(postCnt / 10.0);
				showList(pageNum);
				return;
			}
			
			var str = "";
			
			if(list == null || list.length == 0){

				str = "<table class='boardTable' style='table-layout: fixed;'>"
				str += "<thead><tr><th>글 번호</th><th>글 제목</th><th>작성자</th><th>작성 일</th></tr></thead>";
				
			}
			
					str = "<table class='boardTable' style='table-layout: fixed;'>"
					str += "<thead><tr><th>글 번호</th><th>글 제목</th><th>작성자</th><th>작성 일</th></tr></thead>"



				for ( var i = 0, len = list.length || 0; i < len; i ++){


						str += "<thead><tr>"
						str += "<td>"+list[i].rn + "</td>";
						str += "<td><a class='move' href='/channel/get/"+list[i].postSN+"'>"+list[i].title+"["+list[i].replyCnt+"]"+"</a></td>";
						str += "<td>"+list[i].nick + "</td>";
						str += "<td>"+channelService.displayTime(list[i].createDateTime) +"</td>";	
						str += "</tr></thead>"
						}
					str +="</table>"

				post.html(str);
				showPostPage(postCnt);
			});
			
		}
	
	var pageNum = 1;
	
	
	function showPostPage(postCnt){
		
		var endNum = Math.ceil(pageNum / 10.0) * 10 ;
		var startNum = endNum -9;
		
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 10 >= postCnt){
			endNum = Math.ceil(postCnt/10.0);
		}
		if(endNum * 10 < postCnt){
			next = true;
		}
		
		var str = "<ul>";
		
		if(prev){
			str += "<li><a href='"+(startNum -1) +"'>Previous</a></li>";
		}
		for ( var i = startNum; i <= endNum; i++){
			var active = pageNum == i ? "active":"";
			str += "<li "+active +"'><a href='"+i+"'>"+i+"</a></li>";
		}
		if(next){
			str += "<li><a href='"+ (endNum + 1) + "'>Next</a></li>";
		}
		str += "</ul>";
		
		
		postFooter.html(str);
	}
	
	postFooter.on("click", "li a", function(e){
		e.preventDefault();
		
		var targetPageNum = $(this).attr("href");
		
		pageNum = targetPageNum;
		showList(pageNum);
	});
	
	$("#listBtn").on("click", function(){
		self.location ="/channel/ch";
	});
	
	$("#createBtn").on("click",function(){
		self.location = "/channel/register/"+channelSN;
	});
	
	$(".channelPost").on("click", function(){
		self.location = "/channel/ch";
	});
	
	$(".categoryPost").on("click", function(){
		self.location = "/category/main";
	});
	
});
</script>
</body>
</html>
