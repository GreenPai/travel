<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/new_main.css" />

</head>
<body>
	<header class="header" style="display: flex;">

		<div class="header_title">
			<br> <a href="/"><img src="/img/logo.png" alt="logo"
				style="width: 300px; height: 60px;"></a>
		</div>

		<div class="header_login">
			<ul>
				<li><c:choose>
						<c:when test="${not empty sessionScope['nickname']}">
							<div class="left-content">
								<img src="/img/user.jpg" alt="" class="left-image" width="40"
									height="40">
								<c:set var="userName" value="${sessionScope['nickname']}" />
								<p>${userName}</p>
							</div>
							<a href="/Logout" class="right-logout">로그아웃</a>
						</c:when>
						<c:otherwise>
							<!-- 세션이 없을 때, 로그인 링크 -->
							<a href="/Login">로그인</a>
							<li><a href="/LoginAgree">회원가입</a></li>
						</c:otherwise>
					</c:choose></li>
			</ul>
		</div>

	</header>



	<ul class="menu">
		<li><a href=#><h2>여행</h2></a>

			<ul class="submenu1">
				<li><a href="/Trip">부산 여행 명소</a></li>
				<li><a href="/Walk">부산 도보여행</a></li>
				<li><a href="/Food">부산 추천 맛집</a></li>
			</ul></li>
		<li><a href=#><h2>일정</h2></a>

			<ul class="submenu2"> 
				<li><a href="/TravelPlan">일정 세우기</a></li>
				<li><a href="/Recom">부산 시장투어</a></li>
				<li><a href="/Tema">부산 테마일정</a></li>
				<li><a href="/Festa">부산 축제투어</a></li>
			</ul></li>

		<li><a href=#><h2>정보</h2></a>
			<ul class="submenu3">
				<li><a href="/Park">부산 공영주차장 정보</a></li>
				<li><a href="/Handi">부산 편의시설 정보</a></li>
				<li><a href="#">부산 기상정보</a></li>
				<li><a href="/Leis">경남 레저정보</a></li>				
			</ul></li>
		<li><a href=#><h2>안내</h2></a>

			<ul class="submenu4">
				<li><a href="/List?menu_id=MENU01">공지사항</a></li>
				<li><a href="/List?menu_id=MENU02">이벤트정보</a></li>
				<li><a href="/List?menu_id=MENU03">Q&A</a></li>
			</ul></li>
	</ul>
	<!-- header end -->
	
	

</body>
</html>