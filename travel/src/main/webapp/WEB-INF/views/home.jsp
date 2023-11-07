<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/main.css" />
</head>
<body>
  <div id="main">
   <h2>Home -  ${ irum } 홈페이지</h2>
   <a href="/test">Test</a><br>
   <a href="/test?str=제니">Test2</a><br>   
   <a href="/List">게시물 목록</a><br>
   <a href="/WriteForm">새 글 쓰기</a><br>
   <a href="/Login">로그인</a><br>
   <a href="/Logout">로그아웃</a>
    
       <div class="header_login"> 
    <ul>
        <li>
            <c:choose>	
                <c:when test="${not empty sessionScope['userid']}">
                    <div class="left-content">
                         <c:set var="userName" value="${sessionScope['loginMember']}" />
                        <p>${userName}</p>
                    </div>
                    <a href="/Logout" class="right-logout">로그아웃</a>
                </c:when>
                <c:otherwise>
                    <a href="/Login">로그인</a>
                    <li><a href="/LoginAgree">회원가입</a></li>
                </c:otherwise>
            </c:choose>
        </li>
    </ul>
</div>
   
   
   
   
   
   
   
   
  </div> 
</body>
</html>



