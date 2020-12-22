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
	
	<input type="hidden" id="sessionUserSN" value="${user.userSN}">
<div class="mainPage">	

    	<div class="leftSidebar">	
			<div class="fixed">
				<div class="SideHd">커뮤니티</div>
				<button id="channelPost" class="boardPost">카테고리별 게시판</button>
                <button id="channelPost" class="createChannel">채널 게시판 신청</button>
                <button id="channelPost" class="registerCreator">크리에이터 등록</button>
			</div>
		</div>
		
	<div class="comPage">
		<p class="channelPartp">커뮤니티 > 채널 게시판 </p>
			<div class="channelPart">

		        <div class="catHeader">
		        <h1> 채널 게시판 </h1>
		    	</div>
				
				<div class="BList">
        			<h3>채널 목록</h3>
				</div>
				
        		<div class="boardList"> <!-- 채널 목록 보여주는 div -->
        		
        		</div>
        		
        	</div> <!-- channelPart end -->
        
     <div class="AAList">
     
		<div class="AList">
      	  <h3>전체 게시글 목록</h3>
		</div> 	
        

        <div class="postFooter">
        </div>
    
    
			</div> <!-- AAList end -->
    	</div> <!-- comPage end -->
    </div><!-- main end -->	
    <div class="footer"></div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/channel.js"></script>
<script type="text/javascript" src="/resources/js/channelPaging.js"></script>
<script>

$(document).ready(function(){
		
		var sessionSN = $("#sessionUserSN").val();
		
		console.log("sessionSN : " + sessionSN);
		
		$(".boardPost").click(function(){
			self.location="../category/main";
		})
		
		$(".registerCreator").click(function(){
			
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
					window.location.href="../creator/get?userSN=" +sessionSN;
				} else if(data.CHECKAPPLY == 0){
					window.location.href="../creator/apply";
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
				data : $("#sessionUserSN").val(),
				contentType : "application/json; charset=UTF-8",
				dataType : 'json',
				success : function(data){
					const CONFIRM = 1;
					const USERTYPE = 1;
					
					if(CONFIRM == data.CONFIRM){
						alert("이미 개설한 게시판이 있습니다.");
						window.location.href="/channel/ch";
					}
					else if(USERTYPE == data.USERTYPE){
						alert("크리에이터만 게시판을 개설 할 수 있습니다." +'\n' + "크리에이터 등록을 먼저 해주시길 바랍니다.");
						window.location.href="/channel/ch";
					}
					
				}
			});
		});
	
});

</script>
</body>
</html>