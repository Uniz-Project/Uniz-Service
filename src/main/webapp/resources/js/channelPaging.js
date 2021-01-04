$(document).ready(function(){
		
	var allPostList = $(".AList");
	
	var channelList = $(".boardList");
	
	showList(1);
	
	
	function showList(page){
		
	console.log("show List " + page);
	

	/*channelService.getChannelList( {page: page || 1} , function(channelCnt, list){
		console.log("channelCnt= " + channelCnt);
		
		if(page == -1 ){
			pageNum = Math.ceil(postCnt / 10.0);
			showList(pageNum);
			return;
		}
	
		showChannelPage(channelCnt);
		
	});*/

	
	channelService.getAllPost( {page: page || 1 }, function(postCnt, list){
	
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
		
		str += "<table><thead><tr><th>채널명</th><th>글 제목</th><th>작성자</th><th>작성 일</th><th>조회수</th></tr></thead>";

		for (var i = 0, len = list.length || 0; i < len; i++){
			
			str += "<thead><tr>";
			str += "<td><a href='/channel/board/"+list[i].channelSN+"'>"+list[i].channelTitle + "</a></td>";
			str += "<td><a  href='/channel/get/"+list[i].postSN+"'>"+list[i].title+"["+list[i].replyCnt+"]"+"</a></td>";
			str += "<td>"+list[i].nick + "</td>";
			str += "<td>"+channelService.displayTime(list[i].createDateTime) +"</td>";
			str += "<td>"+list[i].viewCnt + "</td>";
			str += "</tr></thead>";
		}
			str += "</table>";
		
		allPostList.html(str);
		showPostPage(postCnt);
	});
		
	}
	
	var pageNum = 1;
	
	var postFooter = $(".postFooter");
	
	var channelFooter = $(".channelFooter");
	
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
		
		var str =	"<ul class=''>";
		
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
	
	channelFooter.on("click", "li a", function(e){
		e.preventDefault();
		
		var targetPageNum = $(this).attr("href");
		
		pageNum = targetPageNum;
		showList(pageNum);
	});
	
	
	$("#boardPost").on("click",function(){
		self.location = "/category/main";
	});
	$(".createChannel").on("click" , function(){
		self.location = "/channel/chcreate";
	});
	
	$("#registerCreator").on("click", function(){
		self.location = "/creator/apply";
	});
	
});