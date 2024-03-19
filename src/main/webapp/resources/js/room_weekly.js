/**
 * DoG 01 방 주간캘린더
 */
 
// 주간 달력 생성 함수
function createWeeklyCalendar() {
  const daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
  const today = new Date();
  const firstDay = new Date(today);
  firstDay.setDate(today.getDate() - today.getDay()); // 일요일로 이동
  const calendarContainer = document.getElementById("weekly-calendar");

  // 주간 달력 헤더 생성
  const calendarHeader = document.createElement("div");
  calendarHeader.classList.add("calendar-header");
  daysOfWeek.forEach(day => {
    const dayHeader = document.createElement("div");
    dayHeader.textContent = day;
    calendarHeader.appendChild(dayHeader);
  });
  calendarContainer.appendChild(calendarHeader);

  // 주간 달력 내용 생성
  for (let i = 0; i < 7; i++) {
    const calendarDay = document.createElement("div");
    calendarDay.classList.add("calendar-day");
    const day = new Date(firstDay);
    day.setDate(firstDay.getDate() + i);

    // 각 날짜에 해당하는 내용을 표시
    const dateLabel = document.createElement("div");
    dateLabel.textContent = day.getDate();
    calendarDay.appendChild(dateLabel);

    calendarContainer.appendChild(calendarDay);
  }
}

// 주간 달력 생성 함수 호출
createWeeklyCalendar();