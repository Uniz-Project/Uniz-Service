<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	<link rel="stylesheet" href="../resources/css/categoryRegister.css">
	 <link rel="stylesheet" href="../resources/css/creatorApply2.css"> 
	<link rel="stylesheet" href="/resources/css/Navbar.css"> 
	<link rel="stylesheet" href="/resources/css/Footer.css"> 
	
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
			<div class="creatorRegisterHeader">
				<h1>크리에이터 등록 페이지</h1>
			</div>
				<div class="createForm">
					<form class="form"role="form" action="/creator/apply" method="post" onsubmit="return checkValid();" >

						
					<div class="RegisterForm">
						
							<label class="label">(운영하는)채널 이름</label>
							<input class="form-control" name='channelTitle' id='channelTitle' placeholder="channelName">
				
							<label class="label">닉네임  <a class="nickLink" href="#" onclick="location.href='/user/modify'">[닉네임 변경하러 가기]</a></label>
							<input class="form-control" name='nick' id='nick' value="${user.nick}" placeholder="nick" readonly="readonly">
							<input class="form-control" type="hidden" name='userSN' id='userSN' value="${user.userSN}" placeholder="userSN">

						
						<div class="CateList">
							<label class="label catList">(운영 채널 주)카테고리 목록</label>
							<select name='category' id='category'>
								<option value='영화/애니메이션'>영화/애니메이션</option>
								<option value='자동차/교통'>자동차/교통</option>
								<option value='음악'>음악</option>
								<option value='애완동물/동물'>애완동물/동물</option>
								<option value='스포츠'>스포츠</option>
								<option value='여행/이벤트'>여행/이벤트</option>
								<option value='게임'>게임</option>
								<option value='인물/블로그'>인물/블로그</option>
								<option value='코미디'>코미디</option>
								<option value='엔터테인먼트'>엔터테인먼트</option>
								<option value='뉴스/정치'>뉴스/정치</option>
								<option value='노하우/스타일'>노하우/스타일</option>
								<option value='교육'>교육</option>
								<option value='과학기술'>과학기술</option>
								<option value='비영리/사회운동'>비영리/사회운동</option>
							</select>
						</div>
						
						<div class="emailForm">
							<label class="label" for="">[연락 받을 이메일 주소를 입력하세요] </label>
							
							<!-- <input  class="form-control" name='email' value=''> -->
							<input class="form-control" id="email" name='email' value='' placeholder="ex) aaaa@aaaa.com">
						</div>
						
						
						<div class="uploadResult">
							<ul>
							</ul>
							
						</div>
						
						<label class="label label5">[본인 유튜브 스튜디오 메인 페이지 캡쳐 이미지 업로드 해주세요]</label>						
		   				
		   				<div class="uploadFileBox"> 
							<label for="uploadFile">파일 선택하기</label> 
							<div class="ChseBtn">
								<input type='file' name='uploadFile'id="uploadFile" multiple >
							</div>
						</div>
						
						<div class="applyBtnBox">
						<!-- <button type="submit" >등록 신청하기</button> -->
						<button class="submitBtn" type="submit" >등록 신청하기</button>
						<!-- <button type="reset" class="btn btn-default">전체 지우기</button> -->
 						<button class="delBtn" type="reset" >전체 지우기</button>
						</div>
					</div>
				</form>
		</div>
 	</div>
	
</div>
	<!-- end mainPage -->
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
<script>

$(document).ready(function(e){
	
	var formObj = $("form[role='form']");
	
	$("button[type='submit']").on("click", function(e){
		
		e.preventDefault();
		
		console.log("submit clicked");
		
		var str = "";
	
	$(".uploadResult ul li").each(function(i, obj){
		
		var jobj = $(obj);
		console.dir(jobj);
		
		str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
		str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
		str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
		str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
		
	});
		
		console.log("str : " + str);
		formObj.append(str).submit();
		
		
	});
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880;
	
	function checkExtension(fileName, fileSize){
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	function showUploadResult(uploadResultArr){
		
		if(!uploadResultArr || uploadResultArr.length == 0){return;}
		
		var uploadUL = $(".uploadResult ul");
		
		var str = "";
		
		$(uploadResultArr).each(function (i, obj){
			
	        if(obj.image){
	        	var fileCallPath = encodeURIComponent( obj.uploadPath + "/s_"+
	        			obj.uuid + "_" + obj.fileName);
	        	str += "<li data-path='"+obj.uploadPath+"'";
	        	str += "data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"'data-type='"+obj.image+"'"		
	        	str += "><div>";
	        	str += "<span>" + obj.fileName + "</span>";
	        	str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'> <i class='fa fa-times'></i></button><br>";
	        	str += "<img src='/apDisplay?fileName="+fileCallPath+"'>";
	        	str += "</div>";
	        	str += "</li>";
	        }else {
	        	var fileCallPath = encodeURIComponent( obj.uploadPath +"/"+
	        			obj.uuid + "_" + obj.fileName);
	        	var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
	        	
	        	str += "<li data-path'"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"'data-type='"+obj.image+"'><div>";
	        	str += "<span>" + obj.fileName + "</span>";
	        	str += "<button type='button' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
	        	str += "<img src='/resources/img/attach.png'></a>";
	        	str += "</div>";
	        	str += "</li>";
	        }
			
		});
		
		uploadUL.append(str);
		
	}
	
	$("input[type='file']").change(function(e){

		var formData = new FormData();
		
		var inputFile = $("input[name='uploadFile']");
		
		var files = inputFile[0].files;
		
		console.log(files);
		
		for(var i = 0; i < files.length; i++){
				
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			formData.append("uploadFile", files[i]);
			console.log("formData : " + formData);
		}
	    
	    $.ajax({
	    	url : '/apUploadAjaxAction',
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			dataType : 'json' ,
			success : function(result){
				console.log(result);
			    showUploadResult(result); //업로드 결과 처리 함수 
	     }
	 }); //$.ajax
	    
 });  
});

$(".uploadResult").on("click", "button" , function(e){
	
	console.log("delete file");
	
	var targetFile = $(this).data("file");
	var type = $(this).data("type");
	
	var targetLi = $(this).closest("li");
	
	$.ajax({
		
		url: '/apDeleteFile',
		data: {fileName: targetFile, type: type},
		dataType: 'text',
		type: 'POST',
			success: function(result){
				
				targetLi.remove();
			}
		
	});
	
});



function checkValid(){


	var eamilCheck = document.getElementById('email');
	var fileCheck = document.getElementById('file');
	var blank_pattern = /^\s+|\s+$/g;

		if(eamilCheck.value == '' || eamilCheck.value == null || eamilCheck.value.replace(blank_pattern, '').length == 0){
			alert("이메일을 입력하세요");
			return false;
		}
		
		if(fileCheck.value == '' || fileCheck.value == null){
			alert("이미지 파일을 첨부 해주세요");
			return false;
		}

}

</script>
</body>
</html>