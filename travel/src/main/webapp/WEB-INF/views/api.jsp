<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/x-icon" href="images/favicon1.png">
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
		 let url = '/cookRecipe';   // servlet 사용
		// let url = 'https://openapi.foodsafetykorea.go.kr/api/70e153f2e8f64995941b/COOKRCP01/xml/1/50';
		 axios( {
			 url    : url,
			 method : 'GET',
			 params : {
		//       encoding 서버스키는 cors 발생 - 자바를 이용해야한다
				 serviceKey : '70e153f2e8f64995941b',
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
			   let  arr =  obj.data.COOKRCP01.row;
			   console.log(arr);
			   let  html  = '';
			   arr.forEach( (item) => {						   
				   html += item.RCP_NM + '&'
				   html += item.RCP_PARTS_DTLS + '&'
				   html += item.ATT_FILE_NO_MAIN + '&'
				   html += item.ATT_FILE_NO_MK + '&'
				   html += item.HASH_TAG + '&'
				   html += item.INFO_CAR + '&'
				   html += item.INFO_FAT + '&'
				   html += item.INFO_NA + '&'
				   html += item.INFO_PRO + '&'
				   html += item.INFO_WGT + '&'
				   html += item.MANUAL01 + '&'
				   html += item.MANUAL_IMG01 + '&'
				   html += item.MANUAL02 + '&'
				   html += item.MANUAL_IMG02 + '&'
				   html += item.MANUAL03 + '&'
				   html += item.MANUAL_IMG03 + '&'
				   html += item.MANUAL04 + '&'
				   html += item.MANUAL_IMG04 + '&'
				   html += item.MANUAL05 + '&'
				   html += item.MANUAL_IMG05 + '&'
				   html += item.MANUAL06 + '&'
				   html += item.MANUAL_IMG06 + '&'
				   html += item.RCP_NA_TIP + '<br>'
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
   <h2>레시피 가져오기</h2>
   <button id="getData">가져오기</button>
   <div id="div1"></div>
</body>
</html>





