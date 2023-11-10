<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/new_main.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
  window.onload = function() {
	 
		 let url = '/travle';   // servlet 사용
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
			   let  arr =  obj.data.getAttractionKr.item;
			   console.log(arr);
			   let  html  = '';
			   arr.forEach( (row) => {	
				/*   html += `<ul>`;
				   html += `<li>제목            : ${item.TITLE}</li>`;				   
				   html += `<li>부제목          : ${item.SUBTITLE}</li>`;				   
				   html += `<li>이미지url       : ${item.MAIN_IMG_NORMAL}</li>`;			   
				   html += `<li>주소            : ${item.ADDR1}</li>`;
				   html += `<li>위도            : ${item.LAT}</li>`;			   
				   html += `<li>경도            : ${item.LNG}</li>`;			   
				   html += `<li>연락처          : ${item.CNTCT_TEL}</li>`;
				   html += `<li>홈페이지        : ${item.HOMEPAGE_URL}</li>`;
				   html += `<li>교통정보        : ${item.TRFC_INFO}</li>`;
				   html += `<li>운영일          : ${item.USAGE_DAY}</li>`;
				   html += `<li>휴무일          : ${item.HLDY_INFO}</li>`;
				   html += `<li>편의시설        : ${item.MIDDLE_SIZE_RM1}</li>`;
				   html += `<li>상세내용        : ${item.ITEMCNTNTS}</li>`;
				   html += `</ul>`;
				  */ 
				  
				   html += '<ul>';				   
				   html += '<li>제목:'             + row.TITLE + '</li>';
				   html += '<li>부제목:'           + row.SUBTITLE + '</li>';
				   html += '<li>이미지:'           + row.MAIN_IMG_NORMAL + '</li>';
				   html += '<li>주소:'             + row.ADDR1 + '</li>';
				   html += '<li>위도:'             + row.LAT + '</li>';
				   html += '<li>경도:'             + row.LNG + '</li>';
				   html += '<li>연락처:'           + row.CNTCT_TEL + '</li>';
				   html += '<li>홈페이지:'         + row.HOMEPAGE_URL + '</li>';
				   html += '<li>교통정보:'         + row.TRFC_INFO + '</li>';
				   html += '<li>운영일:'           + row.USAGE_DAY + '</li>';
				   html += '<li>휴무일ID:'         + row.HLDY_INFO + '</li>';
				   html += '<li>편의시설:'         + row.MIDDLE_SIZE_RM1 + '</li>';				   
				   html += '<li>상세내용:'         + row.ITEMCNTNTS + '</li>';				   
				   html += '</ul>';

				  
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
</head>
<body>
	<%@include file="/WEB-INF/views/include/header.jsp"%>
	
	<!-- 부산 명소 정보를 출럭 -->
	<div class="container">
		<div class="row" id="div1">
			
		</div>
	</div>
	
	
	
	
	
	
	
	
	

<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body> 
</html>