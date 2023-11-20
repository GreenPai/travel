<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        /* 스타일링은 필요에 따라 수정하세요 */
        .weather-card {
            border: 1px solid #ddd;
            margin: 10px;
            padding: 20px;
            text-align: center;
        }
        .weather-card img {
            width: 50px;
            height: 50px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<head>
<meta charset="UTF-8">
<title>부산 날씨 정보</title>
</head>
<body>
    <h1>부산 날씨 정보</h1>
    <div id="weather_info">
        <!-- 날씨 정보가 여기에 채워집니다 -->
    </div>

    <script>
    $(document).ready(function(){
        function getWeatherIcon(iconCode) {
            return "https://openweathermap.org/img/w/" + iconCode + ".png";
        }

        $.ajax({
            url:"http://api.openweathermap.org/data/2.5/forecast/daily?q=busan&lang=kr&appid=6420f5c6c9c24587b163f1d71f86daf9",
            dataType:"json",
            success:function(city){
                $.each(city.list, function(key) {
                    var now = new Date();
                    var year = now.getFullYear();
                    var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
                    var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
                    var today = year + '-' + mon + '-' + day;
                    var week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');    

                    var date = city.list[key].dt_txt.substring(0,10);
                    var time = city.list[key].dt_txt.substring(11,13);
                    var yoil = new Date(date).getDay();
                    var todayLabel = week[yoil];                 

                    var max = (Math.round(city.list[key].temp.max) - 273) + "˚C";
                    var min = (Math.round(city.list[key].temp.min) - 273) + "˚C";
                    var rain = city.list[key].pop;

                    var weath = city.list[key].weather[0].description;
                    var iconCode = city.list[key].weather[0].icon;
                    var iconUrl = getWeatherIcon(iconCode);

                    var weatherCard = `
                    <div class="weather-card">
                        <h2>${todayLabel}</h2>
                        <img src="${iconUrl}" alt="${weath}">
                        <p>최고: ${max}</p>
                        <p>최저: ${min}</p>
                        <p>강수 확률: ${rain}</p>
                    </div>`;
                    
                    $('#weather_info').append(weatherCard);
                });
            }
        });
    });
    </script>
</body>
</html>
