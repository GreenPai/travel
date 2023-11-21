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
	            var url = 'https://api.openweathermap.org/data/2.5/forecast?lat=35.1578&lon=129.0600&lang=kr&appid=32c9e2ef977a4ebfaedd69cc117bb42a';

	            $.getJSON(url, function(data) {
	                var list = data.list;
	                for (var i = 0; i < list.length; i++) {
	                    var dt = new Date(list[i].dt * 1000);
	                    var year = dt.getFullYear();
	                    var month = dt.getMonth() + 1;
	                    var day = dt.getDate();
	                    var hour = dt.getHours();
	                    var formattedDate = year + '-' + (month < 10 ? '0' + month : month) + '-' + (day < 10 ? '0' + day : day);

	                    if (formattedDate === date && hour === 12) {
	                        var tempMax = (Math.round(list[i].main.temp_max) - 273); // 최대 기온
	                        var tempMin = (Math.round(list[i].main.temp_min) - 273); // 최저 기온
	                        var description = list[i].weather[0].description; // 날씨 설명

	                        // 서버에 데이터 전송
	                        $.ajax({
	                            url: '/insertWeather', // 서버에서 데이터를 처리할 URL
	                            type: 'POST', // HTTP 메소드 (GET, POST 등)
	                            data: { // 서버에 전송할 데이터
	                                dt_txt: formattedDate,
	                                description: description,
	                                temp_max: tempMax,
	                                temp_min: tempMin
	                            },
	                            success: function(response) {
	                                // 서버에서 응답을 받았을 때의 처리
	                                alert('데이터 저장 성공');
	                            },
	                            error: function(error) {
	                                // 에러가 발생했을 때의 처리
	                                alert('데이터 저장 실패: ' + error);
	                            }
	                        });

	                        alert('선택한 날짜: ' + date + ', 최대 기온: ' + tempMax + '˚C' + ', 최저 기온: ' + tempMin + '˚C' + ', 날씨: ' + description);
	                        break;
	                    }
	                }
	            });

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
        margin-left: 50px;
      }

    #dailytable {
        width: 700px;
        height: 400px;
      }
    
  .grid-container {
        display: grid;
        grid-template-columns: 850px 500px;
        gap: 100px; /* 간격 설정 */
    } 
    
    
    table {
    width: 100%;
    border-collapse: collapse;
  }

  th, td {
    padding: 8px;
    text-align: center;
    border-bottom: 1px solid #ddd;
  }

  th {
    background-color: #343a40;
    color: white;
  }

.btn-container {
    display: flex;
    justify-content: right; /* 버튼을 좌우 정렬 */
    margin:5px;
    margin-top: 20px; /* 원하는 여백 설정 */
    width: 100%; /* 버튼을 전체 너비로 확장 */
    gap: 3px;
}
  
</style>
</head>
<body>
   <br><br>


<div class="grid-container" >
    <div id='calendar'></div>
<div id='dailytable'>
<table>
  <thead class="thead-dark">
    <div class="btn-container">
      <a href="/" class="btn btn-dark" id="Detail">HOME</a>
      <a href="/DeleteDaily" class="btn btn-dark" id="delete">날짜 초기화</a>
      <a href="/DetailDaily" class="btn btn-dark" id="Detail">일정 세우기</a>
     
    </div>            
    <tr>
      <th class="thead-dark" id="daytable">날짜</th>   
    </tr>
  </thead>
  
  <tbody id="infoTableBody">
    <tr>
      <td>
        <table>
          <tbody>
            <c:forEach var="day" items="${dayList}" varStatus="status">
            <tr onclick="showInfo(${status.index})">
            <td>${day.plan_date}</td>
             <c:choose>
             <c:when test="${day.tempMax ne '정보 없음'}">
             <td>${day.tempMax}˚C</td>
             </c:when>
             <c:otherwise>
            <td> </td>
            </c:otherwise>
            </c:choose>
            <c:choose>
            <c:when test="${day.tempMin ne '정보 없음'}">
            <td>${day.tempMin}˚C</td>
            </c:when>
            <c:otherwise>
            <td> </td>
            </c:otherwise>
            </c:choose>
            
            
             <c:choose>
             <c:when test="${day.main == 'Clear'}">
             <td><img src="img/clear.png" alt="이미지 설명" width="60" height="60">맑은 하늘</td>
             </c:when>
             <c:when test="${day.main == 'Clouds'}">
             <td><img src="img/fewcloud.png" alt="이미지 설명" width="60" height="60">구름이 조금 있는 상태</td>
             </c:when>       
             <c:when test="${day.main == 'rain'}">
             <td><img src="img/rain.png" alt="이미지 설명" width="60" height="60">비</td>
             </c:when>
             <c:when test="${day.main == 'thunderstorm'}">
             <td><img src="img/thunderstorm.png" alt="이미지 설명" width="60" height="60">천둥번개</td>
             </c:when>
             <c:when test="${day.main == 'Snow'}">
             <td><img src="img/snow.png" alt="이미지 설명" width="60" height="60">눈</td>
             </c:when>
             <c:when test="${day.main == 'mist'}">
             <td><img src="img/mist.png" alt="이미지 설명" width="60" height="60">안개</td>
             </c:when>           
            <c:otherwise>
            <td>          
            <td> </td>
            </td>
            </c:otherwise>
            </c:choose>
            
            
            
            
            
            
            

            
            

            </tr>
            </c:forEach>
          </tbody>
        </table>
      </td>
    </tr>
  </tbody>
</table>

</div>
</div>


</body>
</html>

