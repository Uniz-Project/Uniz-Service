<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
 	<link rel="stylesheet" href="/resources/css/Navbar.css">
    <link rel="stylesheet" href="/resources/css/register.css">
</head>
<style>


</style>
<body>
    
    <%@ include file="/WEB-INF/views/includes/nav.jsp"%>
    
	<!-- end navbar -->
	<div class="emptyNav"></div>

    <div class="applyMain">
		<div class="creatorRegisterHeader">
				<h1>글 쓰기</h1>
		</div>
			<div class="createForm">
				<form  class="form" role="form" action="/category/register" method="post" onsubmit="return checkTitle()">
					<div class="RegisterForm">
						<label class="label">제목</label>
						<input class="form-control" name='title' id='title'>
						<label class="label textarea">내용</label>
						<textarea class="form-control" rows="3" name='postContent'></textarea>
							<input type='hidden'class="form-control" name='userSN' value='${user.userSN}'>
							<input type="hidden" class="form-control" name='boardSN' value="${boardSN}">
					
						<label class="label"></label>
					<!-- 파일 업로드 한거 썸네일로 보여주는 곳. x 버튼 누르면 사진 삭제 됌-->
					<div class="thumbNail">
						<ul>
						
						</ul>
				   </div>

				   <label for=""class="label"></label>
				   
				   <div class="uploadFileBox"> 
					   <!-- 파일 업로드 하는 곳-->
					<label for="uploadFile">파일 선택하기</label> 
						<div class="ChseBtn">
						<input type='file' name='uploadFile'
						id="uploadFile" 
						multiple >
						</div>
					</div>

					<div class="applyBtnBox">
						<button type="submit" class="submitBtn">작성완료</button>
						<button type="reset" class="submitBtn">전체 지우기</button>
					</div>
					</div>
				</div>
			</div> 
	</div>
</form>
</div>
</div>
<div class="footer">

</div>
					
  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/category.js"></script>
<script>
	
	$(document).ready(function(e){
		
		var formObj = $("form[role='form']");
		
		$("button[type='submit']").on("click", function(e){
			
			e.preventDefault();
			
			console.log("submit clicked");
			
			var str = "";
		
		$(".thumbNail ul li").each(function(i, obj){
			
			var jobj = $(obj);
			console.dir(jobj);
			
			str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
			
		});
		
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
			
			var uploadUL = $(".thumbNail ul");
			
			var str = "";
			
			$(uploadResultArr).each(function (i, obj){
				
		        if(obj.image){
		        	var fileCallPath = encodeURIComponent( obj.uploadPath + "/s_"+
		        			obj.uuid + "_" + obj.fileName);
		        	str += "<li data-path='"+obj.uploadPath+"'";
		        	str += "data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"'data-type='"+obj.image+"'"		
		        	str += "><div>";
		        	str += "<span>" + obj.fileName + "</span>";
		        	str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'> x <i class='fa fa-times'></i></button><br>";
		        	str += "<img src='/display?fileName="+fileCallPath+"'>";
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
		    	url : '/uploadAjaxAction',
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
	
	$(".thumbNail").on("click", "button" , function(e){
		
		console.log("delete file");
		
		var targetFile = $(this).data("file");
		var type = $(this).data("type");
		
		var targetLi = $(this).closest("li");
		
		$.ajax({
			
			url: '/deleteFile',
			data: {fileName: targetFile, type: type},
			dataType: 'text',
			type: 'POST',
				success: function(result){
					
					targetLi.remove();
				}
			
		});
		
	});
	


function checkTitle(){
	
	
	var str = document.getElementById('title');
	var blank_pattern = /^\s+|\s+$/g;
	
	if(str.value == '' || str.value == null || str.value.replace(blank_pattern, '').length == 0){
		alert("제목을 입력하세요");
		return false;
	}
	
}

</script>	
</body>
</html>