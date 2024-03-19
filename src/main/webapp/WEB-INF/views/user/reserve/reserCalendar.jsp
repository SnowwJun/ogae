<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약현황</title>
<link rel="stylesheet" href="resources/calendar/css/calendar.css">
<link rel="stylesheet" href="resources/calendar/css/reserCalendar.css">
<link rel="stylesheet" href="resources/calendar/css/reset.css">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="resources/calendar/js/reserCalendar.js"></script>
<script src="resources/calendar/js/index.global.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<style>
	tbody {
		column-count: 6;
	}
</style>
</head>
<body>
<div class="reserCalendar">
	<div class="dateTitle">
		<button type="button" class="prev">
			<img src="resources/calendar/img/prev.png" alt="이전">
		</button>
		<span class="month"></span>
		<button type="button" class="next">
			<img src="resources/calendar/img/next.png" alt="다음">
		</button>
		<p class="today">오늘은 <span></span> 입니다.</p>
	</div>
	<div class="reserStatus">
		<ul class="reserEx">
			<li><span class="possIcon icon"></span>예약가능</li>
			<li><span class="progIcon icon"></span>예약진행</li>
			<li><span class="succIcon icon"></span>예약완료</li>
			<li><span class="callIcon icon"></span>전화문의</li>
		</ul>
		<div class="roomPrice">
			<input id="price" type="checkbox">
			<label for="price">객실 요금보기</label>
		</div>
	</div>
	<table>
		<caption>실시간예약</caption>
		<colgroup>
			<col style="width: 14.28%;">
			<col style="width: 14.28%;">
			<col style="width: 14.28%;">
			<col style="width: 14.28%;">
			<col style="width: 14.28%;">
			<col style="width: 14.28%;">
			<col style="width: 14.28%;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">일요일</th>
				<th scope="col">월요일</th>
				<th scope="col">화요일</th>
				<th scope="col">수요일</th>
				<th scope="col">목요일</th>
				<th scope="col">금요일</th>
				<th scope="col">토요일</th>
			</tr>
		</thead>	
		<tbody>			
		</tbody>
	</table>
</div>
</body>
</html>