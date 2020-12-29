<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="nav">

        <div class="imgBox">
            <img class="logo444"  style="width: 50px; height: 50px;"src="/resources/img/logo2.png" alt="">
        </div>
       <div class="title444"><a href="">Uniz</a></div>
       <div class="nav-links hidden">
        <ul class="nav-linksUL ">
            <li>
                <i class="fa fa-user" style="color: 551b8b;"></i><a href="/UnizHit/UnizHit">인기</a>
            </li>
            <li>
                <i class="fa fa-crown" style="color: 551b8b;"></i><a href="">추천</a>
            </li>
            <li>
                <i class="fa fa-comment" style="color: 551b8b;"></i><a href="/category/main">커뮤니티</a>
            </li>
        </ul>
    </div>
        <div class="box444 hidden">
             <form action="/search/AllList">
                <input type="text" id="searchInput" name="keyword" placeholder="검색어를 입력하세요">
                <button class="button444" id="searchBtn"><i class="fa fa-search"></i></button>
            </form>
        </div>
        <c:if test="${user == null}">
	        <div class="btn444 hidden">
	            <button class="btn444-4 logInBtn" onclick="location.href='/user/loginForm'">로그인</button>
	            <button class="btn444-4"  onclick="location.href='/user/register'">회원가입</button>
	        </div>
		</c:if>
		
		<c:if test="${user != null}">
			<div class="btnBox">
                 <c:if test="${user.userType ne 99}">  
                <button class="login">${user.nick}</button>
				</c:if>
                 <c:if test="${user.userType eq 99}">  
                <button class="login" onclick="location.href='http://localhost:8080/'">관리자페이지</button>
				</c:if>
                <div class="dropdown">

                    <a href=""><button class="register" style="padding:2px; margin-left: 25px; border-radius: 50%;"><i class="fas fa-user-circle"></i></button></a>
                    <div class="dropdown-content">
                        <a href="/user/info">마이페이지</a>
                        <a href="/user/showHistory">내 시청이력</a>
                        <a href="/user/logout">로그아웃</a>
                    </div>
                </div>
                <!-- end dropdown -->
                </div>
		</c:if>
    </div>