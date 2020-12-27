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
</head>
<body>
<%@ include file="/WEB-INF/views/includes/nav.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

     <div class="banner">
        
        <div class="mySlides">
            <video  class="sea"muted autoplay loop>
                <source src="/resources/img/sea.mp4" type="video/mp4">
                    <strong>Your browser does not support the video tag.</strong>
                </video>
            </div>
        
        
         <div class="mySlides">
            <video  class="forest" muted autoplay loop>
                <source src="/resources/img/leaf.mp4" type="video/mp4">
                <strong>Your browser does not support the video tag.</strong>
              </video>
         </div>
         <div class="mySlides">
            <video class="tower"muted autoplay loop>
                <source src="/resources/img/tower.mp4" type="video/mp4">
                <strong>Your browser does not support the video tag.</strong>
              </video>
         </div>
         <div style="text-align:center">
            <span class="dot"></span> 
            <span class="dot"></span> 
            <span class="dot"></span> 
          </div>

        <div class="theme">
            Search Uniz
        </div>

        <div class="optContainer">
          <form  class="searchForm100"action="">
              <input type="text" placeholder="검색어를 입력해주세요">
              <button>
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path></svg>
                </button>
            
            <div class="dropdown">
                <button onclick="myFunction100()" class="optionButton"type="submit">옵션</button>
                <div  id="myDropdown" class="dropdown-content">
                    <input id="option1"class="opt"type="checkbox">
                    <label class="optName"for="option1">제목</label>
                    <input id="option2"class="opt"type="checkbox">
                    <label class="optName"for="option2">게시자 닉네임</label>
                    <input id="option3"class="opt"type="checkbox">
                    <label class="optName"for="option3">해시태그</label>
                    <input id="option4"class="opt"type="checkbox">
                    <label class="optName"for="option4">긴 영상</label>
                    <input id="option5"class="opt"type="checkbox">
                    <label class="optName"for="option5">짧은 영상</label>
                    <input id="option6"class="opt"type="checkbox">
                    <label class="optName"for="option6">카테고리</label>
                </div>
            </div>
        </form>
        </div>

    </div>   
     
     <div class="Contain3">
     	<c:forEach items="${VideoData}" var="list" >
	    	<div class="item333">
	    		<a href='/video/${list.videoSN}'><img src='${list.thumbUrl}'></a>
	    	</div>
	    </c:forEach>
    </div>
		

    
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
	    var dropdowns = document.getElementsByClassName("dropdown-content");
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