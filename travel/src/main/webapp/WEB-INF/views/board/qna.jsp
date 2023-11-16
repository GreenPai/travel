<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/css/main.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<style>
  .button-container {
    display: flex;
    justify-content: center;
    align-items: center;
  }
  
  .button-container button {
    background-color: #ccc;
    color: #fff;
    padding: 5px 8px;
    border: none;
    border-radius: 10px;
    cursor: pointer;
    margin: 0 10px;
  }
  
  #pageNumbers {
    font-size: 20px;
  }
  
  
/* 검색창에 대한 CSS 수정 */
form {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 20px; /* 아래 여백 추가 */
}

form input[type="text"] {
    padding: 8px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 4px;
    margin-right: 8px; /* 간격 조절 */
}

form button[type="submit"] {
    padding: 8px 16px;
    font-size: 16px;
    background-color: #007BFF;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
  
  
#list {
    background-color: #808080; /* 원하는 배경색으로 변경 */	
}
    
 #main {
        padding: 0 150px; /* 좌우 여백을 200px로 설정 */
    }
  
</style>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
<%@include file="/WEB-INF/views/include/header.jsp"%>

	<br>
	<br>
 
	<!-- body start -->
	<div id="content">
		<div style="position: relative; width: 100%; height: 400px;">
			<img alt="back_img" src="img/beach.jpg"
				style="width: 100%; height: 100%;">
			<div
				style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center;">
				<h1 style="color: #fff; font-size: 50px;">자주하는 질문</h1>
				<h2 style="color: black; font-size: 22px;">질문 리스트입니다</h2>
			</div>
		</div>
	</div>
  <br><br>
  <div id="main">
    <h2>Q&A</h2>
   <br>
   <div style="display: flex; gap: 10px;">
   <a href="/List?menu_id=MENU03" class="btn btn-dark">QNA 질문 게시판</a><br>
   <a href="/QNA" 	class="btn btn-dark">자주하는 질문</a><br>
   </div>
   <br>

  </div>
  
    
 
</body>
</html>





