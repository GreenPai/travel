<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/handi.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
  window.onload = function() {
	 
		 let url = '/handi';   // servlet 사용
		// let url = 'https://openapi.foodsafetykorea.go.kr/api/70e153f2e8f64995941b/COOKRCP01/xml/1/50';
		 axios( {
			 url    : url,
			 method : 'GET',
			 params : {
		//       encoding 서버스키는 cors 발생 - 자바를 이용해야한다
				 serviceKey : 'X5Ow2Q7/1YLN6F2IGV2I9/1G9A5aZ2eNuiJnwQvTm8m7w/DEh2jJsBMatEA/FBy2dM5/oJASYTxYqsoEukRzvQ==',
		//       decoding 서버스키는 cors 발생하지 않음
		//		 serviceKey : 'HPG/iUcz/t/Q8HAFjrKL9sP2JYkLOIIgbnEzvj9enzRYy+jXWDidxABqUgD85CcU/UhqdtU2SPY+tq97nfbRxw==',  //decoding
				 numOfRows  : 30,
				 pageNo     : 1,
				 resultType : 'json'
			 }
		 })
		   .then(( obj ) => {
			   //alert(obj.data);
			   console.dir( obj.data );  // getGalmaetGilInfo -> body -> items
			   let  arr =  obj.data.getFcltsDsgstInfo.body.items.item;
			   console.log(arr);
			   let  html  = '';
			   arr.forEach( (row) => {	
				  // alert(JSON.stringify(row))
				  console.log(row.MAIN_TITLE)
				  //const handiInformUrl = 'handiInform?UC_SEQ=' + row.UC_SEQ + '&MAIN_TITLE=' + row.MAIN_TITLE;

				   html += '<div class="card">'
				   html += '<div class="card-content">'				   
				   html += '<p>구분:'          + row.gubun + '</p>'
				   html += '<p>편의시설 종류:' + row.setValueNm + '</p>'
				   html += '<p>상호명:'        + row.subject + '</p>'
				   html += '<p>상세정보'       + row.contents + '</p>'
				   html += '</div>'
				   html += '</div>';
			   })			   
			   //alert(html)
			   const  div1El = document.querySelector('#div1') 
			   div1El.innerHTML = html; 
		   })
		   .catch((error) => {
			   alert(error);
		   })
	 
  }
</script>

<style>

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














