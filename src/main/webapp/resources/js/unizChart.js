function getList(param){
	console.log("실행");
	
	
	var str ="";
	var recvideo = $("#rec");
	let unizSN = param.unizSN;
	
	//ajax 호출
	$.ajax({
		
	
		type : 'get',
		url : "/chartVideoLsit/" + userSN,
		dataType : 'json',
		contentType : "application/json; charset=utf-8",
		success : function(data){
		
		//review #20201125 코드섞지않기.
	 	data = data || [];		
			
			
		//data.length를 5개씩 나눠서 보여주기;
			for (var i = 0 ; i < 8 ; i++) {
				
				str += "<div class='likeBox1'>";
				str += "<a href= '"+data[i].videoSN+"'><img src='"+data[i].thumbUrl+"'></a>";
				str += "<div class='likeTitle'><p>"+data[i].title+"</p></div>"
				str += "</div>";
				
			}
			
				
			recvideo.html(str);

		}
	})
	
}