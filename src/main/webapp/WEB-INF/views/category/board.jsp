<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/resources/css/Navbar.css">
    <link rel="stylesheet" href="/resources/css/categoryBoard.css">
    <link rel="stylesheet" href="/resources/css/Footer.css">
</head>
<body>
	
	<%@ include file="/WEB-INF/views/includes/nav.jsp"%>
	
	<div class="mainPage">
		<div class="leftSidebar">
            <div class="fixed">
                <div class="SideHd">커뮤니티</div>
                	<button id="channelPost" class="moveChannel">채널 게시판</button>
                	<button id="channelPost" class="moveCategory">카테고리별 게시판</button>
            </div>
        </div>
		
		<div class="comPage">
			<div class="FForm">
				<c:forEach items="${board}" var="board">
					<p class="channelPartp">커뮤니티 > <c:out value="${board.boardTitle}"/> </p>
				</c:forEach>
				<div class="channelPart">
					<div class="catHeader">
						<c:forEach items="${board}" var="board">
							<h1 class="boardHeader"><c:out value="${board.boardTitle}"/></h1>
						</c:forEach>
					</div> <!-- catHeader End -->
					<div class="BList">
						<h3>게시글 목록</h3>
					</div>
						<div id ="post">
						</div> <!-- 글 목록 끝 -->
				</div><!-- channelPart End -->
					<div class="btnBox2">
						<c:if test="${user.userSN ne null }" >
							<button class="createBtn" id="createBtn" type="button">게시글 작성</button>
						</c:if>
							<button class="createBtn" id="listBtn" type="button">메인으로 이동</button>
					</div> <!-- btnBox2 End -->
						<div class="postFooter" id="postFooter">
						</div>
			</div><!-- end FForm -->
		</div> <!-- comPage end -->
	</div> <!--  main end -->

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
<script type="text/javascript" src="/resources/js/category.js"></script>	
<script type="text/javascript">
	
	
$(document).ready(function(){
		
		var boardSN = ${boardSN}; 
		
		var post = $("#post");
		
		showList(1);
		
		
		function showList(page){
			
			console.log("show List " + page);
			
			categoryService.getBoardPostList( { boardSN : boardSN ,page: page || 1 }, function(postCnt, list){
			
				console.log("postCnt= " + postCnt);
				
				if(page == -1 ){
					pageNum = Math.ceil(postCnt / 10.0);
					showList(pageNum);
					return;
				}
				
				var str = "";
				
				if(list == null || list.length == 0){
					
					str  = "<table class='boardTable' style='table-layout: fixed;'>"
					str += "<thead><tr><th>글 번호</th><th>글 제목</th><th>작성자</th><th>작성일</th></tr></thead>";
					
				}
				
					str  = "<table class='boardTable' style='table-layout: fixed;'>"
					str += "<thead><tr><th>글 번호</th><th>글 제목</th><th>작성자</th><th>작성일</th><th>조회수</th></tr></thead>"
					
					for ( var i = 0, len = list.length || 0; i < len; i ++){
						
						str += "<thead><tr>"
						str += "<td>"+list[i].rn + "</td>";
						str += "<td><a class='move' href='/category/get/"+list[i].postSN+"'>"+list[i].title+"["+list[i].replyCnt+"]"+"</a></td>";
						str += "<td>"+list[i].nick + "</td>";
						str += "<td>"+categoryService.displayTime(list[i].createDateTime) +"</td>";	
						str += "<td>"+list[i].viewCnt+"</td></tr></thead>";
						
					}
						str +="</table>"
					
				post.html(str);
				showPostPage(postCnt);
				
			});
				
			}
		
		var pageNum = 1;
		
		var postFooter = $("#postFooter");
		
		function showPostPage(postCnt){
			
			var endNum = Math.ceil(pageNum / 10.0) * 10;
			var startNum = endNum -9;
			
			var prev = startNum != 1;
			var next = false;
			
			if(endNum * 10 >= postCnt){
				endNum = Math.ceil(postCnt/10.0);
			}
			if(endNum * 10 < postCnt){
				next = true;
			}
			
			var str = "<ul class='pagaination pull-right'>";
			
			if(prev){
				str += "<li class='page-item'><a class='page-link' href='"+(startNum -1) +"'>Previous</a></li>";
			}
			for ( var i = startNum; i <= endNum; i++){
				var active = pageNum == i ? "active":"";
				str += "<li class='page-item "+active +" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
			}
			if(next){
				str += "<li class='page-item'><a class='page-link' href='"+ (endNum + 1) + "'>Next</a></li>";
			}
			str += "</ul></div>";
			
			postFooter.html(str);
		}
		
		postFooter.on("click", "li a", function(e){
			e.preventDefault();
			
			var targetPageNum = $(this).attr("href");
			
			pageNum = targetPageNum;
			showList(pageNum);
		});
		
		
		$(".moveCategory").on("click",function(){
			self.location = "/category/main";
		});
		
		$(".moveChannel").on("click", function(){
			self.location = "/channel/ch";
		});
		
		
		$("#listBtn").on("click", function(){
			self.location ="/category/main";
		});
		
		$("#createBtn").on("click",function(){
			self.location = "/category/register/"+boardSN;
		});
		
});
	
</script>
</body>
</html>