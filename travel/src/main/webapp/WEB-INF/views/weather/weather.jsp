<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>       
<section>	
<style>
#weather {
    margin: 10px;
    padding: 5px;
    border: 1px solid white;
    border-radius: 3px;
    background-color: aliceblue;
    width: 95%;
}

.weather-info {
    margin-bottom: 10px;
    color: red;
}

.weather-info h3 {
    margin: 0;
    font-size: 18px;
    font-weight: bold;
}

.weather-info p {
    margin: 0;
    font-size: 14px;
}

/* 테이블 스타일 추가 */
table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: center;
}

tr:nth-child(even) {
    background-color: white;
    width: 100%;
}

th {
    background-color: #87A8FD;
    color: white;
} 
</style> 

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery.min.js"></script>
<script>
$(document).ready(function(){
    // 날씨 아이콘 가져오기
    function getWeatherIcon(iconCode) {
        return "https://openweathermap.org/img/w/" + iconCode + ".png";
    }

    $.ajax({
        url:"https://api.openweathermap.org/data/2.5/forecast?lat=35.1578&lon=129.0600&lang=kr&appid=32c9e2ef977a4ebfaedd69cc117bb42a",
        dataType:"json",
        success:function(city){
            console.log(city);
            $.each(city.list, function(key) {
                // 현재 날짜 및 시간 정보 구하기
                var now = new Date();
                var year = now.getFullYear();
                var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
                var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
                var today = year + '-' + mon + '-' + day;
                var week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');	// 요일

                // API에서 받는 날짜 및 시간 정보
                var date = city.list[key].dt_txt.substring(0,10);
                var time = city.list[key].dt_txt.substring(11,13);
                var yoil = new Date(date).getDay();
                var todayLabel = week[yoil];			    

                // 최고온도
                var max = (city.list[key].main.temp_max - 273).toFixed(2) + "˚C";
                
                // 최저온도
                var min = (city.list[key].main.temp_min - 273).toFixed(2) + "˚C";

                // 날씨
                var weath = city.list[key].weather[0].description;
                var iconCode = city.list[key].weather[0].icon; // 날씨 아이콘 코드
                var iconUrl = getWeatherIcon(iconCode); // 날씨 아이콘 URL

                // 시간을 체크하여 3시간 간격으로 데이터 출력
                if(time === '00' || time === '06' || time === '12' || time === '18' ){
                    $("#weatherTable").append("<tr><td>" + date + "</td><td>" + time + "시</td><td><img src='" + iconUrl + "' alt='weather icon'></td><td>" + max + "</td><td>" + min + "</td></tr>");
                }
            });
        }
    });
})
</script>

<div id="weather">
    <table id="weatherTable">
        <tr>
            <th>날짜</th>
            <th>시간</th>
            <th>날씨</th>
            <th>최고온도</th>
            <th>최저온도</th>
        </tr>
    </table>
</div>
</section>
