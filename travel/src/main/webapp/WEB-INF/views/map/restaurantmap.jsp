<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<section style="width:90%; margin-left:65px;">
        <br><br>
		<div id="map" style="width:80%;height:500px;float:left; margin-right:10px;"></div>
		<br>
		<!-- 버튼 모음 -->
		<div style=" float:left; border: white 1px;">
		  <div>
			<label><input type="radio" name="district" value="중구"> 중구</label>
	      </div>
	      <div>
			<label><input type="radio" name="district" value="서구"> 서구</label>
	      </div>
		  <div>
			<label><input type="radio" name="district" value="동구"> 동구</label>
		  </div>
		  <div>
			<label><input type="radio" name="district" value="영도구"> 영도구</label>
		  </div>
		  <div>
			<label><input type="radio" name="district" value="부산진구"> 부산진구</label>
		  </div>
		  <div>
			<label><input type="radio" name="district" value="동래구"> 동래구</label>
		  </div>
		  <div>
			<label><input type="radio" name="district" value="남구"> 남구</label>
		  </div>
	      <div>
			<label><input type="radio" name="district" value="북구"> 북구</label>
		  </div>
		  <div>
			<label><input type="radio" name="district" value="해운대구"> 해운대구</label>
		  </div>
	      <div>
			<label><input type="radio" name="district" value="사하구"> 사하구</label>
	      </div>
		  <div>
			<label><input type="radio" name="district" value="금정구"> 금정구</label>
		  </div>
		  <div>
			<label><input type="radio" name="district" value="강서구"> 강서구</label>
		  </div>
		  <div>
			<label><input type="radio" name="district" value="연제구"> 연제구</label>
		  </div>
		  <div>
			<label><input type="radio" name="district" value="수영구"> 수영구</label>
		  </div>
		  <div>
			<label><input type="radio" name="district" value="사상구"> 사상구</label>
		  </div>
	      <div>
			<label><input type="radio" name="district" value="기장군"> 기장군</label>
		  </div>
		</div>
        
		<!-- 검색창! -->
		<div>
			<div style="width:30%;">
			    <br>
				<input type="text" id="keyword" placeholder="검색어를 입력하세요" style="width:100%; height:40px;">
				<button id="search" style="width:15%; height:30px;">검색</button>
			</div>
		</div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3240aeba4cebfd38087dd3298693d91c&libraries=services"></script>
	<script>
		// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(35.1578, 129.0600), // 지도의 중심좌표
		        level: 2 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(); 
		
		// 마커를 담을 배열입니다
		var markers = [];
		
		// 라디오 버튼을 클릭하면 키워드로 장소를 검색합니다
		document.querySelectorAll('input[name="district"]').forEach(function(el) {
		    el.addEventListener('change', function() {
		        if (this.checked) {
		            // 이전에 표시한 마커를 지우고
		            deleteMarkers();
		
		            var keyword = '부산 ' + this.value + ' 맛집';
		            ps.keywordSearch(keyword, placesSearchCB);
		        }
		    });
		});
		
		// 검색 버튼을 클릭하면 입력한 키워드로 장소를 검색합니다
		document.getElementById('search').addEventListener('click', function() {
			deleteMarkers();
		    var keyword = document.getElementById('keyword').value;
		    ps.keywordSearch(keyword, placesSearchCB);
		});
		
		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB (data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {
		
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        var bounds = new kakao.maps.LatLngBounds();
		
		        for (var i=0; i<data.length; i++) {
		            displayMarker(data[i]);    
		            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
		        }       
		
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		        map.setBounds(bounds);
		    } 
		}
		
		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {
		    
		    // 마커를 생성하고 지도에 표시합니다
		    var marker = new kakao.maps.Marker({
		        map: map,
		        position: new kakao.maps.LatLng(place.y, place.x) 
		    });
		
		    // 마커를 배열에 추가합니다
		    markers.push(marker);
		
		    // 마커에 클릭이벤트를 등록합니다
		    kakao.maps.event.addListener(marker, 'click', function() {
		        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
		        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
		        infowindow.open(map, marker);
		    });
		}
		
		// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
		function deleteMarkers() {
		    for (var i = 0; i < markers.length; i++) {
		        markers[i].setMap(null);
		    }
		    markers = [];
		}
	</script>
</section>