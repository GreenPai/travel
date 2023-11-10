<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<section>
	<div id="map" style="width: 800px;height:600px;"></div>
	
	<script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=3240aeba4cebfd38087dd3298693d91c"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(35.15995278, 129.0553194), // 지도의 중심좌표
	        level: 7 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	 
	// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	var positions = [
	    {
	        content: '<div>부산시민공원<img src="/img/map/cvilpark.jpg" sytle="width:352px; height:220px;"></div>', 
	        latlng: new kakao.maps.LatLng(35.167599, 129.056755)
	    },
	    {
	        content: '<div>부산어린이대공원<img src="/img/map/CGP.jpg" sytle="width:352px; height:220px;"></div>', 
	        latlng: new kakao.maps.LatLng(35.182968, 129.044441)
	    },
	    {
	        content: '<div>부산용두산공원<img src="/img/map/ryudusan.jpg" sytle="width:352px; height:220px;"></div>', 
	        latlng: new kakao.maps.LatLng(35.100512, 129.032877)
	    },
	    {
	        content: '<div>서면 젊음의 거리<img src="/img/map/youngstreet.jpg" sytle="width:352px; height:220px;"></div>',
	        latlng: new kakao.maps.LatLng(35.154466, 129.060816)
	    },
	    {
	        content: '<div>백스코<br><img src="/img/map/BEXCO.jpg" sytle="width:352px; height:220px;"></div>',
	        latlng: new kakao.maps.LatLng(35.169163, 129.136261)
	    },
	    {
	        content: '<div>전포카페거리<br><img src="/img/map/cafestreet.jpg" sytle="width:352px; height:220px;"></div>',
	        latlng: new kakao.maps.LatLng(35.155413, 129.063858)
	    },
	    {
	        content: '<div>재한UN기념공원<br><img src="/img/map/unmck.jpg" sytle="width:352px; height:220px;"></div>',
	        latlng: new kakao.maps.LatLng(35.127714, 129.097650)
	    },
	    {
	        content: '<div>오륙도 스카이워크<br><img src="/img/map/skykwolker.jpg" sytle="width:352px; height:220px;"></div>',
	        latlng: new kakao.maps.LatLng(35.100689, 129.124491)
	    },
	    {
	        content: '<div>영화의전당<br><img src="/img/map/BusanCinemaCenter.jpg" sytle="width:352px; height:220px;"></div>',
	        latlng: new kakao.maps.LatLng(35.171070, 129.126991)
	    },
	    {
	        content: '<div>해운대 해수욕장<br><img src="/img/map/Haeundae.jpg" sytle="width:352px; height:220px;"></div>',
	        latlng: new kakao.maps.LatLng(35.158567, 129.159836)
	    },
	    {
	        content: '<div>부산 아쿠아리움<br><img src="/img/map/aqua.jpg" sytle="width:352px; height:220px;"></div>',
	        latlng: new kakao.maps.LatLng(35.159364, 129.160998)
	    },
	    {
	        content: '<div>광안리 해수욕장<br><img src="/img/map/Gwangalli.jpg" sytle="width:352px; height:220px;"></div>',
	        latlng: new kakao.maps.LatLng(35.153244, 129.118983)
	    },
	    {
	        content: '<div>죽성성당(죽성드림세트장)<br><img src="/img/map/Jukseong.jpg" sytle="width:352px; height:220px;"></div>',
	        latlng: new kakao.maps.LatLng(35.241044, 129.248594)
	    },
	    {
	        content: '<div>해동용궁사<br><img src="/img/map/Haeundae.jpg" sytle="width:352px; height:220px;"></div>',
	        latlng: new kakao.maps.LatLng(35.188429, 129.223131)
	    },
	    {
	        content: '<div>삼락생태공원<br><img src="/img/map/samrak.jpg" sytle="width:352px; height:220px;"></div>',
	        latlng: new kakao.maps.LatLng(35.169482, 128.973170)
	    },
	    {
	        content: '<div>대변항<br><img src="/img/map/Deab.jpg" sytle="width:352px; height:220px;"></div>',
	        latlng: new kakao.maps.LatLng(35.169163, 129.230860)
	    },
	    {
	        content: '<div>연화리 해녀촌<br><img src="/img/map/yeunhwa.jpg" sytle="width:352px; height:220px;"></div>',
	        latlng: new kakao.maps.LatLng(35.046543, 129.228200)
	    },
	    {
	        content: '<div>다대포해수욕장<br><img src="/img/map/dadaepo.jpg" sytle="width:352px; height:220px;"></div>',
	        latlng: new kakao.maps.LatLng(35.169163, 128.962724)
	    },
	    {
	        content: '<div>을숙도 철새공원<br><img src="/img/map/bird.jpg" sytle="width:352px; height:220px;"></div>',
	        latlng: new kakao.maps.LatLng(35.104017, 128.939416)
	    },
	    {
	        content: '<div>자갈치시장<br><img src="/img/map/jagal.jpg" sytle="width:352px; height:220px;"></div>',
	        latlng: new kakao.maps.LatLng(35.096716, 129.030615)
	    },
	    {
	        content: '<div>부평깡통시장<br><img src="/img/map/can.jpg" sytle="width:352px; height:220px;"></div>',
	        latlng: new kakao.maps.LatLng(35.102167, 129.025837)
	    },
	    {
	        content: '<div>송도해수욕장<br><img src="/img/map/songdo.jpg" sytle="width:352px; height:220px;"></div>',
	        latlng: new kakao.maps.LatLng(35.075982, 129.016971)
	    },
	    {
	        content: '<div>초량차이나타운<br><img src="/img/map/china.jpg" sytle="width:352px; height:220px;"></div>',
	        latlng: new kakao.maps.LatLng(35.113733, 129.037927)
	    },
	    {
	        content: '<div>엑스더스카이<br><img src="/img/map/Xsky.jpg" sytle="width:352px; height:220px;"></div>',
	        latlng: new kakao.maps.LatLng(35.159597, 129.169731)
	    },
	    {
	        content: '<div>광안대교<br><img src="/img/map/gwanganbridge.jpg" sytle="width:352px; height:220px;"></div>',
	        latlng: new kakao.maps.LatLng(35.153733, 129.135797)
	    },
	    {
	        content: '<div>영화의거리<br><img src="/img/map/cinemastreat.jpg" sytle="width:352px; height:220px;"></div>',
	        latlng: new kakao.maps.LatLng(35.154762, 129.142846)
	    },
	    {
	        content: '<div>누리마루 전망대<br><img src="/img/map/nurimaru.jpg" sytle="width:352px; height:220px;"></div>',
	        latlng: new kakao.maps.LatLng(35.152229, 129.152523)
	    },
	    {
	        content: '<div>태종대 전망대<br><img src="/img/map/teajong.jpg" sytle="width:352px; height:220px;"></div>',
	        latlng: new kakao.maps.LatLng(35.050495, 129.088284)
	    },
	    {
	        content: '<div>부산 사직야구장<br><img src="/img/map/sajik.jpg" sytle="width:352px; height:220px;"></div>',
	        latlng: new kakao.maps.LatLng(35.194114, 129.061543)
	    },
	    {
	        content: '<div>현역입영센터<br><img src="/img/map/goundea.jpg" sytle="width:352px; height:220px;"></div>',
	        latlng: new kakao.maps.LatLng(35.173506, 129.102731)
	    },
	    {
	        content: '<div>이기대수변공원<br><img src="/img/map/igidea.jpg" sytle="width:352px; height:220px;"></div>',
	        latlng: new kakao.maps.LatLng(35.116687, 129.122529)
	    },
	    {
	        content: '<div>하늘마루전망대<br><img src="/img/map/skymaru.jpg" sytle="width:352px; height:220px;"></div>',
	        latlng: new kakao.maps.LatLng(35.098690, 129.010326)
	    },
	    {
	        content: '<div>감천문화마을<br><img src="/img/map/gamchen.jpg" sytle="width:352px; height:220px;"></div>',
	        latlng: new kakao.maps.LatLng(35.098423, 129.010103)
	    }
	];
	
	for (var i = 0; i < positions.length; i ++) {
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng // 마커의 위치
	    });
	
	    // 마커에 표시할 인포윈도우를 생성합니다 
	    var infowindow = new kakao.maps.InfoWindow({
	        content: positions[i].content // 인포윈도우에 표시할 내용
	    });
	
	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	}
	
	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}
	
	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
	
	/* 아래와 같이도 할 수 있습니다 */
	/*
	for (var i = 0; i < positions.length; i ++) {
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng // 마커의 위치
	    });
	
	    // 마커에 표시할 인포윈도우를 생성합니다 
	    var infowindow = new kakao.maps.InfoWindow({
	        content: positions[i].content // 인포윈도우에 표시할 내용
	    });
	
	    // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
	    // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    (function(marker, infowindow) {
	        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
	        kakao.maps.event.addListener(marker, 'mouseover', function() {
	            infowindow.open(map, marker);
	        });
	
	        // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
	        kakao.maps.event.addListener(marker, 'mouseout', function() {
	            infowindow.close();
	        });
	    })(marker, infowindow);
	}
	*/
	</script>
</section>