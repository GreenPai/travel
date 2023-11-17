<!DOCTYPE html>
<html lang='ko'>
  <head>
    <meta charset='utf-8' />
     <style>
      #calendar {
        width: 1000px;
        height: 1000px;
      }
    </style>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
     <script>
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
          dateClick: function(info) {
            alert('선택한 날짜: ' + info.dateStr);
            alert('선택한 날짜: ' );
          }
        });
        calendar.render();
      });
    </script>
  </head>
  <body>
    <div id='calendar'></div>
  </body>
</html>