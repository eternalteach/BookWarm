<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="/warm/resources/css/calendar/core.main.css" rel="stylesheet">
<link href="/warm/resources/css/calendar/daygrid.main.css" rel="stylesheet">
<link href="/warm/resources/css/calendar/list.main.css" rel="stylesheet">
<script src="/warm/resources/js/calendar/core.main.js"></script>
<script src="/warm/resources/js/calendar/interaction.main.js"></script>
<script src="/warm/resources/js/calendar/daygrid.main.js"></script>
<script src="/warm/resources/js/calendar/list.main.js"></script>
<script src="/warm/resources/js/calendar/google-calendar.main.js"></script>


<!--  jQuery 사용을 위해 cdn 추가 -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>


<script>

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {

    plugins: [ 'interaction', 'dayGrid', 'list', 'googleCalendar' ],

    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,listYear'
    },

    displayEventTime: false, // don't show the time column in list view

    // THIS KEY WON'T WORK IN PRODUCTION!!!
    // To make your own Google API key, follow the directions here:
    // http://fullcalendar.io/docs/google_calendar/
    googleCalendarApiKey: 'AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE',

    // US Holidays
    events: 'en.usa#holiday@group.v.calendar.google.com',

    eventClick: function(arg) {
      // opens events in a popup window
      window.open(arg.event.url, 'google-calendar-event', 'width=700,height=600');

      arg.jsEvent.preventDefault() // don't navigate in main tab
    },

    loading: function(bool) {
      document.getElementById('loading').style.display =
        bool ? 'block' : 'none';
    }

  });

  calendar.render();
});

</script>

</head>
<body>

	<div id="calendar"></div>



</body>
</html>