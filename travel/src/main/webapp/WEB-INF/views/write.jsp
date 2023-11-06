<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/main.css" />

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="main_image">
		<img src="img/beach.jpg" width="100%" height="500px">
		<div class="main_image_text">
			<h1 style="font-size: 50px">공지사항</h1>
			<p>특별하고 즐거움이 가득한 국내여행</p>
		</div>
	</div>
    <br><br>
	<div id="main">
		<h2>게시물 쓰기</h2>

		<form action="/Write" method="POST">
			<div class="mb-3">
				<label for="formTitle" class="form-label"><b
					style="color: red">*</b>제목</label> <input type="text" class="form-control"
					name="title" id="formTitle" placeholder="글제목을 입력하세요">
			</div>
			<div class="mb-3">
				<label for="formWriter" class="form-label"><b
					style="color: red">*</b>글쓴이</label> <input type="text" class="form-control"
					name="writer" id="formWriter" placeholder="글쓴이를 입력하세요">
			</div>
			<div class="mb-3">
				<label for="formContent" class="form-label">내용</label>
				<textarea class="form-control" id="formContent" name="content"
					rows="5"></textarea>
			</div>
			<div class="mb-3">
				<input type="submit" class="btn btn-dark" id="formSubmit" value="가입">
				<input type="button" class="btn btn-dark" id="formHome" value="Home">
				<button id="btnList" class="btn btn-dark">목록</button>
			</div>

		</form>


	</div>
	<!-- div main end -->

	<script>
       // cliens validation
       // form tag 에 submit 이벤트가 발생하면 (input type="submit", <button>, input type="image")
       const  formEl = document.querySelector('form');
       formEl.addEventListener('submit', function(e) {
    	   //alert('submit 클릭');
    	   console.dir(e);
    	   //alert(e.submitter.id)
    	   if(e.submitter.id == 'btnList') {
    		   e.preventDefault();  // submit 이벤트를 취소
    		   location.href="/List";
    		   return false;
    	   }
    	   
    	   // 필수입력체크
    	   const  titleEl    = document.querySelector('#formTitle');
    	   const  writerEl   = document.querySelector('#formWriter');    	 
    	   if( titleEl.value.trim()  == ''  ) {
    	   	   e.preventDefault();  // submit 이벤트를 취소
    		   alert('제목을 입력하세요')
    	   	   titleEl.focus();
    	   } else {
	    	   if( writerEl.value.trim()  == ''  ) {
	    	   	   e.preventDefault();  // submit 이벤트를 취소
	    		   alert('글쓴이를 입력하세요')
	    		   writerEl.focus();
	    	   } 
    	   }
    	   
       })
       
       const  homeEl  = document.querySelector('#formHome');
       homeEl.addEventListener('click', (e) => {
    	   location.href='/';
       });
    
    </script>

</body>
</html>





























