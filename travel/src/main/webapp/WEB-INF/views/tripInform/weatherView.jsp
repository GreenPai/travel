<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/park.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>

</script>
</head>
<body>
	<%@include file="/WEB-INF/views/include/header.jsp"%>
	<br><br>
	<!-- body start -->
		<div id="content">
		<div style="position: relative; width: 100%; height: 400px;">
			<img alt="back_img" src="img/beach.jpg"
				style="width: 100%; height: 100%;">
			<div
				style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center;">
				<h1 style="color: #fff; font-size: 50px;">부산의 날씨</h1>
				<h2 style="color: black; font-size: 22px;">기상정보를 확인하세요</h2>
			</div>
		</div>
	</div>
	<div style="display: flex;">
	    <div style="flex: 1;"><%@include file="/WEB-INF/views/weather/weather.jsp" %></div>
	    <div style="flex: 1;"><%@include file="/WEB-INF/views/weather/weatherpage.jsp" %></div>
	</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body> 
</html>