<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				<h1 style="color: #fff; font-size: 50px;">편의시설</h1>
				<h2 style="color: black; font-size: 22px;">부산의 관광지 장애인 편의시설 보유
					업소 정보</h2>
			</div>
		</div>
	</div>
	<!-- body end -->

	<div class="container">
		<div class="row">
			<div class="page_num">
				<p>
					<strong>총 게시물</strong><span></span>건
				</p>
				<hr>

				<div class="col-md-3 mb-4" id="div1"
					style="width: 1400px; display: flex; flex-direction: column;"></div>
			</div>
		</div>
	</div>

	<%@include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>