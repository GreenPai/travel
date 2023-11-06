<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/css/main.css" />

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>

 <div class="main_image">
  <img src="img/beach.jpg" width="100%" height="500px">
  <div class="main_image_text">
    <h1 style="font-size:50px">공지사항</h1>
    <p>특별하고 즐거움이 가득한 국내여행</p>
  </div>
</div>
  <br><br>
  <div id="main">
    <h2>공지사항</h2>
    <button id="btnWrite" class="btn btn-dark" style="float:right;margin-bottom:20px;">새글 쓰기</button>
    <table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">번호</th>
      <th scope="col">제목</th>
      <th scope="col">작성</th>
      <th scope="col">날짜</th>
      <th scope="col">조회수</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="board" items="${ brdList }">
    <tr>
      <th scope="row">${ board.bno }</th>
      <td><a href="/View?bno=${ board.bno }">${ board.title   }</a></td>
      <td>${ board.writer  }</td>
      <td>${ board.regdate }</td>
      <td>${ board.hit     }</td>
    </tr>
    </c:forEach>
  </tbody>
</table>

    
  </div>
  
  <script>
    const btnWriteEl = document.querySelector('#btnWrite');
    btnWriteEl.addEventListener('click', function() {
    	location.href = '/WriteForm'
    });
  
  </script>
 
  
</body>
</html>





