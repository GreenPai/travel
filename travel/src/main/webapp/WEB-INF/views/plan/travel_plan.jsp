<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/main.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>

</script>

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
  
  .page_1{
    padding-bottom: 12px;
    border-bottom: 1px solid #d2d2d2;
    font-size: 16px;
    color: #545454;
  }

</style>
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
				<h1 style="color: #fff; font-size: 50px;">일정 잡기</h1>
				<h2 style="color: black; font-size: 22px;">여러분의 일정을 세워보세요</h2>
			</div>
		</div>
	</div>
	<!-- body end -->
	

	<div class="container">
		<div class="row">
			<div class="page_1">
				<h2 style="text-align: center;">일정잡기</h2>
				<hr>
				
				<div class="col-md-3 mb-4" id="div1" style="width:1200px; display: flex; flex-wrap: wrap;">
				 <div style="display: flex; gap: 10px;">
                    <a href="/TravelPlan" class="btn btn-dark">유저 계획</a><br>
                    <a href="/TravelMyPlan"  class="btn btn-dark">나의 계획</a><br>
                    <br>
                 </div>
				</div>
                  <button id="btnWrite" class="btn btn-dark" style="float:right; margin-bottom:20px;">계획 세우기</button>	
			</div>
			
			<table class="table">
  <thead class="thead-dark">
    <tr id="list">
      <th scope="col">번호</th>
      <th scope="col">제목</th>
      <th scope="col">작성</th>
      <th scope="col">날짜</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="plan" items="${ planList }">
    <tr>
      <th scope="row">${ plan.tno }</th>
     <td><a href="/PlanView?tno=${plan.tno}">${plan.titles}</a></td>
     <td><a href="/View?bno=${ board.bno }">${ board.title   }</a></td>
      <td>${ plan.userid  }</td>
      <td>${ plan.today_date }</td>
    </tr>
    </c:forEach>
  </tbody>
</table>


		</div>
	</div>

	
  <script>
    
    
    const btnWriteEl = document.querySelector('#btnWrite');
    btnWriteEl.addEventListener('click', function() {
    	location.href = '/P3'
    });
    
  </script>
</body>
</html>














