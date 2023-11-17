<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<section>
	<!-- 지도가 표시될 div -->
	<div id="map" style="width:320px;height:240px;"></div>
	
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3240aeba4cebfd38087dd3298693d91c&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(35.1578, 129.0600), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	axios({
	    url    : '/park',
	    method : 'GET',
	    params : {
	        serviceKey : 'X5Ow2Q7/1YLN6F2IGV2I9/1G9A5aZ2eNuiJnwQvTm8m7w/DEh2jJsBMatEA/FBy2dM5/oJASYTxYqsoEukRzvQ==',
	        numOfRows  : 30,
	        pageNo     : 1,
	        resultType : 'json'
	    }
	})
	.then((obj) => {
	    let arr = obj.data.getPblcPrkngInfo.body.items.item;
	
	    // 주소-좌표 변환 객체를 생성합니다
	    var geocoder = new kakao.maps.services.Geocoder();
	
	    arr.forEach((row) => {
	        // 주소로 좌표를 검색합니다
	        geocoder.addressSearch(row.jibunAddr, function(result, status) {
	            // 정상적으로 검색이 완료됐으면 
	            if (status === kakao.maps.services.Status.OK) {
	                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	                // 결과값으로 받은 위치를 마커로 표시합니다
	                var marker = new kakao.maps.Marker({
	                    map: map,
	                    position: coords
	                });
	
	                // 인포윈도우로 장소에 대한 설명을 표시합니다
	                var infowindow = new kakao.maps.InfoWindow({
	                    content: '<div style="width:150px;text-align:center;padding:6px 0;">' + row.pkNam + '</div>'
	                });
	                infowindow.open(map, marker);
	
	                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	                map.setCenter(coords);
	            } 
	        });    
	    })
	})
	.catch((error) => {
	    console.error(error);
	});
	</script>
</section>