<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/Navbar.css">
    <link rel="stylesheet" href="/resources/css/channelMain.css">
        <link rel="stylesheet" href="/resources/css/Footer.css">
    
</head>
<style>
.mySlides {display:none;}
</style>
<body>

	<%@ include file="/WEB-INF/views/includes/nav.jsp"%>
	
	<input type="hidden" id="sessionUserSN" value="${user.userSN}">
	
<div class="mainPage">	

    	<div class="leftSidebar">	
			<div class="fixed">
				<div class="SideHd">커뮤니티</div>
				<button id="channelPost" class="boardPost">카테고리별 게시판</button>
                <button id="channelPost" class="createChannel">채널 게시판 신청</button>
			</div>
		</div>
		
		<div class="comPage">
	   		<div class="FForm">
				<div class="banner">
					<a href="/channel/ch"><img class="mySlides" src="\resources\img\banner.png"></a>
					<a href="/category/main"><img class="mySlides" src="\resources\img\banner2.png"></a>
					<a href="/dataChart"><img class="mySlides" src="\resources\img\banner3.png"></a>
					<a href="/UnizHit/UnizHit"><img class="mySlides" src="\resources\img\banner4.png"></a>
				</div>

			<div class="channelPart">
					<div class="fork">			
						<div class="mix">
		        
							<div class="BList">
        						<h3>채널 목록</h3>
							</div>
				
        					<div class="boardList"> <!-- 채널 목록 보여주는 div -->
        		
        						<c:forEach items="${list}" var="channel">
	        						<ul>
	        							<li data-channelsn='"${channel.channelSN}"'>
	        								<a href="/channel/board/<c:out value='${channel.channelSN}'/>">
	        									<i class="fab fa-youtube"></i>
	        									<strong><c:out value="${channel.channelTitle}"/></strong>
	        									<strong><c:out value="${channel.nick}"/></strong>
	        								</a>
	        							</li>
    	    						</ul>
    	    					</c:forEach> 
        					</div>
        				</div>
        <!-- end mix -->	
        
        				<div class="channelFooter">
        					<ul class=''>
        						<c:if test="${pageMaker.prev}">
        							<li class='page-item'>
        								<a class='borderR' href="${pageMaker.startPage -1}"><<</a>
        							</li>
        						</c:if>
        							<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
        								<li class="page ${pageMaker.cri.pageNum == num ? " active":""}">
        									<a class='page-link' href="${num}">${num}</a>
        								</li>
        							</c:forEach>
        						<c:if test="${pageMaker.next}">
        							<li>
        								<a class='borderR2' href="${pageMaker.endPage +1 }">>></a>
        							</li>
        						</c:if>
        					</ul>  
        				</div>
       				</div>
       	
       	<!-- fork end  -->
        		<div class="fork2">
        			<div class='search'>
        				<p>채널 / 크리에이터 검색</p>
        					<form id="searchForm" action="/channel/ch" method="get">
        						<select id="type" name='type'>
		        					<option value=""
		        					<c:out value="${pageMaker.cri.type == null ? 'selected':'' }"/>>--</option>
		        					<option value="T"
		        					<c:out value="${pageMaker.cri.type eq 'T' ? 'selected':'' }"/>>채널 이름</option>
		        					<option value="N"
		        					<c:out value="${pageMaker.cri.type eq 'N' ? 'selected':'' }"/>>크리에이터</option>
        						</select>
			        				<input class="input" type='text' name="keyword"/>
			        				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
			        				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
			        				<button class="btn">검색</button>
        					</form>
        			</div>
			        		<form id='actionForm' action="/channel/ch" method='get'>
								<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
								<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
								<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>
								<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
							</form>
				
					<div class="applyBtn">
								<p>크리에이터 등록</p>
						<button class="applyButton">
							<img class="image" src="\resources\img\3186535.jpg">
							<div class="middle">
								<div class="text">크리에이터 등록</div>
							</div>
						</button>
					</div>
				</div><!-- end fork  -->
			</div> <!-- channelPart end -->
        
			    <div class="AAList">
					<div class="AList">
			      	  <h3>전체 게시글 목록</h3>
					</div> 
				</div> <!-- AAList end -->
				
			</div><!-- end FForm -->
	  	
	  			<div class="postFooter">
        		</div> 
	
    	</div> <!-- comPage end -->
    </div><!-- main end -->	
    
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
<script type="text/javascript" src="/resources/js/channelPaging.js"></script>
<script>
var myIndex = 0;
carousel();
function carousel(){
	var i;
	var x = document.getElementsByClassName("mySlides");
	for (i = 0; i < x.length; i++) {
	    x[i].style.display = "none";  
	  }
	  myIndex++;
	  if (myIndex > x.length) {myIndex = 1}    
	  x[myIndex-1].style.display = "block";  
	  setTimeout(carousel, 2000); // Change image every 2 seconds
}
</script>
<script>
$(document).ready(function(){
		
		var sessionSN = $("#sessionUserSN").val();
		
		console.log("sessionSN : " + sessionSN);
		
		
		
		$(".applyButton").click(function(){
			
			if( sessionSN == '' || sessionSN == null ){
				alert("로그인이 필요합니다.");
				window.location.href="/user/loginForm";
			}
	
		 	$.ajax({
			
			type : 'POST',
			url : '/creator/checkApply',
			data : sessionSN,
			contentType : "application/json; charset=UTF-8",
			dataType : "json",
			success: function(data){
				const CHECKAPPLY = 1;
				const USERTYPE = 2;
			
				if(USERTYPE == data.USERTYPE){
					alert("이미 크리에이터로 등록 되어있습니다.");
					window.location.href="/channel/ch";
				}
				else if(CHECKAPPLY == data.CHECKAPPLY){
					alert("이미 크리에이터 등록을 하셨습니다.");
					window.location.href="/user/info";
				}else{
					
				self.location="/creator/apply";
				}
				
			}
		}); 
		
	});
		
		$(".createChannel").click(function(){
			
			if( sessionSN == '' || sessionSN == null ){
				alert("로그인이 필요합니다.");
				window.location.href="/user/loginForm";
			}
			
			$.ajax({
				type: 'POST',
				url : '/channel/checkChannelCreate',
				data : sessionSN,
				contentType : "application/json; charset=UTF-8",
				dataType : 'json',
				success : function(data){
					const CONFIRM = 1;
					const USERTYPE = 1;
					
					if(CONFIRM == data.CONFIRM){
						alert("이미 개설한 게시판이 있습니다.");
						window.location.href="/channel/ch";
						return false;
					}
					else if(USERTYPE == data.USERTYPE){
						alert("크리에이터만 게시판을 개설 할 수 있습니다." +'\n' + "크리에이터 등록을 먼저 해주시길 바랍니다.");
						self.location="/channel/ch";
						return false;
					}
					
				}
			});
		});
		
		$(".test").on( "click" , function(){
			self.location = "/channel/ch";
		});
		
		$(".boardPost").on("click", function(){
			self.location = "/category/main";
		});
		
	var searchForm = $("#searchForm");
		
	$("#searchForm button").on("click", function(e){
		
		if(!searchForm.find("option:selected").val()){
			alert("검색 종류를 선택하세요");
			return false;
		}
		if(!searchForm.find("input[name='keyword']").val()){
			alert("키워드를 입력하세요");
			return false;
		}
		
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();
		
		searchForm.submit();
	});
	
	var actionForm = $("#actionForm");
	
	$(".page a").on("click", function(e){
		e.preventDefault();
		console.log("click");
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
		
});
</script>
</body>
</html>