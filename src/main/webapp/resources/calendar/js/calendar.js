document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
	
	var today = new Date();
	
    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: '',
        center: 'title',
        right: 'today prev,next'
      },
      titleFormat: function(date) {
      	return date.date.year + '년' + (date.date.month + 1) + '월';
      },
      //initialDate: '2023-01-12',
      initialDate: today,
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      select: function(arg) {
        var title = prompt('Event Title:');
        if (title) {
          calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay
          })
        }
        calendar.unselect()
      },
      eventClick: function(arg) {
        if (confirm('Are you sure you want to delete this event?')) {
          arg.event.remove()
        }
      },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: [
        {
          title: '101호',
          start: '2023-11-16'
        },
        {
          title: '102호',
          start: '2023-11-18'
        },
        {
          title: '103호',
          start: '2023-11-21'
        },
        {
          title: '104호',
          start: '2023-11-28'
        }
      ]
    });

    calendar.render();
  });