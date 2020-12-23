<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="/resources/css/Navbar.css">
<link rel="stylesheet" href="/resources/css/hitVideo.css">
<link rel="stylesheet" href="/resources/css/footer.css">
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

		
			<!--리스트 5개 반복되는 구조 -->
			<div class='container' id="hit"></div>
						
			<!--end -->

    </div>
</div>
	



	<script src="/resources/js/unizHit.js"></script>
	<script src="/resources/js/unizAjax.js"></script>

<script>
		$(document).ready(function() {
			
			
			getListAll();
			

		});
		
</script>
	
<script type="text/javascript">
$(document).ready(function() {
	
	let UnizHitMenuNum = 4;

	setUnitagsByPreset(UnizHitMenuNum, 12);
	
	function setUnitagsByPreset(menu, limit) {
		unizService.getPreset(
				{menu : menu},
				function(result) {
					let keys = [];
					let tagsHTML = "";
					let unizSN = [];

					//tagsHTML += "<p><button id='tag' name='unitags' value='야구'>야구</button></p>"
/* 					tagsHTML += "<button class='keyword' id='tag"+ 0 +"' name='unitags' data-unizsn='"+uniz.unizSN+"' value='" + uniz.unizKeyword + "'>"  + uniz.unizKeyword + "</button>" */
					for(let idx = 0 ; idx<limit ; idx++) {
						let uniz = result[idx];
			
						tagsHTML += "<button class='keyword' id='tag"+ idx +"' name='unitags' data-unizsn='"+uniz.unizSN+"' value='" + uniz.unizKeyword + "'>"  + uniz.unizKeyword + "</button>"
						keys.push(uniz.unizKeyword);
						unizSN.push(uniz.unizSN);
						
					}

					$("#unitags").html(tagsHTML);

					$("button[name='unitags']").each(function(i){
						$(this).on("click",function(e){
							
							let unizsn = $(this).data("unizsn");
							
							e.preventDefault();
							$("#keyword").val($(this).val());
							
							//console.log("unizSN=====" + unizsn)
					
							
		getList({unizSN:unizsn});
							
						})
					});
				}
			);
	}
	
});

</script>

 <script>
var btns = document.getElementsByClassName("keyword");
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function() {
  var current = document.getElementsByClassName("active");
  current[0].className = current[0].className.replace(" active", "");
  this.className += " active";
  });
}
    </script>
	
</body>
</html>

