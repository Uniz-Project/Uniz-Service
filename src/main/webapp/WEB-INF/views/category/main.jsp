<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/Navbar.css">
    <link rel="stylesheet" href="/resources/css/main.css">
</head>
<body>

<%@ include file="/WEB-INF/views/includes/nav.jsp"%>


<div class="mainPage">
	
	<div class="leftSidebar">	
		<div class="fixed">
			<div class="SideHd">커뮤니티</div>
			<button id="channelPost">채널 게시판으로 이동</button>
			<button id="channelPost">카테고리별 게시판</button>
		</div>
	</div>
	
<div class="comPage">
	<p class="channelPartp">커뮤니티 > 카테고리별 게시판</p>
		<div class="channelPart">
			<div class="catHeader">
				<h1>카테고리 별 게시판</h1>
			</div>
	
			<div class="BList">
				<h3>게시판 목록</h3>
			</div>
		
			<div class = "boardList">
			</div>
		
		</div> <!-- channelPart end -->
		
	<div class="AAList">
	
		<div class="AList">
			 <h3>전체 게시글 목록</h3>
			
		</div>
		
		<div class= "postFooter">
		</div>
		
	</div> <!--  AAList end -->		
			
	</div> <!-- comPage end -->

</div>	<!-- main end -->
	<div class="footer"></div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/category.js"></script>	
<script type="text/javascript">

	$(document).ready(function(){
		
		categoryService.getBoardList();
		showList(1);
		
		var allPostList = $(".AList");
		
		function showList(page){
			
			console.log("show List " + page);
			
			categoryService.getAllPost( {page: page || 1 }, function(postCnt, list){
			
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
				
				str += "<table><thead><tr><th>게시판 이름</th><th>글 제목</th><th>작성자</th><th>작성 일</th></tr></thead>"
					for (var i = 0, len = list.length || 0; i < len; i++){
						
						str += "<thead><tr>";
						str += "<td>"+list[i].boardComment + "</td>";
						str += "<td><a  href='/category/get/"+list[i].postSN+"'>"+list[i].title+"["+list[i].replyCnt+"]"+"</a></td>";
						str += "<td>"+list[i].nick + "</td>";
						str += "<td>"+categoryService.displayTime(list[i].createDateTime) +"</td>";
						str += "</tr></thead>";
						
				}	
				
				str += "</table>";
				
				allPostList.html(str);
				showPostPage(postCnt);
			});
				
			}
		
		var pageNum = 1;
		
		var postFooter = $(".postFooter");
		
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
			
			var str = "<ul class=''>";
			
			if(prev){
				str += "<li class='page-item'><a class='borderR' href='"+(startNum -1) +"'>Previous</a></li>";
			}
			for ( var i = startNum; i <= endNum; i++){
				var active = pageNum == i ? "active":"";
				str += "<li class='page-item "+active +" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
			}
			if(next){
				str += "<li><a class='borderR2' href='"+ (endNum + 1) + "'>Next</a></li>";
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
	});
	
	$("#channelPost").on("click", function(e){
		self.location = "/channel/ch";
	});

</script>
</body>
</html>