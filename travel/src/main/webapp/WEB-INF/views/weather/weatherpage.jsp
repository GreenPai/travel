<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
  <%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>       
<section>	
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery.min.js"></script>
<script>
//오늘 날짜출력
	$(document).ready(function () {
	
	    function convertTime() {
	        var now = new Date();
	
	
	        var month = now.getMonth() + 1;
	        var date = now.getDate();
	
	        return month + '월' + date + '일';
	    }
	
	    var currentTime = convertTime();
	    $('.nowtime').append(currentTime);
	});
	
	
	//제이쿼리사용
	$.getJSON('http://api.openweathermap.org/data/2.5/weather?q=busan&appid=32c9e2ef977a4ebfaedd69cc117bb42a&units=metric',
	function (WeatherResult) {
	    //기온출력
	    $('.BusanNowtemp').append(WeatherResult.main.temp + ' °C');
	    $('.BusanFeelstemp').append(WeatherResult.main.feels_like + ' °C');
	    $('.BusanWindSpeed').append(WeatherResult.wind.speed + ' m/s');
	
	    //날씨아이콘출력
	    //WeatherResult.weater[0].icon
	    var weathericonUrl =
	        '<img src= "http://openweathermap.org/img/wn/'
	        + WeatherResult.weather[0].icon +
	        '.png" alt="' + WeatherResult.weather[0].description + '"/>'
	
	    $('.BusanIcon').html(weathericonUrl);
	});
</script>

<span class="nowtime"></span>
<span>현재날씨</span>
        
        <h3>부산</h3>
        <h3 class="BusanIcon"></h3>
        <h3 class="BusanNowtemp">현재기온:</h3>
        <h3 class="BusanFeelstemp">체감온도:</h3>
        <h3 class="BusanWindSpeed">풍속:</h3>
        
</section>





