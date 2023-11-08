<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style>
  ul, li {
     list-style-type:none;
  }
  ul { border:1px solid black; 
     border-radius :10px;
     padding:20px; margin:20px;
  }
</style>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
  window.onload = function() {
	 const  btnEl  = document.getElementById('getData');
	 const  div1El = document.getElementById('div1');
	 btnEl.addEventListener('click', function() {
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
			   alert(obj.data);
			   console.dir( obj.data );  // getGalmaetGilInfo -> body -> items
			   let  arr =  obj.data.TRAVEL01.row;
			   console.log(arr);
			   let  html  = '';
			   arr.forEach( (item) => {	
				   html += `<ul>`;
				   html += `<li>페이지수   : ${item.pageNo}</li>`;
				   html += `<li>전체페이지 : ${item.totalCount}</li>`;
				   html += `<li>콘텐츠ID   : ${item.UC_SEQ}</li>`;
				   html += `<li>구군       : ${item.GUGUN_NM}</li>`;				   
				   html += `<li>위도       : ${item.LAT}</li>`;
				   html += `<li>경도       : ${item.LNG}</li>`;
				   html += `<li>여행지     : ${item.PLACE}</li>`;
				   html += `</ul>`;
				   
				  /*  html += item.pageNo + '&'
				   html += item.totalCount + '&'
				   html += item.UC_SEQ + '&'
				   html += item.GUGUN_NM + '&'
				   html += item.LAT + '&'
				   html += item.LNG + '&'
				   html += item.PLACE + '&'
				   html += item.TITLE + '&'
				   html += item.SUBTITLE + '&'
				   html += item.ADDR1 + '&'
				   html += item.CNTCT_TEL + '&'
				   html += item.HOMEPAGE_URL + '&'
				   html += item.TRFC_INFO + '&'
				   html += item.USAGE_DAY + '&'
				   html += item.HLDY_INFO + '&'
				   html += item.USAGE_DAY_WEEK_AND_TIME + '&'
				   html += item.USAGE_AMOUNT + '&'
				   html += item.MIDDLE_SIZE_RM1 + '&'
				   html += item.MAIN_IMG_NORMAL + '&'
				   html += item.MAIN_IMG_THUMB + '&'
				   html += item.ITEMCNTNTS + '<br>' */
			   })			   
			   alert(html)
			   div1El.innerHTML = html; 
		   })
		   .catch((error) => {
			   alert(error);
		   })
	 } )
  }
</script>
</head>
<body>
   <h2>여행정보 가져오기</h2>
   <button id="getData">가져오기</button>
   <div id="div1"></div>
</body>
</html>





