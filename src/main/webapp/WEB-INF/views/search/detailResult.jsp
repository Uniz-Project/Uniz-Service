<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Uniz-검색결과</title>
<link rel="stylesheet" href="/resources/css/Navbar.css">
<link rel="stylesheet" href="/resources/css/Footer.css">
<link rel="stylesheet" href="/resources/css/searchResult.css">
<style>
	.result{
		background-color : white;
	}
	.result p{
		font-size:20px;
		padding : 10px 200px;
		font-weight: bold;
	}
	/* 여기여기 새로 추가한 부분입니다.   */
	.result p:first-child{ margin-top: 20px; padding: 0 200px;}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/includes/nav.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

     <div class="banner">
        
         <!--  여기여기    영상이 바뀌었습니다. 이거 그대로 복붙하시면 됩니다. --> 
      <div class="mySlides">
            <video  class="sea"muted autoplay loop>
                <source src="/resources/img/Pexels Videos 2466571.mp4" type="video/mp4">
                    <strong>Your browser does not support the video tag.</strong>
                </video>
            </div>
        
        
         <div class="mySlides">
            <video  class="forest" muted autoplay loop>
                <source src="/resources/img/Game - 34993.mp4" type="video/mp4">
                <strong>Your browser does not support the video tag.</strong>
              </video>
         </div>
         <div class="mySlides">
            <video class="tower"muted autoplay loop>
                <source src="/resources/img/sports.mp4" type="video/mp4">
                <strong>Your browser does not support the video tag.</strong>
              </video> 
              
         </div>
         
         <!-- 여기여기 end -->
         <div style="text-align:center">
            <span class="dot"></span> 
            <span class="dot"></span> 
            <span class="dot"></span> 
          </div>

        <div class="optContainer">
          <form  class="searchForm100"action="/search/list" method="get">
              <input type="text" placeholder="검색어를 입력해주세요" name="keyword">
              <button type="submit">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path></svg>
                </button>
            
            <div class="dropdown">
                 <button onclick="myFunction100()" class="optionButton"type="button">옵 션</button>
                <div  id="myDropdown" class="option-dropdown-content">
                    <input id="option1"class="opt"type="checkbox" name="searchOption" value="1">
                    <label class="optName"for="option1">제목</label>
                    <input id="option2"class="opt"type="checkbox" name="searchOption" value="2">
                    <label class="optName"for="option2">게시자 닉네임</label>
                    <input id="option3"class="opt"type="checkbox" name="searchOption" value="4">
                    <label class="optName"for="option3">해시태그</label>
                    <input id="option4"class="opt"type="checkbox" name="searchOption" value="6">
                    <label class="optName"for="option4">긴 영상</label>
                    <input id="option5"class="opt"type="checkbox" name="searchOption" value="7">
                    <label class="optName"for="option5">짧은 영상</label>
                    <input id="option6"class="opt"type="checkbox" name="searchOption" value="10">
                    <label class="optName"for="option6">카테고리</label>
                </div>
            </div>
        </form>
        </div>

    </div>   
    
     <div style="margin-left: 200px;margin-top: 30px; margin-bottom: 30px;" >
     	<h2>${searchResult.keyword[0]}으로 검색한 결과 </h2>
     </div>
     
     <c:forEach items="${searchResult.result}" var="list" >
     <div class="result">
	  <p>${list.group}</p>     
     </div>
	  
     <div class="Contain3">
	    	<c:forEach items="${list.videoList}" var="list2" >
	    	<div class="item333">
	    		<a href='/video/${list2.videoSN}'><img src='${list2.thumbUrl}'></a>
	    	</div>
	    	</c:forEach>
	    </div>
	 </c:forEach>
		

    
    <%@ include file="/WEB-INF/views/includes/footer.jsp"%>	
    

</body>

<script>
	var slideIndex = 0;
	showSlides();
	
	function showSlides() {
		  var i;
		  var slides = document.getElementsByClassName("mySlides");
		  var dots = document.getElementsByClassName("dot");
		  for (i = 0; i < slides.length; i++) {
		    slides[i].style.display = "none";  
	  }
	  slideIndex++;
	  if (slideIndex > slides.length) {slideIndex = 1}    
	  	for (i = 0; i < dots.length; i++) {
	    	dots[i].className = dots[i].className.replace(" active", "");
	  	}
	 	 slides[slideIndex-1].style.display = "block";  
	  	dots[slideIndex-1].className += " active";
	  	setTimeout(showSlides, 3500); // Change image every 2 seconds
	}
	
	
	function myFunction100() {
	  document.getElementById("myDropdown").classList.toggle("show");
	}
	
	// Close the dropdown if the user clicks outside of it
	window.onclick = function(event) {
	  if (!event.target.matches('.optionButton')) {
	    var dropdowns = document.getElementsByClassName("option-dropdown-content");
	    var i;
	    for (i = 0; i < dropdowns.length; i++) {
	      var openDropdown = dropdowns[i];
	      if (openDropdown.classList.contains('show')) {
	        openDropdown.classList.remove('show');
	      }
	    }
	  }
	}

</script>
</html>