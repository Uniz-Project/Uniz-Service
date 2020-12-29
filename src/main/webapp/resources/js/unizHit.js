function getList(param ){
	console.log("실행");
	
	
	var str ="";
	var hitdiv = $("#hit");
	let unizSN = param.unizSN;
	
	//ajax 호출
	$.ajax({
		
	
		type : 'get',
		url : "/UnizHit/keywordHitlist/" + unizSN,
		dataType : 'json',
		contentType : "application/json; charset=utf-8",
		success : function(data){
		
		//review #20201125 코드섞지않기.
	 	data = data || [];		
			
			
		//data.length를 5개씩 나눠서 보여주기;
			for (var i = 0 ; i < data.length ; i++) {
				
				str += "<div class='item'>";
				str += "<a href= '"+data[i].videoSN+"'><img src='"+data[i].thumbUrl+"'></a>";
				str += "<figcaption style='height: 50px;'>"+data[i].title+"</figcaption>";
				str += "</div>";
				
			}
			
				
			hitdiv.html(str);

		}
	})
	
}

function getListAll(){
	console.log("실행");
	
	
	var str ="";
	var hitdiv = $("#hit");
	
	
	//ajax 호출
	$.ajax({
		
	
		type : 'get',
		url : "/UnizHit/Hitlist",
		dataType : 'json',
		contentType : "application/json; charset=utf-8",
		success : function(data){
		
		//review #20201125 코드섞지않기.
	 	data = data || [];		
			
			
		//data.length를 5개씩 나눠서 보여주기;
				
			for (var i = 0  ; i < data.length ; i++) {
				str += "<div class='item'>";
				str += "<a href= '"+data[i].videoSN+"'><img src='"+data[i].thumbUrl+"'></a>";
				str += "<figcaption style='height: 50px;'>"+data[i].title+"</figcaption>";
				str += "</div>";
				
				
				
			}
			
			hitdiv.html(str);

		}
	})
	
}



