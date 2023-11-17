<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/main.css" />

<script src="https://code.jquery.com/jquery-3.2.1.min.js" 
    integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" 
    crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
 <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
   <script>
   document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	        initialView: 'dayGridMonth',
	        dateClick: function(info) {
	            var date = info.dateStr; // 클릭한 날짜를 가져옵니다.
	            var url = 'https://api.openweathermap.org/data/2.5/forecast/daily?q=busan&lang=kr&appid=32c9e2ef977a4ebfaedd69cc117bb42a&units=metric&cnt=7';

	            $.getJSON(url, function(data) {
	                var list = data.list;
	                for (var i = 0; i < list.length; i++) {
	                    var dt = new Date(list[i].dt * 1000);
	                    var year = dt.getFullYear();
	                    var month = dt.getMonth() + 1;
	                    var day = dt.getDate();
	                    var formattedDate = year + '-' + (month < 10 ? '0' + month : month) + '-' + (day < 10 ? '0' + day : day);

	                    if (formattedDate === date) {
	                        var temp = list[i].temp.day;
	                        var description = list[i].weather[0].description;
	                        alert('선택한 날짜: ' + date + ', 기온: ' + temp + ', 날씨: ' + description);
	                        break;
	                    }
	                }
	            });

	            if (info.dayEl.style.backgroundColor === 'yellow') {
	                info.dayEl.style.backgroundColor = '';
	            } else {
	                info.dayEl.style.backgroundColor = 'yellow';
	            }
	        }
	    });
	    calendar.render();
	});
      
   
    </script>  	

<style>

  #main {
        padding: 0 200px; 
    }
    
    #calendar {
        width: 800px;
        height: 800px;
      }
      
</style>
</head>
<body>
   <br><br>

   

<div id='calendar'></div>

</body>
</html>





























