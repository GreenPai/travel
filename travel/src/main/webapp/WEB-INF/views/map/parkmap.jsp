<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<section>
	<!-- 지도가 표시될 div -->
	<div id="map" style="width:1000px;height:800px;"></div>
	
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3240aeba4cebfd38087dd3298693d91c&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(35.15429, 128.9791), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	var positions = [
	    {
	        title: '감전동주차장', 
	        latlng: new kakao.maps.LatLng(35.15429, 128.9791)
	    },
	    {
	        title: '서감남길주변주차장', 
	        latlng: new kakao.maps.LatLng(35.15490, 128.9786)
	    },
	    {
	        title: '장성주차장', 
	        latlng: new kakao.maps.LatLng(35.1548993, 128.9786172)
	    },
	    {
	        title: '엄궁초등학교지하주차장',
	        latlng: new kakao.maps.LatLng(35.129, 128.974)
	    },
	    {
	        title: '일신주택주차장', 
	        latlng: new kakao.maps.LatLng(35.14527, 129.0027)
	    },
	    {
	        title: '삼락재첩거리주변', 
	        latlng: new kakao.maps.LatLng(35.19352, 128.9858)
	    },
	    {
	        title: '주례중학교 근변 주차장',
	        latlng: new kakao.maps.LatLng(35.1452739, 129.0026705)
	    },
	    {
	        title: '모라1동행정복지센터주변', 
	        latlng: new kakao.maps.LatLng(35.18675, 128.9900)
	    },
	    {
	        title: '학장동행정복지센터주변',
	        latlng: new kakao.maps.LatLng(35.14414, 128.9873)
	    }
	];

	
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
	for (var i = 0; i < positions.length; i ++) {
	    
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	    });
	}
	
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