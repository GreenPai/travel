<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<section>

    <h2>부산 날씨 지도</h2>
	<div id="map" style="width:95%;height:800px;"></div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3240aeba4cebfd38087dd3298693d91c"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script>
		var mapContainer = document.getElementById('map'), 
		    mapOption = { 
		        center: new kakao.maps.LatLng(35.1578, 129.0600), // 변경된 부산의 중심좌표
		        level: 5 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		// 부산의 각 행정구의 중심점 좌표입니다.
		var locations = [
		    {name: '중구', lat: 35.1032, lng: 129.0345},
		    {name: '서구', lat: 35.0948, lng: 129.0263},
		    {name: '동구', lat: 35.1358, lng: 129.0591},
		    {name: '영도구', lat: 35.0881, lng: 129.0701},
		    {name: '부산진구', lat: 35.1599, lng: 129.0553},
		    {name: '동래구', lat: 35.2018, lng: 129.0858},
		    {name: '남구', lat: 35.1334, lng: 129.0865},
		    {name: '북구', lat: 35.1941, lng: 128.9924},
		    {name: '해운대구', lat: 35.1600, lng: 129.1658},
		    {name: '사하구', lat: 35.1014, lng: 128.9770},
		    {name: '금정구', lat: 35.2400, lng: 129.0943},
		    {name: '강서구', lat: 35.2091, lng: 128.9829},
		    {name: '연제구', lat: 35.1731, lng: 129.0820},
		    {name: '수영구', lat: 35.1424, lng: 129.1153},
		    {name: '사상구', lat: 35.1494, lng: 128.9933},
		    {name: '기장군', lat: 35.2447, lng: 129.2222}
		];
		
		function getWeatherAndCreateMarker(name, lat, lng) {
		    var markerPosition  = new kakao.maps.LatLng(lat, lng); 
		    var marker = new kakao.maps.Marker({
		        position: markerPosition
		    });
		    marker.setMap(map);
			
			// 날씨 API를 호출합니다
			$.getJSON('http://api.openweathermap.org/data/2.5/weather?lat=' + lat + '&lon=' + lng + '&appid=32c9e2ef977a4ebfaedd69cc117bb42a&units=metric', function (WeatherResult) {
				// 날씨 아이콘 URL을 가져옵니다
				var weathericonUrl = "http://openweathermap.org/img/wn/" + WeatherResult.weather[0].icon + ".png";

				// 인포윈도우의 내용을 설정합니다
				var iwContent = '<div style="padding:5px;">' + name + ' <br> ' +
								'<img src="' + weathericonUrl + '" alt="' + WeatherResult.weather[0].description + '"/> <br>' +
								WeatherResult.main.temp + ' °C' +
								'</div>';

				// 인포윈도우를 생성하고 지도에 표시합니다
				var infowindow = new kakao.maps.InfoWindow({
					position : markerPosition, 
					content : iwContent 
				});
				infowindow.open(map, marker); 
			});
		}

		for (var i = 0; i < locations.length; i++) {
		    getWeatherAndCreateMarker(locations[i].name, locations[i].lat, locations[i].lng);
		}
	</script>
</section>