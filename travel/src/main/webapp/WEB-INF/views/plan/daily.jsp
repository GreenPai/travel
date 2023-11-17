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

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
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



            if (info.dayEl.style.backgroundColor === 'yellow') {
            	  // 이미 선택된 날짜의 색상이 변경된 경우, 원래대로 되돌림
            	  info.dayEl.style.backgroundColor = '';
                  alert('선택한 날짜: ' + info.dateStr);
            } else {
                  location.href = '/DailyUpdate?date=' + encodeURIComponent(info.dateStr);
            	  // 선택한 날짜의 색상을 변경
            	  info.dayEl.style.backgroundColor = 'yellow';
                  alert('선택한 날짜: ' + info.dateStr);	
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





























