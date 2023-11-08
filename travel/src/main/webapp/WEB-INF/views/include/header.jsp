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
						<c:when test="${not empty sessionScope['loginMember']}">
							<div class="left-content">
								<img src="/img/user.jpg" alt="" class="left-image" width="40"
									height="40">
								<c:set var="userName" value="${sessionScope['loginMember']}" />
								<p>${userName}</p>
							</div>
							<a href="/logout" class="right-logout">로그아웃</a>
						</c:when>
						<c:otherwise>
							<!-- 세션이 없을 때, 로그인 링크 -->
							<a href="#">로그인</a>
							<li><a href="#">회원가입</a></li>
						</c:otherwise>
					</c:choose></li>
			</ul>
		</div>

	</header>



	<ul class="menu">
		<li><a href=#><h2>여행</h2></a>

			<ul class="submenu1">
				<li><a href="/Trip">여행지</a></li>
				<li><a href="#">추천여행10선</a></li>
				<li><a href="#">추천여행지</a></li>
			</ul></li>
		<li><a href=#><h2>일정</h2></a>

			<ul class="submenu2">
				<li><a href="#">추천일정</a></li>
				<li><a href="#">테마일정</a></li>
			</ul></li>

		<li><a href=#><h2>정보</h2></a>
			<ul class="submenu3">
				<li><a href="#">기상정보</a></li>
				<li><a href="#">기타정보</a></li>
			</ul></li>
		<li><a href=#><h2>안내</h2></a>

			<ul class="submenu4">
				<li><a href="#">공지사항</a></li>
				<li><a href="#">Q&A</a></li>
			</ul></li>
	</ul>
	<!-- header end -->

</body>
</html>