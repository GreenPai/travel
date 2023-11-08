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
      <br>
         <a href="/"><img src="/img/logo.png"   alt="logo" style="width: 300px; height: 60px;"></a>
      </div> 

         <div class="header_login">
    <ul>
        <li>
            <c:choose>
                <c:when test="${not empty sessionScope['loginMember']}">
                    <div class="left-content">
                        <img src="/img/user.jpg" alt="" class="left-image" width="40" height="40">
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
            </c:choose>
        </li>
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
					</ul>
				</li>
			<li><a href=#><h2>안내</h2></a>

					<ul class="submenu4">
						<li><a href="#">공지사항</a></li>
						<li><a href="#">Q&A</a></li>
					</ul>
</li>
		</ul>
	<!-- header end -->

	<!-- body start -->
	<div id="content">
		<div style="position: relative; width: 100%; height: 400px;">
			<img alt="back_img" src="img/beach.jpg"
				style="width: 100%; height: 100%;">
			<div
				style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center;">
				<h1 style="color: #fff; font-size: 50px;">부산 여행지</h1>
				<h2 style="color: black; font-size: 22px;">부산의 여러 여행지를 소개합니다.</h2>
			</div>
		</div>
	</div>
	<!-- body end -->

	<div class="container">
		<div class="row">
			<div class="page_num">
				<p><strong>총 게시물</strong><span>${trip.many}</span>건</p>
			<c:forEach items="${tripList}" var="recipe">
				<div class="col-md-3 mb-4">
					<div class="card h-100">
						<a href="/Trip?idx=${trip.IDX }&tripTitle=${trip.RCP_NM}"> <img
							src="${recipe.ATT_FILE_NO_MAIN}" class="card-img-top"
							alt="${trip.RCP_NM}" style="width: 253px; height: 200px;">
						</a>
						<div class="card-body">
							<h5 class="card-title" style="text-align: center;">${trip.RCP_NM}</h5>
						</div>

					</div>
				</div>
			</c:forEach>
			</div>
		</div>
	</div>

	<div class="footer">
		<div class="inner">
			<div class="left">
				<h3 class="title">제공</h3>
				<p>개인정보보호방침</p>
				<p>저작권보호정책</p>
				<p>약관</p>
				<p>행정서비스현황</p>
				<p>뷰어다운로드</p>
				<p class="last">Copyright Busan Metropolitan City. All rights
					reserved.</p>
			</div>
			<div class="center">
				<h3 class="title">관광 문의</h3>
				<p style="font-size: 40px;">1331</p>
				<br>
			</div>
			<div class="right">
				<h3 class="title">민원대표전화</h3>
				<p>051-900-0000</p>
				<p>평일 09:00 - 18:00</p>
				<p>※야간/공휴일 등 근무시간외는 사무실로 전환.</p>
				<p>부산문화포탈 다봄</p>
				<p>여행 상담</p>
			</div>
		</div>
	</div>

</body>
</html>














