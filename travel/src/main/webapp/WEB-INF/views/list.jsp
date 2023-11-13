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
  
  
  
  
  
</style>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
 <%@include file="/WEB-INF/views/include/header.jsp" %>
 <div class="main_image">
  <img src="img/beach.jpg" width="100%" height="300px">
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

<div class="button-container">
  <button id="prevButton">이전</button>
  <span id="pageNumbers"></span>
  <button id="nextButton">다음</button>
</div>
<br>
<form action="/search" method="get">
   <input type="text" name="keyword" placeholder="검색어를 입력하세요">
   <button type="submit">검색</button>
</form>
  
  
  
  
  
  </div>
  
  <script>
    const btnWriteEl = document.querySelector('#btnWrite');
    btnWriteEl.addEventListener('click', function() {
    	location.href = '/WriteForm'
    });
  
  </script>
 
  <script>
        $(document).ready(function() {
            var currentPage = ${currentPage};
            var totalPages = ${totalPages};
            var pageSize = 10;
         
            function updatePageNumbers(start, end) {
                var pageNumbers = '';
                for (var i = start; i <= end; i++) {
                    if (i === currentPage) {
                        pageNumbers += '<strong>' + i + '</strong>';
                    } else {
                        pageNumbers += '<a href="/List?page=' + i + '">' + i + '</a>';
                    }
                    if (i < end) {
                        pageNumbers += ', ';
                    }
                }
                $('#pageNumbers').html(pageNumbers);
            }
          
            function goToPage(page) {
            	  window.location.href = '/List?page=' + page;
            	}
                      
            function updatePagination() {
                var start = Math.floor((currentPage - 1) / pageSize) * pageSize + 1;
                var end = Math.min(start + pageSize - 1, totalPages);
                updatePageNumbers(start, end);
            }

            // 초기 페이지 로딩 시 호출
            updatePagination();

            // 다음 버튼 클릭 시 호출
            $('#nextButton').click(function() {
                var start = Math.floor((currentPage - 1) / pageSize) * pageSize + pageSize + 1;
                var end = Math.min(start + pageSize - 1, totalPages);
                if ((start-end)<9){                	               	
                	console.log(currentPage+1);
                	console.log(start);
                	goToPage(currentPage+1)      	
                }                	

                if (start <= totalPages) {
                    currentPage = start;
                    updatePagination();
                    goToPage(start);
                }

            });

            // 이전 버튼 클릭 시 호출
            $('#prevButton').click(function() {
                var start = Math.floor((currentPage - 1) / pageSize) * pageSize - pageSize + 1;
                var end = Math.min(start + pageSize - 1, totalPages);
                
                if ((start-end)<9){                	               	
                	console.log(currentPage+1);
                	console.log(start);
                	goToPage(currentPage-1)      	
                }        
                         
                if (start >= 1) {
                    currentPage = start;
                    updatePagination();
                    goToPage(start);
                }
            });
        });
    </script>
</body>
</html>





