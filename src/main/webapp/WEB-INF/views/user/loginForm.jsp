<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/resources/css/loginForm.css">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<title>Uniz로그인페이지</title>
</head>
<body>	

<div class="bg">
    <div class="login-box">
        <form  class="loginForm" action="/user/loginForm" method="post" onsubmit="return checkForm();">
        <h1 class="loginHeader">
        <p>Uniz</p>
        	
        </h1>
        <div class="textBox">
            <input type="text" id="userId" name="userId" placeholder="아이디"><br>
        </div>

        <div class="textBox">
            <input type="password" id="password" name="password" placeholder="비밀번호">
        </div>

        <div class="cookieBox">
            
            <input type="checkbox" id="chk" name="chk">
            <label  style="margin: 6px 2px;" for="chk">아이디 기억하기</label>
            <label style="margin-left: auto; color:darkblue;">비밀번호 찾기 </label>
        </div>
        
        <div class="socialBox">
          <button ><img src="https://vtpkb4cbz742mpwjg43ich01-wpengine.netdna-ssl.com/wp-content/uploads/2020/03/Facebook-Logo-300x300.png" class="attachment-medium size-medium" alt="" loading="lazy" srcset="https://vtpkb4cbz742mpwjg43ich01-wpengine.netdna-ssl.com/wp-content/uploads/2020/03/Facebook-Logo-300x300.png 300w, https://vtpkb4cbz742mpwjg43ich01-wpengine.netdna-ssl.com/wp-content/uploads/2020/03/Facebook-Logo-150x150.png 150w, https://vtpkb4cbz742mpwjg43ich01-wpengine.netdna-ssl.com/wp-content/uploads/2020/03/Facebook-Logo-260x260.png 260w, https://vtpkb4cbz742mpwjg43ich01-wpengine.netdna-ssl.com/wp-content/uploads/2020/03/Facebook-Logo-125x125.png 125w, https://vtpkb4cbz742mpwjg43ich01-wpengine.netdna-ssl.com/wp-content/uploads/2020/03/Facebook-Logo-45x45.png 45w, https://vtpkb4cbz742mpwjg43ich01-wpengine.netdna-ssl.com/wp-content/uploads/2020/03/Facebook-Logo.png 512w" sizes="(max-width: 300px) 100vw, 300px"></button>
          <button><img alt="지메스테크놀로지 - JIMEAS Technology Corp." class="n3VNCb" src="https://jimeas12.cafe24.com/wp-content/uploads/2020/01/kakao.png" jsname="HiaYvf" jsaction="load:XAeZkd;" data-iml="20165.079999998852" ></button>
            <button class="google"><img alt="Google Search Google Account Google s Google Play, google, company, text png  | PNGEgg" class="n3VNCb" src="https://e7.pngegg.com/pngimages/337/722/png-clipart-google-search-google-account-google-s-google-play-google-company-text.png" jsname="HiaYvf" jsaction="load:XAeZkd;" data-iml="27718.809999998484" ></button>
        </div>

        <div class="btnBox">
            <button class="logBtn"type="submit">로그인</button>
            <button type="button" class="logBtn regBtn" onclick="location.href='/user/register'">회원가입</button>
        </div>
        
        </form>
    </div>
</div>
	
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript">
	//테스트용 아이디 비밀번호 고정
		$("#userId").val("test0003");
		$("#password").val("1234");
		
		
	</script>
	</body>
</html>