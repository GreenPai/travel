<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<section>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3240aeba4cebfd38087dd3298693d91c&libraries=services"></script>
	<script>
	$(document).ready(function() {
		var mapContainer = document.getElementById('addressmap'), 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667),
		        level: 3
		    };  
		
		$('#searchBtn').click(function(){
			   
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			var geocoder = new kakao.maps.services.Geocoder();
			
			geocoder.addressSearch($('#address').val(), function(result, status) {
		
			     if (status === kakao.maps.services.Status.OK) {
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			        
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
		
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">목적지</div>'
			        });
			        infowindow.open(map, marker);
		
			        map.setCenter(coords);
			    } 
			});  
		});
	});
	</script>
	<table>
		<tr>
			<td>주소</td>
			<td><input type="text" name="detailAddress" id="address"></td>
			<td><button type="button" id="searchBtn">🏸</button></td>
		</tr>
		<tr>
			<td>상세 주소</td>
			<td><input type="text" name="detailAddress2"></td>
			<td></td>
		</tr>
	</table>
	<div id="addressmap" style="width:100%;height:350px;"></div>
</section>