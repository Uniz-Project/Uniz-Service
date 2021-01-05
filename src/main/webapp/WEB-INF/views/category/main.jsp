<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/Navbar.css">
    <link rel="stylesheet" href="/resources/css/categoryMain.css">
    <link rel="stylesheet" href="/resources/css/Footer.css">
    <link rel=“preconnect” href=“https://fonts.gstatic.com”>
    <link href=“https://fonts.googleapis.com/css2?family=K2D&family=Lato&display=swap” rel=“stylesheet”>
</head>
<body>

<%@ include file="/WEB-INF/views/includes/nav.jsp"%>

<!-- 여기가 카테고리 게시판 메인!!!!! -->


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
			<p class="channelPartp">커뮤니티 > 카테고리별 게시판</p>
				<div class="catHeader">
					<h1>카테고리 별 게시판</h1>
				</div>
		 		
		 		<div class="BList">
					<h3>게시판 목록</h3>
				</div> 
			
				<div class="boardList">
				</div>
 				
 				<div class="AAList">
			 		<h3 class="h3">최신글</h3>
						<div class="AList">
						</div> 
				</div> 	<!-- AAList -->
				<div class="postFooter">
				</div>
		</div><!-- end FForm -->
	</div> <!-- comPage end -->
</div>	<!-- main end -->

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
					str += "<thead><tr><th>글 번호</th><th>글 제목</th><th>작성자</th><th>작성일</th></tr></thead>";
				}
				
				str += "<table><thead><tr><th>게시판 이름</th><th>글 제목</th><th>작성자</th><th>작성일</th><th>조회수</th></tr></thead>"
					for (var i = 0, len = list.length || 0; i < len; i++){
						
						str += "<thead><tr>";
						str += "<td><a href='/category/board/"+list[i].boardSN+"'>"+list[i].boardTitle + "</td>";
						str += "<td><a  href='/category/get/"+list[i].postSN+"'>"+list[i].title+"["+list[i].replyCnt+"]"+"</a></td>";
						str += "<td>"+list[i].nick + "</td>";
						str += "<td>"+categoryService.displayTime(list[i].createDateTime) +"</td>";
						str += "<td>" + list[i].viewCnt + "</td>";
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
	
	$(".moveChannel").on("click", function(e){
		self.location = "/channel/ch";
	});

	$(".moveCategory").on("click", function(e){
		self.location = "/category/main";
	});
	
</script>
</body>
</html>